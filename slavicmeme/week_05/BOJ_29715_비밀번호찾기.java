package Week05;

import java.util.Scanner;

public class BOJ_29715_비밀번호찾기 
{
    public static void main(String[] args) 
    {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();
        int m = sc.nextInt();
        int x = sc.nextInt();
        int y = sc.nextInt();

        int pwCnt = 0;
        int cnt = 0;

        for (int i = 0; i < m; i++) 
        {
            int a = sc.nextInt();
            int b = sc.nextInt(); // 이거 사용 안해도되는데 안쓰면 오류남 ㅎ

            if (a != 0)
                pwCnt++;
            else
                cnt++;
        }
        

        // 이미 알고 있는 비밀번호를 사용하여 남은 비밀번호 자리수 구하기
        n -= pwCnt;
        long result = 1;

        // 이미 번호를 안 상태로 0으로 시작하지 않는 경우의 계산
        if (cnt > 0)
            result *= calculateCombination(n, cnt) * calculateFactorial(cnt);

        n -= cnt;

        // 남은 자리수 에 대한 가능한 경우의 수 계산
        if (n > 0)
            result *= calculatePermutation(9 - (pwCnt + cnt), n);

        System.out.println(result * x + ((result - 1) / 3) * y);
        
        sc.close();
    }

    
    // 콤비네이션 계산
    static long calculateCombination(int n, int r)
    {
        long result = 1;
        
        for (int i = 1; i <= r; i++) 
        {
            result *= (n - i + 1);
            result /= i;
        }
        return result;
    }

    // 팩토리얼 계산
    static long calculateFactorial(int n) {
        long result = 1;
        
        for (int i = 2; i <= n; i++)
            result *= i;
        
        return result;
    }

    
    // 순열 계산
    static long calculatePermutation(int n, int r) 
    {
        long result = 1;
        
        for (int i = 0; i < r; i++)
            result *= (n - i);
        
        return result;
    }
}
