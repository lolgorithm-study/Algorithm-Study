package Week12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BOJ_3273_두수의합 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int n = Integer.parseInt(br.readLine());
        
        int[] sequence = new int[n];
        StringTokenizer st = new StringTokenizer(br.readLine());
        for (int i = 0; i < n; i++)
            sequence[i] = Integer.parseInt(st.nextToken());
        
        int x = Integer.parseInt(br.readLine());

        int left = 0;
        int right = n - 1;
        int count = 0;
        
        Arrays.sort(sequence);
        while (left < right) 
        {
            int sum = sequence[left] + sequence[right];
            if (sum == x) 
            {
                count++;
                left++;
                right--;
            } 
            else if (sum < x)
                left++;
            else
                right--;
        }
        
        System.out.println(count);
    }
}
