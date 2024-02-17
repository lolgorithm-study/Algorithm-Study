package Week08;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BOJ_1737_Pibonacci {
    static final long MOD = 1_000_000_000_000_000_000L;
    static long[][] dp;

    public static void main(String[] args) throws IOException 
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        double n = Double.parseDouble(br.readLine());
        dp = new long[1001][1001];
        System.out.println(Pibonacci(0, 0, n));
        br.close();
    }

    static long Pibonacci(int i, int j, double n) 
    {
        double curr = n - 1 * i - Math.PI * (double) j;
        if (0 <= curr && curr <= Math.PI) return 1;
        else if (curr < 0) return 0;

        if (dp[i][j] != 0) return dp[i][j];

        return dp[i][j] = (Pibonacci(i + 1, j, n) + Pibonacci(i, j + 1, n)) % MOD;
    }
}


