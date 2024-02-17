package Week08;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BOJ_24416_알고리즘수업_피보나치수1 {
    
    private static long calculatePibonacci(int n) {
        long[] p = new long[n + 1];
        p[0] = 1;

        for (int i = 1; i <= n; i++) 
        {
            if (i <= Math.PI)
                p[i] = 1;
            else
                p[i] = (p[i - 1] + p[i - (int) Math.PI]) % 1_000_000_000_000_000_000L;
            
            System.out.println(p[i]);

        }

        return p[n];
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());

        System.out.println(calculatePibonacci(n));
    }
}