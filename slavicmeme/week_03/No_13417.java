package SQD;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class No_13417{
	static String res; // 전역(2021년 10월 12일) 변수
	
	private static void positioning(char card)
	{
		if(card <= res.charAt(0)) res = card+res;
		else res+=card;
	}
	
	public static void main(String[] args) throws Exception 
	{
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter out = new BufferedWriter(new OutputStreamWriter(System.out));
		
		int i, t, n;
		t = Integer.parseInt(in.readLine());
		String card;
		
		while(t-->0) // t -- 와 t>0 을 합친 연산자 입니다.. while 이 실행 될때마다 t가 1 씩 감소.
		{
			n = Integer.parseInt(in.readLine());
			
			card = in.readLine().replaceAll(" ", "");// " " 를 "" 로 바꾸는 즉, 공백으로
			
			res = card.substring(0, 1); // 첫번째 인덱스. 인덱스 범위 지정하는 매개변수
			
			for(i=1;i<n;i++) positioning(card.charAt(i));
			
			out.write(res); // 출력
			out.newLine(); // 새 줄로 변경
		}
		out.close();
		in.close();
	}
	

}