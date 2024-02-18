package Week09;

import java.util.Arrays;
import java.util.Scanner;

public class BOJ_27447_주문은토기입니까 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int N = scanner.nextInt();
        int M = scanner.nextInt();
        int[] arrivalTimes = new int[N];

        for (int i = 0; i < N; i++)
            arrivalTimes[i] = scanner.nextInt();

        String result = surviveCafe(N, M, arrivalTimes);
        System.out.println(result);
        scanner.close();
    }

    private static String surviveCafe(int N, int M, int[] arrivalTimes) 
    {
        Arrays.sort(arrivalTimes);

        int currentTime = 0;

        for (int arrivalTime : arrivalTimes) 
        {
            if (currentTime <= arrivalTime) 
            {
                int makePotTime = arrivalTime - currentTime;
                currentTime += makePotTime + 1;
                currentTime += M;
            } 
            
            else
                return "fail";
        }

        return "success";
    }
}
