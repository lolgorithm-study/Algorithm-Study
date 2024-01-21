package Week07;

import java.io.*;
import java.util.*; 

public class BOJ_1038_감소하는수 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        br.close();

        if (N > 1022)
            System.out.println(-1);
        else
            System.out.println(FDN(N));
    }
    
    // N번째 감소하는 수를 찾는 메소드  
    private static long FDN(int N) 
    {
        if (N == 0) return 0;

        Queue<Long> queue = new LinkedList<>();

        for (int i = 1; i <= 9; i++)
            queue.offer((long) i); // long 으로 캐스팅 . toLong 과 같다고 보면 됩니다.

        int count = 1;

        while (!queue.isEmpty()) 
        {
            long current = queue.poll();

            if (count == N)
                return current;

            count++;

            long lastDigit = current % 10;

            // 맨 뒤 자릿수보다 작은 수를 뒤에 추가하여 큐에 삽입
            for (int i = 0; i < lastDigit; i++)
                if (isD(current * 10 + i))
                    queue.offer(current * 10 + i);
        }

        return -1;
    }

    // 숫자가 감소하는 수인지 판단하는 메소드
    private static boolean isD(long num) 
    {
        String str = Long.toString(num);

        for (int i = 0; i < str.length() - 1; i++)
            if (str.charAt(i) <= str.charAt(i + 1))
                return false;

        return true;
    }
}
