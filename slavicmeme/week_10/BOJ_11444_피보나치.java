package Week10;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;


/*
 * 점화식을 바꿔 boza~
 * F(n) = F(n-1) + F(n-2) =>
 * 
 * matrix multiply
 * (F(n),F(n-1)) = (1, 1, 1, 0) * (F(n-1), F(n-2))
 * 
 */
public class BOJ_11444_피보나치 {
    static final long MOD = 1_000_000_007;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        long n = Long.parseLong(br.readLine());

        if (n <= 1)
        {
            System.out.println(n);
            return;
        }

        long[][] matrix = {{1, 1}, {1, 0}};
        matrix = pow(matrix, n - 1);
        System.out.println(matrix[0][0]);
    }

    static long[][] multiply(long[][] a, long[][] b) {
        long[][] result = new long[2][2];
        result[0][0] = (a[0][0] * b[0][0] + a[0][1] * b[1][0]) % MOD;
        result[0][1] = (a[0][0] * b[0][1] + a[0][1] * b[1][1]) % MOD;
        result[1][0] = (a[1][0] * b[0][0] + a[1][1] * b[1][0]) % MOD;
        result[1][1] = (a[1][0] * b[0][1] + a[1][1] * b[1][1]) % MOD;
        return result;
    }

    static long[][] pow(long[][] matrix, long exponent) 
    {
        if (exponent == 1)
            return matrix;

        long[][] half = pow(matrix, exponent / 2);
        long[][] result = multiply(half, half);

        if (exponent % 2 == 1)
            result = multiply(result, matrix);

        return result;
    }
}
