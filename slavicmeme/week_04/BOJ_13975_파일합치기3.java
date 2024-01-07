package Week04_heap;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.PriorityQueue;
import java.util.StringTokenizer;

public class BOJ_13975_파일합치기3
{
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    static StringTokenizer st;
    static StringBuilder sb = new StringBuilder();
    static PriorityQueue<Long> pq;
    static int N, M ;
    static Long x, y, sum = 0L; // 반드시 LONG 을 써줘야함 안그러면 에러 남
    
    public static void main(String[] args) throws Exception 
    {

        int N = Integer.parseInt(br.readLine());

        for(int i = 1; i <= N; i++) 
        {
            M = Integer.parseInt(br.readLine());
            st = new StringTokenizer(br.readLine());
            pq = new PriorityQueue<>(); // Queue 새로 만들기
            
            for(int k = 0; k < M; k++)
                pq.add(Long.parseLong(st.nextToken()));
            
            sum = 0L;
            
            while(pq.size() > 1)// 더하고 다시 넣고 정렬하고 반복
            {
                x = pq.poll();
                y = pq.poll();
                sum += x+y; // sum 에 값을 모두 저장
                pq.add(x+y);
            }
            
            sb.append(sum + "\n");
        }
        System.out.printf(sb.toString());
    }
}