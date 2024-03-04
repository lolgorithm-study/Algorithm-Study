package Week10;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BOJ_1629_곱셈{
    static long MOD;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        long A = Long.parseLong(st.nextToken());
        long B = Long.parseLong(st.nextToken());
        MOD = Long.parseLong(st.nextToken());

        long result = pow(A, B);
        System.out.println(result);
    }

    static long pow(long base, long exponent) 
    {
        if (exponent == 0)
            return 1;
        else if (exponent == 1)
            return base % MOD;

        long half = pow(base, exponent / 2);
        long result = (half * half) % MOD;

        if (exponent % 2 == 1)
            result = (result * base) % MOD;

        return result;
    }
}
