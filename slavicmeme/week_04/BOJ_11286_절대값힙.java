package LOLGAYMING;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.util.Comparator;
import java.util.StringTokenizer;
import java.util.PriorityQueue;

/*
 * 	//오름차순
	PriorityQueue<Integer> pq = new PriorityQueue<>();
    
    //내림차순
	PriorityQueue<Integer> pqHightest = new PriorityQueue<>(Collections.reverseOrder());
 */

public class BOJ_11286_절대값힙 {
	/*
	 * 
	 * 오버로딩(overloading)이란 서로 다른 시그니처를 갖는 여러 메소드를 하나의 이름으로 정의하는 것이었습니다.
	   오버라이딩(overriding)이란 상속 관계에 있는 부모 클래스에서 이미 정의된 메소드를 자식 클래스에서 같은 시그니쳐를 갖는 메소드로 다시 정의하는 것이라고 할 수 있습니다
		필자는 우선순위 큐를 정렬해주는 compare 메소드를 재정의 해주어 재정렬 하였습니다
	 * 
	 */
    static PriorityQueue<Integer> q = new PriorityQueue<>(new Comparator<Integer>(){
        @Override
        public int compare(Integer a, Integer b){
            int A = Math.abs(a); // abs는 함수의 절대값을 나타내는 함수이다.
            int B = Math.abs(b);
            if(A>B)
                return A-B;

            else if(A == B){
                if(a>b) return 1;
                else return -1;
            }

            else
                return -1;
        }
    });
	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	static StringBuilder sb = new StringBuilder();
	static StringTokenizer st;
	static int N, M;
	

	
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		

		
		N = Integer.parseInt(br.readLine());
		
		for(int i = 0; i < N; i++) 
		{
			M = Integer.parseInt(br.readLine());
			
			if(M == 0) 
			{
				if(q.isEmpty()) 
					sb.append("0").append("\n");
				else 
					sb.append(q.poll()).append("\n");
			}else
				q.offer(M);
			}
		
		System.out.println(sb);
	}
		
}

