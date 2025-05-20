package tcp;
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class Vezba {
    class TcpServer extends Thread{
        private int port;
        String fileOutput;

        public TcpServer(int port, String fileOutput) {
           this.port=port;
           this.fileOutput=fileOutput;
        }

        public void listen() {
           try{
               ServerSocket serverSocket = new ServerSocket(port);
                while (true){
                    Socket clientSocket = serverSocket.accept();
                    SocketWorkerThread worker = new SocketWorkerThread(clientSocket,fileOutput);
                    worker.start();
                }

           } catch (IOException e) {
               throw new RuntimeException(e);
           }
        }
    }

    class TcpClient extends Thread{

        private Socket socket = null;
       private BufferedReader reader = null;
       private PrintWriter writer = null;

        public TcpClient(String serverIpAddress, int port) {
            try {
                socket = new Socket(serverIpAddress, port);
                 reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                 writer = new PrintWriter(socket.getOutputStream(),true);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        @Override
        public void run() {

            try {
                String msg;
                while ((msg=reader.readLine())!=null){
                    System.out.println("Server:"+msg);
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        public void sendMessage(String msg){
            writer.println(msg);
        }
    }

    class SocketWorkerThread extends Thread{
 Socket socket;
 String dir;
        public SocketWorkerThread(Socket socket, String dir) {
            this.socket=socket;
            this.dir=dir;
        }

        @Override
        public void run() {
            try{
              BufferedReader  reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
              PrintWriter  writer = new PrintWriter(socket.getOutputStream(),true);
             FileWriter file = new FileWriter("231008.txt", true);

             String msg ;
             while ((msg=reader.readLine())!=null) {
              String[] parts = msg.split(" ");
                 if (parts[0].equalsIgnoreCase("COPY")) {
                     Path source = Paths.get( parts[1]);
                     Path destination = Paths.get(parts[2]);
                     Files.copy(source,destination,StandardCopyOption.REPLACE_EXISTING);
                 } else if (parts[0].equalsIgnoreCase("LIST")) {
                    File filce = new File(parts[1]);
                    File[] files = filce.listFiles();
                    for(File fil:files) {
                        if (fil.exists() && fil.getName().endsWith(".txt")) {
                            writer.println(fil.getName() + " " + fil.length() + " B");
                        }
                    }
                 } else if (parts[0].equalsIgnoreCase("DELETE")) {
                             File filce = new File(parts[1]);
                             if (filce.exists()&&filce.getName().endsWith(".txt")){
                                 if (filce.delete()){
                                     writer.println("SUCCESS: File deleted.");

                                 }else{
                                     System.out.println("Problem with deleting");
                                 }
                             }else{
                                 System.out.println("It's not a file");
                             }
                 } else {
                     System.out.println("ERROR");
                 }
             }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static void main(String[] args) {

        Vezba program = new Vezba();
        TcpServer server = program.new TcpServer(7952,"a.txt");
             server.start();
             TcpClient client = program.new TcpClient("localhost",7952);
             client.start();
    }
}
