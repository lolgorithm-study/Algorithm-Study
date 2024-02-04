package Week08;

import java.io.*;

public class BOJ_9461_파도반수열 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        
        int N = Integer.parseInt(br.readLine());

        for (int i = 0; i < N; i++) 
            sb.append(padovan(Integer.parseInt(br.readLine())) + "\n");

        System.out.println(sb);
        br.close();
    }

    private static long padovan(int n) 
    {
    	long[] dp = new long[Math.max(n + 1, 4)];
    	/* new long[Math.max(n + 1, 4)];
    	 * 이게 무엇이냐면 .. 만약 long[n+1] n + 1 만큼의 배열로 할당시 -> n이 1이 들어오면
    	 * 배열의 크기는 n+1인 2가 되고.. 인덱스는 0, 1 둘 밖에 없겠죠?
    	 * 근데 선언을 밑에 3번째 인덱스 까지 해버려가지구.. 없는 인덱스 번호를 할당해서 오류가 발생해요.
    	 * Math.max(n+1,4) 는 n+1과 4 중 더 큰수를 리턴해요. 그니까 n+1의 값이 4보다 작다면 4를 리턴해서 
    	 * 식을 만족시켜주는 거에요 어차피 for문은 n번까지만 작동하잔아요 ~! n+1이 4보다 큰 5가 된다면 인덱스 번호는
    	 * 4번까지 생성될 것이고 밑에 선언 식은 전부 맞고. 선언되지 않은 인덱스 [4] 의 값이 선언되면서 오류없이 잘 작동하는 코드가
    	 * 되는거죠.
    	 */

    	dp[0] = 0;
    	dp[1] = dp[2] = dp[3] = 1;

        for (int i = 4; i <= n; i++)
            dp[i] = dp[i - 2] + dp[i - 3];

        return dp[n];
    }
}