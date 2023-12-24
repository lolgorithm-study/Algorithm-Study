package SQD;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;
import java.io.IOException;
import java.util.LinkedList;
import java.util.Queue;


public class No_10845 {
	
	
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    static int N, X = 0;
    static StringBuilder sb = new StringBuilder();
    static Queue<Integer> queue = new LinkedList<>();
    
    
    public static void main(String[] args) throws IOException {

    	N = Integer.parseInt(br.readLine());
    	
        for (int i = 0; i < N; i++) 
        {
        	
            StringTokenizer st = new StringTokenizer(br.readLine());
            // 원래는 두번재 매개 변수가 있고 두번째 매개변수가 어느 string 을 기준으로 토큰을 나누느냐 인데
            // 디폴트는 " " 임 즉 , push 3 이 들어오면 토큰이 push, 3 으로 나뉨.
            String command = st.nextToken(); // 토큰이 모여있는 뭉치(?) 배열을 pop 해주는거임.
            //값을 없애고 return 해줌 , 다음 토큰으로 넘어가짐.

            switch (command) 
            
            {
                case "push":
                    X = Integer.parseInt(st.nextToken());
                    queue.offer(X);
                    break;
                    /*
                     * push 3 으로 받으면 push, 3 으로 토크나이저로 나눌 수 있음. 
                     * 
                     */
                    
                case "pop":
                    if (queue.isEmpty()) sb.append("-1\n"); 
                    else sb.append(queue.poll()).append("\n");
                    break;
                    
                case "size":
                    sb.append(queue.size()).append("\n");
                    break;
                    
                case "empty":
                    if (queue.isEmpty()) sb.append("1\n");
                    else sb.append("0\n");
                    break;
                    
                case "front":
                    if (queue.isEmpty()) sb.append("-1\n");
                    else sb.append(queue.peek()).append("\n");
                    break;
                    
                case "back":
                    if (queue.isEmpty())sb.append("-1\n");
                    
                    else sb.append(X + "\n");
                    break;
            }
        }
        System.out.println(sb);
    }
}
