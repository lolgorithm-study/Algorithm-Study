package Week11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

public class BOJ_2776_암기왕 {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());

        for(int i = 0; i < N; i ++)
        {
            Set<Integer> set = new HashSet<>();
            StringBuilder sb = new StringBuilder();
            int M = Integer.parseInt(br.readLine());

            StringTokenizer st = new StringTokenizer(br.readLine());
            for(int j = 0; j < M; j++)
                set.add(Integer.parseInt(st.nextToken()));

            int K = Integer.parseInt(br.readLine());

            st = new StringTokenizer(br.readLine());
            for(int z = 0; z < K; z++)
                sb.append(set.contains(Integer.parseInt(st.nextToken()))? 1 : 0).append("\n");

            System.out.print(sb);
        }
    }
}