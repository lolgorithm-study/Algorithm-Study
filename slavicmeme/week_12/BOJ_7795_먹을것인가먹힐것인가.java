package Week12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BOJ_7795_먹을것인가먹힐것인가 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int T = Integer.parseInt(br.readLine());
        
        for (int t = 0; t < T; t++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int N = Integer.parseInt(st.nextToken());
            int M = Integer.parseInt(st.nextToken());
            
            int[] A = new int[N];
            int[] B = new int[M];
            
            st = new StringTokenizer(br.readLine());
            for (int i = 0; i < N; i++)
                A[i] = Integer.parseInt(st.nextToken());
            

            st = new StringTokenizer(br.readLine());
            for (int i = 0; i < M; i++)
                B[i] = Integer.parseInt(st.nextToken());
            
            Arrays.sort(A);
            
            int count = 0;

            for (int i = 0; i < M; i++) 
            {
                int index = upper(A, B[i]);
                count += (N - index);
            }
            
            System.out.println(count);
        }
    }
    
    public static int upper(int[] arr, int target) 
    {
        int left = 0;
        int right = arr.length;
        
        while (left < right) 
        {
            int mid = (left + right) / 2;
            
            if (arr[mid] <= target)
                left = mid + 1;
            else
                right = mid;
        }
        
        return left;
    }
}
