package Week07;

import java.util.*;
import java.io.*;

public class BOJ_15663_N과M9 {
	
	private static int N, M, arr[], result[];
	private static boolean visit[];
	
	private static StringBuilder sb = new StringBuilder();

	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        
        N = Integer.parseInt(st.nextToken());
        M = Integer.parseInt(st.nextToken());
        
        arr = new int[N];
        result = new int[M];
        visit = new boolean[N];
        
        int cnt = 0 ; 
        
        st = new StringTokenizer(br.readLine());
        
        while(st.hasMoreTokens())
        {
        	arr[cnt] = Integer.parseInt(st.nextToken());
        	cnt++;
        }
        
        Arrays.sort(arr);
        dfs(0);
        System.out.println(sb);

	}
	
	private static void dfs(int depth)
	{
		if(depth == M)
		{
			for(int val : result)
				sb.append(val).append(" ");
			
			sb.append("\n");
			return;
		}
		
		Set<Integer> set = new HashSet<>();
		for (int i = 0 ; i < N ; i ++)
		{
			if(!visit[i] && !set.contains(arr[i])) // 중복되나 확인하기.
			{
				visit[i] = true;
				result[depth] = arr[i];
				set.add(arr[i]); // 사용한 숫자 기억하는 moment
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
