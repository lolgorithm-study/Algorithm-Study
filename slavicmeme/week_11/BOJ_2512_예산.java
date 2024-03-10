package Week11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BOJ_2512_예산 {
    public static void main(String[] args) throws IOException 
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        int[] budgets = new int[N];
        StringTokenizer st = new StringTokenizer(br.readLine());
        int total = 0;

        for (int i = 0; i < N; i++) 
        {
            budgets[i] = Integer.parseInt(st.nextToken());
            total += budgets[i];
        }

        Arrays.sort(budgets);

        int M = Integer.parseInt(br.readLine());

        int start = 0;
        int end = budgets[N - 1];
        int answer = 0;

        while (start <= end) 
        {
            int mid = (start + end) / 2;
            int sum = 0;

            for (int budget : budgets)
                sum += Math.min(budget, mid);

            if (sum <= M) 
            {
                answer = mid;
                start = mid + 1;
            } 
            
            else
                end = mid - 1;
        }

        System.out.println(answer);
    }
}
