package Week06;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class BOJ_14569_시간표짜기 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        ArrayList<ArrayList<Integer>> subjects = new ArrayList<>();

        for (int i = 0; i < N; i++)
        {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int k = Integer.parseInt(st.nextToken());
            
            ArrayList<Integer> times = new ArrayList<>();
            for (int j = 0; j < k; j++)
                times.add(Integer.parseInt(st.nextToken()));
            
            subjects.add(times);
        }

        // 학생 수 입력
        int M = Integer.parseInt(br.readLine());

        // 각 학생들의 비어 있는 교시 정보 입력 및 처리
        for (int i = 0; i < M; i++) 
        {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int p = Integer.parseInt(st.nextToken());
            
            ArrayList<Integer> availableTimes = new ArrayList<>();
            
            for (int j = 0; j < p; j++)
                availableTimes.add(Integer.parseInt(st.nextToken()));

            // 들을 수 있는 과목 개수 카운트
            int count = 0;
            for (ArrayList<Integer> subjectTimes : subjects) {
                if (canTakeSubject(subjectTimes, availableTimes))
                    count++;
            }

            // 결과 출력
            System.out.println(count);
        }
    }

    // 과목의 수업 시간과 학생의 비어 있는 교시를 비교하여 과목을 들을 수 있는지 여부 반환
    private static boolean canTakeSubject(ArrayList<Integer> subjectTimes, ArrayList<Integer> availableTimes) {
        for (int time : subjectTimes) 
        {
            if (!availableTimes.contains(time))
                return false;
        }
        return true;
    }
}
