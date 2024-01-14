package Week05;

import java.util.Scanner;

public class BOJ_16970_정수좌표 {
	
    static int gcd(int a, int b) 
    {
        if (b == 0) 
            return a;
        
        return gcd(b, a % b);
    }
    
    
    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);
        int N = scanner.nextInt();
        int M = scanner.nextInt();
        int K = scanner.nextInt();
        int cnt = 0;

        for (int x1 = 0; x1 <= N; x1++) 
        {
            for (int y1 = 0; y1 <= M; y1++) 
            {
                for (int x2 = 0; x2 <= N; x2++) 
                {
                    for (int y2 = 0; y2 <= M; y2++) 
                    {
                        if (gcd(Math.abs(x2 - x1), Math.abs(y2 - y1)) + 1 == K)
                            cnt++;
                    }
                }
            }
        }

        System.out.printf("%d\n", cnt / 2);
        scanner.close();
    }


}
