package Week12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BOJ_22862_가장긴짝수연속한부분수열 {
    static int n, k;
    static int[] arr;
    static int max;
    static int count;
    static boolean[] check;
    static int first = 1, second = 1;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        n = Integer.parseInt(st.nextToken());
        k = Integer.parseInt(st.nextToken());
        check = new boolean[n + 1];
        arr = new int[n + 1];
        st = new StringTokenizer(br.readLine());
        for (int i = 1; i <= n; i++) 
        {
            int num = Integer.parseInt(st.nextToken());
            arr[i] = num;
            if (num % 2 != 1)
                check[i] = true;
        }
        solve();
        System.out.println(max);
    }

    public static void solve() 
    {
        while (second <= n)
        {
            if (count < k) 
            {
                if (!check[second])
                    count++;
                
                second++;
                max = Math.max(max, second - first - count);
            } 
            
            else if (check[second]) 
            {
                second++;
                max = Math.max(max, second - first - count);
            } 
            
            else if (count == k && !check[second]) 
            {
                if (!check[first])
                    count--;
                
                first++;
            }
        }
    }
}
