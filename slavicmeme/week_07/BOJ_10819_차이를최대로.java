package Week07;

import java.util.*;
import java.io.*;

public class BOJ_10819_차이를최대로 {
	
	private static int N, arr[], result[], max = Integer.MIN_VALUE; // max 는 인트 최솟값.
	private static boolean visit[];
	
	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        
        N = Integer.parseInt(br.readLine());
        arr = new int[N];
        result = new int[N];
        visit = new boolean[N];
        
        st = new StringTokenizer(br.readLine());
        
        for(int i = 0 ; i < N ; i ++)
        	arr[i] = Integer.parseInt(st.nextToken());
        
        dfs(0);
        System.out.println(max);

	}
	
	private static void dfs(int depth)
	{
		if(depth == N)
		{
			int sum = 0;
			
			for(int i = 0 ; i < N - 1 ; i ++)
				sum += Math.abs(result[i] - result[i + 1]);
			
			max = Math.max(sum, max);
			return;
		}
		
		for (int i = 0 ; i < N ; i ++)
		{
			if(!visit[i])
			{
				visit[i] = true;
				result[depth] = arr[i];
				dfs(depth + 1);
				visit[i] = false;
				
				/*
				 *  증감연산자 ++는 변수 자체에 값을 더하는 것이다.
				 *	변수 + 1 을 해준다면?? 가상 메모리 변수의 값을 더하게 되어 변수 자체의 값이 더해지지 않는다.
				 *	그래서 증감 연산자를 쓰면 답이 틀려요
				 */
			}
		}
	}
}
