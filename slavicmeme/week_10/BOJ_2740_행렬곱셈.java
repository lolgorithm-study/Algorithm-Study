package Week10;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BOJ_2740_행렬곱셈{
    public static void main(String[] args) throws IOException 
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        int M = Integer.parseInt(st.nextToken());

        int[][] A = new int[N][M];

        for (int i = 0; i < N; i++) 
        {
            st = new StringTokenizer(br.readLine());
            for (int j = 0; j < M; j++)
                A[i][j] = Integer.parseInt(st.nextToken());
        }

        st = new StringTokenizer(br.readLine());
        M = Integer.parseInt(st.nextToken());
        int K = Integer.parseInt(st.nextToken());

        int[][] B = new int[M][K];

        for (int i = 0; i < M; i++) 
        {
            st = new StringTokenizer(br.readLine());
            for (int j = 0; j < K; j++)
                B[i][j] = Integer.parseInt(st.nextToken());
        }

        int[][] result = multiplyMatrices(A, B);

        for (int[] row : result) 
        {
            for (int num : row)
                System.out.print(num + " ");
            
            System.out.println();
        }
    }

    public static int[][] multiplyMatrices(int[][] A, int[][] B) {
        int N = A.length;
        int M = B.length;
        int K = B[0].length;

        int[][] result = new int[N][K];

        for (int i = 0; i < N; i++) 
        {
            for (int j = 0; j < K; j++) 
            {
                for (int k = 0; k < M; k++)
                    result[i][j] += A[i][k] * B[k][j];
            }
        }

        return result;
    }
}