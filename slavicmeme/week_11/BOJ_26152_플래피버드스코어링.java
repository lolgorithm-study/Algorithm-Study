package Week11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BOJ_26152_플래피버드스코어링 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        int[] A = new int[N];
        int[] B = new int[N];
        int[] C = new int[N];
        
        StringTokenizer st = new StringTokenizer(br.readLine());
        for (int i = 0; i < N; i++)
            A[i] = Integer.parseInt(st.nextToken());
        
        st = new StringTokenizer(br.readLine());
        
        for (int i = 0; i < N; i++) 
        {
            B[i] = Integer.parseInt(st.nextToken());
            C[i] = A[i] - B[i];
        }
        
        for (int i = 1; i < N; i++)
            if (C[i] > C[i - 1])
                C[i] = C[i - 1];
        
        for (int i = 0; i < N; i++)
            C[i] = -C[i];
        
        Arrays.sort(C);

        int Q = Integer.parseInt(br.readLine());
        int[] W = new int[Q];
        
        st = new StringTokenizer(br.readLine());
        
        for (int i = 0; i < Q; i++)
            W[i] = Integer.parseInt(st.nextToken());

        for (int bird : W) 
        {
            int result = binarySearch(C, -bird);
            System.out.println(result);
        }

        br.close();
    }

    private static int binarySearch(int[] arr, int target) 
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
