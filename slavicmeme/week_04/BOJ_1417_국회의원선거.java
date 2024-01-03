package LOLGAYMING;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import java.util.Collections;
import java.util.StringTokenizer;
import java.util.PriorityQueue;

public class BOJ_1417_국회의원선거 {
	
	/*
	 * Collections.reverseOrder() 내림차순 정렬 util 에서 가져와야 함..
	 */
    static PriorityQueue<Integer> q = new PriorityQueue<>(Collections.reverseOrder());
	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    static BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
	static StringTokenizer st;
	static int N, M, num, cnt = 0;

	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		N = Integer.parseInt(br.readLine());
		M = Integer.parseInt(br.readLine());
		
		if(N != 1)
		{
			for(int i = 1 ; i < N ; i++)
				q.add(Integer.parseInt(br.readLine()));

			while(q.peek() >= M)
			{
				num = q.poll();
				num--;
				M++;
				cnt++;
				q.add(num);
			}
		}
        bw.write(cnt + "");
        bw.flush();
        bw.close();
        br.close();
	}

}
