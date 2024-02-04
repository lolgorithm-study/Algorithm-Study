package Week09;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class BOJ_9009_피보나치 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int i = 0; i < T; i++) 
        {
            int n = Integer.parseInt(br.readLine());

            ArrayList<Integer> fibNumbers = new ArrayList<>();
            int a = 0;
            int b = 1;
            int c;
            
            while (a <= n) 
            {
                fibNumbers.add(a);
                c = a + b;
                a = b;
                b = c;
            }

            printMinFibonacciNumbers(n, fibNumbers);
        }
    }

    // 최소 개수의 서로 다른 피보나치 수 출력
    private static void printMinFibonacciNumbers(int n, ArrayList<Integer> fibNumbers) 
    {
        ArrayList<Integer> result = new ArrayList<>();
        int index = fibNumbers.size() - 1;

        while (n > 0 && index >= 0) 
        {
            int fibNumber = fibNumbers.get(index);

            if (fibNumber <= n) 
            {
                result.add(fibNumber);
                n -= fibNumber;
            }

            index--;
        }

        for (int i = result.size() - 1; i >= 0; i--)
            System.out.print(result.get(i) + " ");
        
        System.out.println();
    }
}
