package LOLGAYMING;

import java.io.*;
import java.util.*;

public class BOJ_15903_카드합체놀이 {
	
	static PriorityQueue<Long> q = new PriorityQueue<>();
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    static BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
	static StringTokenizer st;
	static int N, M ;
	static Long temp, num = 0L;

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		st = new StringTokenizer(br.readLine());
		N = Integer.parseInt(st.nextToken());
		M = Integer.parseInt(st.nextToken());
		
		st = new StringTokenizer(br.readLine());
		for(int i = 0 ; i < N; i++)
			q.add(Long.parseLong(st.nextToken()));
		
		for(int k = 0; k < M; k ++)
		{
			temp = q.poll();
			temp += q.poll(); // 1번 x번 카드와 y번 카드를 골라 그 두 장에 쓰여진 수를 더한 값을 계산한다. (x ≠ y)
			q.add(temp);
			q.add(temp);// 2번 계산한 값을 x번 카드와 y번 카드 두 장 모두에 덮어 쓴다.
		}
		
		
		while(!q.isEmpty())
			num += q.poll();
		
		bw.write(Long.toString(num));
		bw.flush();
		
		br.close();
		bw.close();
	}
}
