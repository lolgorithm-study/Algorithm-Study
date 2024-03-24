package Week12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BOJ_15565_귀여운라이언 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        StringTokenizer st = new StringTokenizer(br.readLine());
        int N = Integer.parseInt(st.nextToken());
        int K = Integer.parseInt(st.nextToken());
        
        int[] dolls = new int[N];
        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < N; i++) {
            dolls[i] = Integer.parseInt(st.nextToken());
        }
        
        int left = 0;
        int right = 0;
        int lionCount = 0;
        int minWindowSize = Integer.MAX_VALUE;
        
        while (right < N) 
        {
            if (dolls[right] == 1)
                lionCount++;

            while (lionCount >= K) 
            {
                minWindowSize = Math.min(minWindowSize, right - left + 1); // 현재 윈도우의 크기 갱신
                
                if (dolls[left] == 1) 
                    lionCount--;
                
                left++;
            }
            
            right++;
        }
        
        if (minWindowSize == Integer.MAX_VALUE)
            System.out.println(-1);
        else
            System.out.println(minWindowSize);
        br.close();
    }
}