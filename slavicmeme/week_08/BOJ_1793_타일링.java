package Week08;

import java.io.*;
import java.math.BigInteger;

//https://loosie.tistory.com/245 
// 저를 좀더 이해시켜주세요

public class BOJ_1793_타일링 {

	static BigInteger[] dp;
	public static void main(String[] args) throws IOException{
		BufferedReader br=  new BufferedReader(new InputStreamReader(System.in));
		dp = new BigInteger[251];
		
		dp[0] =new BigInteger("1");
		dp[1] =new BigInteger("1");
		dp[2] =new BigInteger("3");
		
		for(int i=3; i<251; i++) 
			dp[i] = dp[i-1].add(dp[i-2].multiply(new BigInteger("2")));

		String line = null;
		
		while((line=br.readLine())!=null)
		{
			int n = Integer.parseInt(line);
			System.out.println(dp[n]);
		}
		
		br.close();
	}
}