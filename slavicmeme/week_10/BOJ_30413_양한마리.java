package Week10;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BOJ_30413_양한마리 {
    static final long MOD = 1000000007;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        long A = Long.parseLong(st.nextToken());
        long B = Long.parseLong(st.nextToken());

        long result = sumOfSequence(A, B);
        System.out.println(result);
    }

    static long sumOfSequence(long A, long B) {
        long firstTerm = 1;
        long commonRatio = A;
        long numberOfTerms = B;

        long sum = (firstTerm * (1 - pow(commonRatio, numberOfTerms, MOD))) % MOD;
        sum = (sum * pow(1 - commonRatio, MOD - 2, MOD)) % MOD; // modular inverse of (1 - commonRatio) modulo MOD

        return (sum + MOD) % MOD; // to handle negative values
    }

    static long pow(long base, long exponent, long MOD) {
        if (exponent == 0)
            return 1;
        else if (exponent == 1)
            return base % MOD;

        long half = pow(base, exponent / 2, MOD) % MOD;
        long result = (half * half) % MOD;

        if (exponent % 2 == 1)
            result = (result * base) % MOD;

        return result;
    }
}
