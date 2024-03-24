package Week12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BOJ_2470_두용액 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        int[] arr = new int[N];
        StringTokenizer st = new StringTokenizer(br.readLine());
        
        for (int i = 0; i < N; i++)
            arr[i] = Integer.parseInt(st.nextToken());
        
        Arrays.sort(arr);
        
        int left = 0, right = N - 1, minSum = Integer.MAX_VALUE, ans1 = 0, ans2 = 0;
        
        while (left < right) 
        {
            int sum = arr[left] + arr[right];
            if (Math.abs(sum) < minSum) 
            {
                minSum = Math.abs(sum);
                ans1 = arr[left];
                ans2 = arr[right];
            }
            
            if (sum < 0)
                left++;
            
            else
                right--;
            
        }
        System.out.println(ans1 + " " + ans2);
    }
}
