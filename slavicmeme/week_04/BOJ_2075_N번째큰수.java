package Week04_heap;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.StringTokenizer;

public class BOJ_2075_N번째큰수 {
	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	static Queue<Integer> q = new PriorityQueue<>();
	static StringTokenizer st;
	static int N, num;
	public static void main(String[] args) throws IOException {
		
		N = Integer.parseInt(br.readLine());
		
		
		for(int i = 0 ; i < N ; i++) 
		{
			st = new StringTokenizer(br.readLine());
			for(int j = 0 ;  j < N ;  j++) 
			{
				num = Integer.parseInt(st.nextToken());
				if(q.size() == N) 
				{
					if(q.peek() < num) 
					{
						q.poll();
						q.add(num);
					}
				}
				else
					q.add(num);
				}
			}
		System.out.println(q.poll());
		}
		
	}