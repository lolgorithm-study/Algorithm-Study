package Week06;
 
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BOJ_7568_덩치 {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());

        int[][] people = new int[n][2]; // 몸무게, 키
        int[] ranks = new int[n];

        // 각 사람의 덩치 정보 입력 받기
        for (int i = 0; i < n; i++) 
        {
            StringTokenizer st = new StringTokenizer(br.readLine());
            people[i][0] = Integer.parseInt(st.nextToken()); // 몸무게
            people[i][1] = Integer.parseInt(st.nextToken()); // 키
        }

        // 덩치 등수 계산
        for (int i = 0; i < n; i++) 
        {
            for (int j = 0; j < n; j++) 
            {
                if (i != j && people[i][0] < people[j][0] && people[i][1] < people[j][1])
                    ranks[i]++;
            }
        }

        for (int i = 0; i < n; i++)
            System.out.print((ranks[i] + 1) + " ");
    }
}
