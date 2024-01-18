package Week07;

import java.util.*;
import java.io.*;

public class BOJ_15655_N과M6 {
	
	static int[] arr, result;
	static int N, M;
	static boolean[] visit;
	static StringBuilder sb = new StringBuilder();

	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        
        N = Integer.parseInt(st.nextToken());
        M = Integer.parseInt(st.nextToken());
        
        
        st = new StringTokenizer(br.readLine());
        arr = new int[N];
        for(int i = 0 ; i < N; i++)
        	arr[i] = Integer.parseInt(st.nextToken());
        
        Arrays.sort(arr);//sort.
        
        
        
        visit = new boolean[N];
        result = new int[M];
        
        dfs(0, 0);
        System.out.println(sb);
		
	}
	
	static void dfs(int depth, int len)
	{
		if(depth == M)
		{
			for(int val : result)
				sb.append(val).append(" ");
			
			sb.append("\n");
			return;
			
		}
		
		
		for (int i = len ; i < N ; i ++)
		{
			if(!visit[i])
			{
				visit[i] = true;
				result[depth] = arr[i];
				dfs(depth + 1, i);
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
