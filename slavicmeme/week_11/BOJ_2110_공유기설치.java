package Week11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BOJ_2110_공유기설치 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        int C = Integer.parseInt(st.nextToken());

        int[] houses = new int[N];
        for (int i = 0; i < N; i++)
            houses[i] = Integer.parseInt(br.readLine());

        Arrays.sort(houses);

        int answer = binarySearch(houses, C);
        System.out.println(answer);
    }

    public static int binarySearch(int[] houses, int C) {
        int start = 1;
        int end = houses[houses.length - 1] - houses[0];
        int result = 0;

        while (start <= end) {
            int mid = (start + end) / 2;
            int count = 1; // 첫 번째 집에는 공유기를 설치했다고 가정

            int prevHouse = houses[0]; // 첫 번째 집에 공유기를 설치했다고 가정

            for (int i = 1; i < houses.length; i++) 
            {
                int distance = houses[i] - prevHouse;
                if (distance >= mid) 
                {
                    count++;
                    prevHouse = houses[i];
                }
            }

            if (count >= C) 
            {
                result = mid;
                start = mid + 1;
            } 
            else
                end = mid - 1;
        }

        return result;
    }
}
