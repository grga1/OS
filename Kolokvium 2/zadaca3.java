package  tcp;

import java.io.*;
import java.net.Socket;
import java.util.Date;

public class WorkerThread extends Thread{
 Socket socket;
 String file;

    public WorkerThread(Socket socket, String file) {
        this.socket = socket;
        this.file = file;
    }

    @Override
    public void run() {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter writer = new PrintWriter(socket.getOutputStream(),true);
            FileWriter fw = new FileWriter(file,true);


            String line = reader.readLine();
            String ip = socket.getInetAddress().getHostAddress();

            if (line.equals("HANDSHAKE")){
                writer.println("Logged In<"+ip+">");
            }

            while ((line=reader.readLine())!=null){
                if (line.equals("STOP")) {
                    writer.println("LOGGED OUT");
                    break;}
                synchronized (Server.class) {
                    Server.sum += Integer.parseInt(line);
                }
                   Date date = new Date();

                fw.write(line + " - from: " + ip + " at: " + date + "\n");
                   fw.flush();

            }

            socket.close();
            fw.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
-------------------------------------------------------------------------------------------------
package tcp;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class Server extends Thread{
    int port;
    String file;
    public  static int sum=0;

public static int counter;
public static List<WorkerThread> clients = new ArrayList<>();
    public Server(int port, String file) {
        this.port = port;
        this.file = file;
    }

    @Override
    public void run() {
        try {
            ServerSocket serverSocket = new ServerSocket(port);

            while (true){
                Socket clientSocket = serverSocket.accept();
                WorkerThread workerThread = new WorkerThread(clientSocket,file);
                workerThread.start();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
        String logFile = System.getenv("NUMBERS_FILE");
        new Server(7319, logFile).start();
    }
}
