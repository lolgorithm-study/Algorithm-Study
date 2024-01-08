package Week05;

import java.util.Scanner;

public class BOJ_29728_실버와소수는둘다S로시작한다 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int N = sc.nextInt();

        StringBuilder A = new StringBuilder();

        
        boolean[] isPrime = new boolean[N + 1];
        isPrime[0] = isPrime[1] = false;


        for (int i = 2; i <= N; i++)
            isPrime[i] = true;

        for (int i = 2; i * i <= N; i++) 
        {
            if (isPrime[i]) 
            {
                for (int j = i * i; j <= N; j += i) 
                    isPrime[j] = false;
            }
        }

        for (int i = 1; i <= N; i++) 
        {
            if (isPrime[i]) 
            {
                if (A.length() > 0 && A.charAt(A.length() - 1) == 'B') 
                {
                    A.setCharAt(A.length() - 1, 'S');
                    A.append('S');
                } 
                
                else
                    A.append('S');
            } 
            
            else
                A.append('B');
        }

        // A 문자열에서 B와 S의 개수 세기
        int countB = 0, countS = 0;
        for (int i = 0; i < A.length(); i++) 
        {
            if (A.charAt(i) == 'B')
                countB++;
            
            else
                countS++;
        }

        System.out.println(countB + " " + countS);
        sc.close();
    }
}