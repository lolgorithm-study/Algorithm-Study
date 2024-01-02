package SQD;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Stack;

public class No_17608 {
	
	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	static Stack<Integer> stack = new Stack<>();
	static int n, stick, num = 0 , max = 0;
	
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		n = Integer.parseInt(br.readLine());
		
		for(int i = 1 ; i <= n ; i++) // 값 받기
		{
			stick= Integer.parseInt(br.readLine()); // 줄마다 input 받기.
			stack.push(stick); // push
		}
		
		/*
		 * 스택에서 제일 나중에 들어온 원소부터 차례대로 max 와 크기를 비교한다. 
		 * max 보다 크면 peek() or pop() = max 가 된다.
		 * 만약(if 문) peek() or pop() 값이 max 보다 크다면 max 에 그 값을 넣어준다.
		 * 증감 연산자를 사용하여 막대 값을 추가 해준다.
		 */
		
		for(int j = 1 ; j <= n; j++)
		{
			if(max < stack.peek())
			{
				max = stack.pop();
				num ++;
			}else
				stack.pop();
		}
		
		
		System.out.println(num);
		
	}
}