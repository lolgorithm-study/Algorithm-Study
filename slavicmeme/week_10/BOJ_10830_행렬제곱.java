package Week10;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;


public class BOJ_10830_행렬제곱{
    static int MOD = 1000;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        long B = Long.parseLong(st.nextToken());

        int[][] matrix = new int[N][N]; // 2D Tensor.

        for (int i = 0; i < N; i++) 
        {
            st = new StringTokenizer(br.readLine());
            for (int j = 0; j < N; j++)
                matrix[i][j] = Integer.parseInt(st.nextToken()) % MOD;
        }

        int[][] result = pow(matrix, B);

        for (int i = 0; i < N; i++) 
        {
            for (int j = 0; j < N; j++)
                System.out.print(result[i][j] + " ");
            
            System.out.println();
        }
    }

    
    /*
     * 지수 를 절반으로 나누어서 재귀를 호출합니다. 지수가 홀수인 경우 A^(B/2) * A^(B/2) * A 를 계산하고
     * 짝수인 경우 A^(B/2) * A^(B/2) 계산함니다.
     * 
     */

    
    static int[][] pow(int[][] matrix, long exponent) 
    {
        int N = matrix.length;
        int[][] result = new int[N][N];

        // 단위 행렬로 초기화
        for (int i = 0; i < N; i++)
            result[i][i] = 1;

        // 행렬 지수화 
        // https://ko.wikipedia.org/wiki/%ED%96%89%EB%A0%AC_%EC%A7%80%EC%88%98_%ED%95%A8%EC%88%98
        while (exponent > 0) 
        {
            if (exponent % 2 == 1)
                result = multiply(result, matrix);
            
            matrix = multiply(matrix, matrix);
            exponent /= 2;
        }

        return result;
    }

    static int[][] multiply(int[][] A, int[][] B) 
    {
        int N = A.length;
        int[][] result = new int[N][N];

        for (int i = 0; i < N; i++) 
        {
            for (int j = 0; j < N; j++) 
            {
                for (int k = 0; k < N; k++) 
                {
                    result[i][j] += A[i][k] * B[k][j];
                    result[i][j] %= MOD; // 결과에 MOD
                }
            }
        }

        return result;
    }
}
