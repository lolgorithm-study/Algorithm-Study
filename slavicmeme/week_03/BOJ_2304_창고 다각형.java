package SQD;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;


public class No_2304{
	 
    static StringBuilder sb = new StringBuilder();
    static StringTokenizer st;
    static Stack<Integer> height = new Stack<>();
    static int[] arr;
    static int N, start, end, L, H, x, temp, result = 0;
    
    public static void main(String[] args) throws IOException 
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        N = Integer.parseInt(br.readLine());
        arr = new int[1001];
        start = Integer.MAX_VALUE; //인트 최고값
        end = 0;
        
        // 기둥 좌표, 높이 처리
        for (int i = 0; i < N; i++) 
        {
            st = new StringTokenizer(br.readLine());
            L = Integer.parseInt(st.nextToken());
            H = Integer.parseInt(st.nextToken());
            arr[L] = H;
            start = Math.min(L, start); // 둘 중 작은 값
            end = Math.max(L, end); // 둘 중 큰 값
        }

        
        // 왼쪽부터 높이 갱신
        temp = arr[start];
        for (int i = start + 1; i <= end; i++) 
        {
            if(arr[i] < temp)
                height.push(i); 
            else 
            {
                while (!height.isEmpty()) 
                {
                    x = height.pop(); 
                    arr[x] = temp; 
                }
                temp = arr[i];
            }
        }
        
        height.clear();


        // 오른쪽에서 부터 높이 갱신
        temp=arr[end];
        for(int i = end - 1; i >= start; i--)
        {
            if(arr[i] < temp) 
            	height.push(i);
            else 
            {
                while (!height.isEmpty()) 
                {
                    x = height.pop();
                    arr[x]=temp;
                }
                
                temp=arr[i];
            }
        }

        // 면적 계산
        for (int i = start; i <= end; i++)
            result += arr[i];

        sb.append(result).append("\n");
        System.out.print(sb);
        
        br.close();
    }
}