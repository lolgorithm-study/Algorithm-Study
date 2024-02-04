package Week09;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BOJ_30406_산타춘배의선물나눠주기 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        int[] num = new int[4];
        int ans = 0;

        StringTokenizer st = new StringTokenizer(br.readLine());
        for (int i = 0; i < N; i++) {
            int x = Integer.parseInt(st.nextToken());
            num[x]++;
        }

        int mn = Math.min(num[0], num[3]);
        ans += mn * 3;
        num[0] -= mn;
        num[3] -= mn;
        mn = Math.min(num[1], num[2]);
        ans += mn * 3;
        num[1] -= mn;
        num[2] -= mn;

        int a = -1;
        int b = -1;
        for (int i = 0; i < 4; i++) {
            if (num[i] > 0) {
                if (a == -1) a = i;
                else b = i;
            }
        }

        if (b == -1)
            System.out.println(ans);
        else {
            ans += Math.min(num[a], num[b]) * (a ^ b);
            System.out.println(ans);
        }

        br.close();
    }
}
