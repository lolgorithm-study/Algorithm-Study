package SQD;

import java.util.Scanner;
import java.util.LinkedList;
import java.util.Queue;
 
public class No_11866 {
	/*
	 	유대인 역사가 플라비우스 요세푸스가 겪은 경험을 바탕으로 만들어진 문제이다.
		당시 예루살렘에서 살았던 요세푸스는 유대-로마 전쟁 때 유대군 장교로 참전했다가 동료 병사들, 
		자신을 포함해 총 41명과 함께 요타파타에서 서기 70년에 황제가 될 베스파시아누스가 지휘하는 로마군에게 포위되었고, 
		동료들은 로마군의 손에 죽느니 스스로 죽겠다고 집단자살하기로 했다. 그러나 직접 자살하는 것이 어려웠는지, 
		그들은 서로 죽이기 위한 알고리즘을 세운다. 
		요세푸스를 따라온 동료들은 위의 그림과는 다르게 2명 살리고 한 명 죽이는 식으로 자살했다.
		그러나 요세푸스는 동료들의 뜻에 반대하고 살고 싶었고, 
		수학적 논리력을 발휘하여 끝까지 살기 위한 자리를 찾아서 결국 살아남아 베스파시아누스에게 항복했다.
		
		자바의 QUEUE 에는 add, offer 이  있따.
		
		add -> 원소를 추가 하고 성공시 true를 반환, 실패시 Exception 으로 이동
		Offer -> 원소를 추가하고 성공 시 true, 실패시 False
	 */
	
	static StringBuilder sb = new StringBuilder();
	static Scanner in = new Scanner(System.in); // Scanner = BufferedReader
	static Queue<Integer> q = new LinkedList<>();
	static int N, K, Y; // 요세푸스의 Y
 
	public static void main(String[] args) {

		N = in.nextInt();
		K = in.nextInt();

		for(int i = 1; i <= N; i++) // Queue 에 추가
			q.add(i);
		
		sb.append('<'); // 출력할때 <괄호> 에 쌓여서 나오니까 미리 추가해둔 것.

		while(q.size() > 1) {
			
			for(int i = 0; i < K - 1; i++) // = i = 1; i < K ; i++ 로 해도돼 근데 난 i 는 무조건 0이면 좋겠어서 그랬어
			{
				Y = q.poll();
				q.offer(Y);// K-1 번째 까지의 수를 빼서 큐에 다시 넣음 -> 원을 순환 시킴
			}
			System.out.println(Y);
			sb.append(q.poll()).append(", "); //poll 한 값 + ", " 를 문자열에 추가
		}

		sb.append(q.poll()).append('>'); // 괄호 닫기
		System.out.println(sb);
	}
 
}

