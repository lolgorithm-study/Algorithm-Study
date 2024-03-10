package Week11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BOJ_1654_랜선자르기{
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int K = Integer.parseInt(st.nextToken());
        int N = Integer.parseInt(st.nextToken());

        int[] lanCables = new int[K];


        for (int i = 0; i < K; i++) {
            lanCables[i] = Integer.parseInt(br.readLine());
        }

        Arrays.sort(lanCables);

        long start = 1;
        long end = lanCables[K - 1];

        long answer = 0;


        while (start <= end) 
        {
            long mid = (start + end) / 2;
            long count = 0;


            for (int cable : lanCables)
                count += cable / mid;

            if (count >= N) 
            {
                answer = mid;
                start = mid + 1;
            } 
            else 
                end = mid - 1; // 범위를 왼쪽으로 이동
        }

        System.out.println(answer);
    }
}