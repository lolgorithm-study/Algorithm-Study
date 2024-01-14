package Week05;

import java.io.*;

public class BOJ_9081_단어맞추기 {
	
	/*
	 * 입력 받은 단어를 문자배열로 변환하고 오름차순으로 정렬 -> 
	 * 오른쪽 끝에서 부터 시작하여 문자가 이전 문자보다 사전적으로 큰 경우를 찾음 ->
	 * 찾은 경우 해당 위치에서부터 끝까지 뒤짚기 ->
	 * 이전에 찾은 위치 문자보다 큰 첫번째 문자를 찾아 위치를 바꿈 ->
	 * 결과
	 */
    public static void main(String[] args) throws Exception 
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        
        int N = Integer.parseInt(br.readLine());

        while(N-- > 0)
        {
            char[] input = br.readLine().toCharArray();
            int lastIdx = input.length - 1;

            int top = lastIdx;
            
            
            while(top > 0 && input[top - 1] >= input[top])
                top--;

            if(top > 0)
            {
                int pos = lastIdx;
                
                while(input[top-1] >= input[pos])
                	pos--;

                swap(input, top-1, pos);
                
                while(top < lastIdx)
                {
                    swap(input, top, lastIdx);
                    top++;
                    lastIdx--;
                }
            }

            for(char c : input)
            	sb.append(c);
            
            sb.append("\n");
        }
        System.out.println(sb);
    }

    static void swap(char[] input, int i, int j)
    {
        char temp = input[i];
        input[i] = input[j];
        input[j] = temp;
    }


}