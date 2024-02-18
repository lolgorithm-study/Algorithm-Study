package Week09;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Comparator;
import java.util.StringTokenizer;

public class BOJ_1931_회의실배정 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        int[][] meetings = new int[N][2];

        for (int i = 0; i < N; i++) 
        {
            StringTokenizer st = new StringTokenizer(br.readLine());
            meetings[i][0] = Integer.parseInt(st.nextToken());
            meetings[i][1] = Integer.parseInt(st.nextToken());
        }

       
        Arrays.sort(meetings, Comparator.comparingInt((int[] m) -> m[1]).thenComparingInt(m -> m[0]));

        int count = 0;
        int endTime = 0;

        for (int[] meeting : meetings) 
        {
            if (meeting[0] >= endTime) 
            {
                endTime = meeting[1];
                count++;
            }
        }

        System.out.println(count);
    }
}