package Week04_heap;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.PriorityQueue;

public class BOJ_1927_최소힙 {
	 /* 	//오름차순
		PriorityQueue<Integer> pq = new PriorityQueue<>();
	    
	    //내림차순
		PriorityQueue<Integer> pqHightest = new PriorityQueue<>(Collections.reverseOrder());
	 */
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    static PriorityQueue<Integer> minQ = new PriorityQueue<Integer>();
    static int n ; 

	public static void main(String[] args) throws IOException {
        // Scanner scan = new Scanner(System.in);

		n = Integer.parseInt(br.readLine());
        int input;
        
        
        for (int i = 0; i < n; i++) 
        {
            input = Integer.parseInt(br.readLine());
            if (input > 0) 
            {
                minQ.add(input);
            } 
            else 
            {
                if (!minQ.isEmpty()) 
                    System.out.println(minQ.poll());
                else
                    System.out.println(0);
            }
        }
        br.close();
    }

}
