package Week11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.StringTokenizer;

public class BOJ_1920_수찾기 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        HashSet<Integer> set = new HashSet<>();
        StringTokenizer st = new StringTokenizer(br.readLine());

        // HashSet 초기화
        for (int i = 0; i < N; i++)
            set.add(Integer.parseInt(st.nextToken()));

        int M = Integer.parseInt(br.readLine());
        st = new StringTokenizer(br.readLine());

        // 각 수가 HashSet에 있는지 확인
        for (int i = 0; i < M; i++) 
        {
            int target = Integer.parseInt(st.nextToken());
            if (set.contains(target))
                System.out.println(1);
            else
                System.out.println(0);
        }
    }
}