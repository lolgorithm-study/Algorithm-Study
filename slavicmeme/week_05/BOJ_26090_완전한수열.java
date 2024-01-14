package Week05;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;


public class BOJ_26090_완전한수열{

    // 소수 판별 함수
	static boolean isPrime(int num) 
    {
	    if (num < 2) 
            return false;
	    
	    // 에라토스테네스의 체
	    for (int i = 2; i * i <= num; i++) 
        {
	        if (num % i == 0) 
	            return false;
	    }
	    
	    return true;
	}
	
	// 수열의 개수를 세는 함수.
	static int countPerfectSequences(int[] sequence) {
	    int n = sequence.length;
	    int count = 0;

	    for (int length = 1; length <= n; length++) 
        {
	        for (int start = 0; start <= n - length; start++) 
            {
	            int sum = 0;
	            for (int i = start; i < start + length; i++)
	                sum += sequence[i];
                
	            if (isPrime(length) && isPrime(sum))
	                count++;
	        }
	    }

	    return count;
	}
    public static void main(String[] args) throws IOException 
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());

        StringTokenizer st = new StringTokenizer(br.readLine());

        int[] sequence = new int[N];

        for (int i = 0; i < N; i++)
            sequence[i] = Integer.parseInt(st.nextToken());

        int result = countPerfectSequences(sequence);

        System.out.println(result);

        br.close();
    }
}


