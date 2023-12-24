package SQD;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.StringTokenizer;

public class No_1021{
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // 첫번째 줄 입력 받기
        StringTokenizer st = new StringTokenizer(br.readLine());
        int N = Integer.parseInt(st.nextToken()); // 큐의 크기
        int M = Integer.parseInt(st.nextToken()); // 뽑아내려고 하는 수의 개수

        // 큐 초기화
        LinkedList<Integer> queue = new LinkedList<>();
        for (int i = 1; i <= N; i++) {
            queue.add(i);
        }

        // 두번째 줄 입력, 뽑는 수 값 받아서 targets 배열에 넣기
        st = new StringTokenizer(br.readLine());
        int[] targets = new int[M];
        for (int i = 0; i < M; i++)
            targets[i] = Integer.parseInt(st.nextToken());

        int cnt = 0;
        for (int i = 0; i < M; i++) 
        {
            int target = targets[i];

            // 인덱스 위치 찾기
            int idx = queue.indexOf(target);

            // 좌, 우 비교
            int left = idx;
            int right = queue.size() - idx;

            // 더 짧은 방향으로 이동
            if (left <= right) 
            {
                while (queue.peek() != target) 
                {
                    queue.addLast(queue.pollFirst());
                    cnt++;
                }
            }
            
            else 
            {
                while (queue.peek() != target) 
                {
                    queue.addFirst(queue.pollLast());
                    cnt++;
                }
            }
            // 뽑아야함
            queue.poll();
        }

        System.out.println(cnt);

        br.close();
    }
}
