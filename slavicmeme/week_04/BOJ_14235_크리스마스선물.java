package Week04_heap;

import java.util.*;

public class BOJ_14235_크리스마스선물 {
	
	static Scanner sc = new Scanner(System.in);
	static PriorityQueue<Integer> pq = new PriorityQueue<>(Collections.reverseOrder());
	static int N, a;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		N = sc.nextInt();
		
		while(N --> 0) 
		{
			a=sc.nextInt();
			if(a==0) 
			{
				// 만약 설매가 비었다면 -1 출력
				if(pq.isEmpty())
					System.out.println(-1);
				// 선물이 있다면 우선순위가 높은 선물 출력, 삭제
				else
					System.out.println(pq.poll());
			}
			// a가 0이 아니라면 a개의 선물 충전
			else 
			{
				for(int i = 0 ; i<a ; i++)
					pq.add(sc.nextInt());
			}
		}
	}
}
