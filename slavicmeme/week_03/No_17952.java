package SQD;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;
import java.util.StringTokenizer;

public class No_17952 {
	
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    static StringTokenizer st;
    static Stack<int[]> stack = new Stack<>();
    static int score = 0, N;
    static String token;
    
    public static void main(String[] args) throws IOException {
    	
        N = Integer.parseInt(br.readLine());
        
        for (int i = 0; i < N; i++) 
        {
        	/*
        	 * new StringTokenizer(br.readLine()); -> 한 줄로받고 띄어쓰기를 기준으로 토큰을 나누겠다.
        	 * token = st.nextToken() -> 첫 번째 토큰의 값을 저장하고 첫 번쨰 토큰을 pop하고 다음 토큰으로 넘어가겠다.
        	 */
            st= new StringTokenizer(br.readLine());
            token = st.nextToken();

            if ("0".equals(token)) // 만약 첫 글자가 0과 같다면
            {
                if (!stack.isEmpty()) // 스택이 비어있지 않으면
                    stack.peek()[1]--; 
                // 스택이 1 2 3 4 5 가 있을때 1은 stack[0], stack[1]은 2이다. -- 는 1을 감소하는 연산자이다.. 
                //즉, 2의 값을 1을 감소시켜 1로 만드는 코드와 같다. (실제 stack은 다른 값이 들어가용)
            } 
            
            /*
             * 값이 1이라면 토큰 값 두 개를 배열에 넣고 스택에 push한다.
             */
            else if ("1".equals(token)) 
            	stack.push(new int[]{Integer.parseInt(st.nextToken()), Integer.parseInt(st.nextToken()) - 1});

            if (!stack.isEmpty() && stack.peek()[1] == 0) 
            	score += stack.pop()[0];
        }

        System.out.println(score);
    }
}

