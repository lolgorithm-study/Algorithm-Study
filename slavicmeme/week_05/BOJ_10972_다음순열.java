package Week05;

import java.io.*;
import java.util.*;

public class BOJ_10972_다음순열 
{
    static int n;
    static int[] nums;
    
    public static void main(String[] args) throws IOException 
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        n = Integer.parseInt(st.nextToken());
        nums = new int[n];
        
        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < n; i++)
            nums[i] = Integer.parseInt(st.nextToken());

        // 다음 순열이 있는지 확인하고 있으면 출력한다. 없으면 -1을 출력한다.
        if (hasNextPerm()) 
        {
            StringBuilder sb = new StringBuilder();
            for (int i : nums)
                sb.append(i).append(" ");
            sb.append("\n");
            System.out.println(sb);
        } 
        else
            System.out.println(-1);
        
        br.close();
    }

    private static boolean hasNextPerm() 
    {

        int i = nums.length - 1;
        
        while (i > 0 && nums[i - 1] > nums[i]) 
        	i--;

        if (i == 0) 
        	return false;

        int j = nums.length - 1;
        while (nums[i - 1] > nums[j]) j--;

        swap(i - 1, j);


        j = nums.length - 1;
        while (i < j) 
        {
            swap(i, j);
            i++; 
            j--;
        }
        return true;
    }

    private static void swap(int a, int b) 
    {
        int tmp = nums[a];
        nums[a] = nums[b];
        nums[b] = tmp;
    }
}