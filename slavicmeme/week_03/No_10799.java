package SQD;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Stack;

public class No_10799 {
	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	static Stack<Character> stack = new Stack<>();
	static String input;
	static int result = 0;

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		input = br.readLine(); // 문자열 받기
		for(int i = 0 ; i < input.length(); i ++)//받은 문자열 글자 수 만큼
		{
			if(input.charAt(i) == '(')  // ( 이면 push
				stack.push('(');

			else if (input.charAt(i) == ')')
			// 문자가 ) 이고 그 이전 문자가 ( 이면 pop을 하고 result(막대기 개수) 에 스택 size 를 더한다.
			{
				stack.pop();
				
				if(input.charAt(i - 1) == '(')
					result += stack.size();

				else 
					result++;
			}
		}
		
		System.out.println(result);
		br.close();
	}
}
