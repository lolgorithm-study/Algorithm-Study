package Week09;

import java.util.Scanner;

public class BOJ_11047_동전0{

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		int total = sc.nextInt();
		int[] coins = new int[N];
		
		int coinNum = 0;

		
		for(int i = coins.length - 1 ; i >= 0 ; i--)
		{
			coins[i] = sc.nextInt();
			
		}
		
		for(int c : coins)
		{
			if(c <= total)
			{
				coinNum += (total/c);
				total %= c;
			}
		}
		
		System.out.println(coinNum);
		
		sc.close();
	}
}