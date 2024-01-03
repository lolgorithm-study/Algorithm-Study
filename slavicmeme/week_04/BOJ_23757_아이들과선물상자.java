package LOLGAYMING;

import java.io.*;
import java.util.*;

public class BOJ_23757_아이들과선물상자 {
	
	static PriorityQueue<Integer> q = new PriorityQueue<>(Collections.reverseOrder());
    static BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    static StringBuilder sb = new StringBuilder();
    static StringTokenizer st;
    static int N, M, E;
    static boolean flag = false;
    
    public static void main(String[] args) throws Exception {
        
    	st = new StringTokenizer(br.readLine(), " ");


        N = Integer.parseInt(st.nextToken());
        M = Integer.parseInt(st.nextToken());
        

        st = new StringTokenizer(br.readLine(), " ");
        for (int i = 0; i < N; i++) 
        {
            E = Integer.parseInt(st.nextToken());
            q.offer(E);

        }
        
        st = new StringTokenizer(br.readLine(), " ");
        for (int i = 0; i < M; i++) 
        {
            int child = Integer.parseInt(st.nextToken());
            if (q.peek() >= child) // Q의 가장 작은 값이 child 보다 작을때
            {
                q.offer(q.peek() - child); // q.peek() - chikld <- q
                q.poll(); // dequeue
            } 
            else
                flag = true;
            
        }

        if (flag == true)
            sb.append("0");
        else
            sb.append("1");
        
        bw.write(sb.toString());
        bw.flush();
        
        bw.close();
        br.close();
    }
}