package Week05;

import java.util.*;
import java.io.*;

public class BOJ_1722_순열의순서 
{
	public static void main (String[] args) throws IOException
	{
		    Scanner sc = new Scanner(System.in);
		
		    long[] fac = new long[21];
		    fac[0] = 1;
		    for(int i = 1; i<=20 ;i++) fac[i] = i*fac[i-1];
		
		    int N = sc.nextInt();
		    int num = sc.nextInt();
		    long k = 0;
		    int[] arr = new int[N+1];
		    boolean[] visited = new boolean[N+1];
		    Arrays.fill(arr,0);
		    Arrays.fill(visited,false);
		    /*
		     * Arrays.fill 함수 = 배열의 모든 요소를 특정 값으로 채우는 메소드(함수). 
		     */
		
		    Vector<Integer> ansVec = new Vector<Integer>();
		    long ans = 1;
		
		    if (num==1)
		    {
		        k = sc.nextLong();   
		        
		        // K번째 순열을 ansVec에 저장
		        for(int i = 0; i < N; i++)
		        {
		            for(int j = 1; j <= N; j++)
		            {
		                if(visited[j]) 
		                	continue;
		                
		                if(k - fac[N-1-i] > 0)
		                    k -= fac[N-1-i];        

		                else 
		                {                         
		                    ansVec.add(j);
		                    visited[j] = true;
		                    break;
		                }
		            }
		        }
		        for(int i = 0; i < ansVec.size(); i++)
		            System.out.print(ansVec.elementAt(i) + " ");
		    }
		    else if (num == 2)
		    {
		    	// 순열 저장
		        for(int i = 0; i<N; i++)
		            arr[i] = sc.nextInt();  
		        
		        // 주어진 순열이 몇 번째인지 계산
		        for(int i = 0; i<N; i++)
		        {
		            for(int j = 1; j<arr[i]; j++)
		            {
		                if(visited[j] == false)
		                    ans += fac[N-1-i];
		            }
		            
		            visited[arr[i]] = true;
		        }
		        
		        System.out.println(ans);
		        
		        sc.close();
		    }
		}
}