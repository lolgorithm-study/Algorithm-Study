package SQD;

import java.io.*;
import java.util.*;

public class No_2346{

	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	static StringTokenizer st;
	static StringBuilder sb = new StringBuilder();
	static Deque<int[]> deck = new ArrayDeque<>();
	 
	static int[] arr, shin;
	static int N, gun;

	public static void main(String[] args) throws IOException {
		
		N = Integer.parseInt(br.readLine());
		st = new StringTokenizer(br.readLine());
		
		
		arr = new int[N];
		for(int i = 0 ; i < N ; i++)
			arr[i] = Integer.parseInt(st.nextToken());
		
		sb.append("1 ");
		
		gun = arr[0]; // 1번 풍선 안의 종이 값 처리
		
		// 2번부터 처리
		for(int i = 1; i < N; i++)
			deck.add(new int[] {(i+1), arr[i]});

		// 풍선 터뜨리는 과정 while
		while(!deck.isEmpty()) 
		{
			if(gun > 0) // 이동 거리가 양수
			{
				for(int i = 1 ; i < gun; i++)
					deck.add(deck.poll()); // 오른쪽으로
				
				shin  = deck.poll(); // 풍선을 터뜨리고 풍선 정보를 return
				gun = shin[1]; // 다음 이동 거리 설정
				sb.append(shin[0]+" "); // 터진 풍선의 결과를 string 에 추가 
			}
			
			else // 이동 거리가 음수일때
			{
				for(int i = 1; i < -gun; i++) 
					deck.addFirst(deck.pollLast()); // 왼쪽으로
				
				shin = deck.pollLast();
				gun = shin[1]; // 다음 이동 거리 설정
				sb.append(shin[0] + " "); // 터진 풍선의 결과를 string 에 추가 
			}
		}
				
		System.out.println(sb.toString());
		
	}
}