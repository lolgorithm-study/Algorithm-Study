package Week06;
 
import java.io.*;
import java.util.*;

public class BOJ_2659_십자카드문제 {
	
    private static boolean[] getClockNum() 
    {
        boolean[] flags = new boolean[10000];

        for (int a = 1; a < 10; a++)
            for (int b = 1; b < 10; b++)
                for (int c = 1; c < 10; c++)
                    for (int d = 1; d < 10; d++) 
                    {
                        int n = getMin(a, b, c, d);
                        if (!flags[n])
                        	flags[n] = true;
                    }
        
        return flags;
    }

    //	주어진 순서로 배열된 숫자들 중 최소값을 반환하는 함수
    private static int getMin(int a, int b, int c, int d) 
    {
        int min = Integer.MAX_VALUE; // INT MAX ! 2**30 - 1

        min = Math.min(min, a * 1000 + b * 100 + c * 10 + d);
        min = Math.min(min, b * 1000 + c * 100 + d * 10 + a);
        min = Math.min(min, c * 1000 + d * 100 + a * 10 + b);
        min = Math.min(min, d * 1000 + a * 100 + b * 10 + c);

        return min;
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        StringTokenizer st = new StringTokenizer(br.readLine());
        int a = Integer.parseInt(st.nextToken());
        int b = Integer.parseInt(st.nextToken());
        int c = Integer.parseInt(st.nextToken());
        int d = Integer.parseInt(st.nextToken());

        int min = getMin(a, b, c, d);

        boolean[] clock_num = getClockNum();

        int answer = 0;
        
        //	모든 시계수를 반복하면서 입력된 카드의 시계수보다 작은지 확인
        for (int i = 1111; i <= min; i++) 
            if (clock_num[i])
                answer++;

        System.out.println(answer);
    }
}