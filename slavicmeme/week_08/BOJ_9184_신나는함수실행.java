package Week08;

import java.util.Scanner;

public class BOJ_9184_신나는함수실행 {
    static int[][][] memo;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        memo = new int[21][21][21];

        while (true) {
            int a = sc.nextInt();
            int b = sc.nextInt();
            int c = sc.nextInt();

            if (a == -1 && b == -1 && c == -1)
                break;

            System.out.printf("w(%d, %d, %d) = %d\n", a, b, c, w(a, b, c));
        }

        sc.close();
    }

    static int w(int a, int b, int c) 
    {
        if (a >= 0 && a <= 20 && b >= 0 && b <= 20 && c >= 0 && c <= 20 && memo[a][b][c] != 0)
            return memo[a][b][c];

        if (a <= 0 || b <= 0 || c <= 0)
            return 1;

        if (a > 20 || b > 20 || c > 20)
            return w(20, 20, 20);

        if (a < b && b < c) 
        {
            int result = w(a, b, c - 1) + w(a, b - 1, c - 1) - w(a, b - 1, c);
            memo[a][b][c] = result;
            return result;
        }

        int result = w(a - 1, b, c) + w(a - 1, b - 1, c) + w(a - 1, b, c - 1) - w(a - 1, b - 1, c - 1);
        memo[a][b][c] = result;
        return result;
    }
}