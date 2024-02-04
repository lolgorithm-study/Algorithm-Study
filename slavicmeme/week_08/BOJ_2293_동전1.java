package Week08;

import java.io.*;
import java.util.StringTokenizer;


public class BOJ_2293_동전1 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        StringTokenizer st = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(st.nextToken());
        int k = Integer.parseInt(st.nextToken());

        int[] coinValues = new int[n];
        
        for (int i = 0; i < n; i++) 
            coinValues[i] = Integer.parseInt(br.readLine());

        int[] dp = new int[k + 1];
        
        dp[0] = 1;
        /*
         * 만들어야 하는 수가 0 원 일때 -> 그 어떤 동전도 올려놓지 않으면 된다. -> 오직 한 가지.
         */

        for (int coinValue : coinValues)
        {
            for (int i = coinValue; i <= k; i++)
            {
            	dp[i] += dp[i - coinValue];
            	System.out.println(dp[i]);
            }
        }

        System.out.println(dp[k]);

        br.close();
    }
}