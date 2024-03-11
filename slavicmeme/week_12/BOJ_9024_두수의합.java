package Week12;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class BOJ_9024_두수의합 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int t = Integer.parseInt(br.readLine());

        while (t-- > 0) {
            st = new StringTokenizer(br.readLine());
            int n = Integer.parseInt(st.nextToken()); 
            int k = Integer.parseInt(st.nextToken());

            int[] arr = new int[n];
            st = new StringTokenizer(br.readLine());
            for (int i = 0; i < n; i++)
                arr[i] = Integer.parseInt(st.nextToken());

            Arrays.sort(arr);

            int left = 0, right = n - 1;
            int closestSum = Integer.MAX_VALUE;
            int count = 0;

            while (left < right) 
            {
                int sum = arr[left] + arr[right];

                // 현재 합의 차이가 이전의 최소 차이보다 작다면 최소 차이를 갱신하고 개수를 1로 초기화
                if (Math.abs(sum - k) < Math.abs(closestSum - k)) 
                {
                    closestSum = sum;
                    count = 1;
                } 
                else if (Math.abs(sum - k) == Math.abs(closestSum - k)) 
                    // 현재 합의 차이가 최소 차이와 같다면 개수를 증가
                    count++;

                if (sum < k)
                    // 합이 K보다 작으면 왼쪽 포인터를 오른쪽으로 이동
                    left++;
                else
                    // 합이 K보다 크면 오른쪽 포인터를 왼쪽으로 이동
                    right--;
            }

            System.out.println(count);
        }
    }
}
