package Week09;

import java.io.*;
import java.util.*;

public class BOJ_11399_ATM {

	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		
		int N = Integer.parseInt(br.readLine());
		
		int bf = 0;
		int sum = 0;
		
		StringTokenizer st = new StringTokenizer(br.readLine());
		
		int[] arr = new int[N];
		
		for(int i = 0; i < N ; i++)
			arr[i] = Integer.parseInt(st.nextToken());
		
		Arrays.sort(arr);

		for(int j = 0; j < N; j++)
		{
			sum += bf + arr[j];
			bf += arr[j];
		}
		
		System.out.println(sum);
			
		
		
	}

}
