package Week06;
 
import java.io.*;
import java.util.*;

public class BOJ_1544_사이클단어 {
    static int N;
    static ArrayList<String>[] arr;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        N = Integer.parseInt(br.readLine());
        arr = new ArrayList[N];
        int result = 0;

        for (int i = 0; i < N; i++) 
        {
            arr[i] = new ArrayList<>();
            String str = br.readLine();
            
            for(int j=0; j<str.length(); j++)
                arr[i].add(str.substring(j)+ str.substring(0,j));

            boolean flag = true;
            
            // 중복확인
            for (int j = 0; flag && j <= i-1; j++) 
            {
                for (int k = 0; flag && k < arr[j].size(); k++) 
                {
                    if (str.equals(arr[j].get(k))) 
                    	flag = false;
                }
            }
            // 중복 X result 에 1 추가
            if (flag)
                result++;
        }

        System.out.println(result);
    }
}
