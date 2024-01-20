package Week06;
 
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class BOJ_2503_숫자야구 {
	
	// 가능한 후보 수 생성하기
    private static ArrayList<Integer> generateCandidates() 
    {
        ArrayList<Integer> candidates = new ArrayList<>();

        for (int i = 123; i <= 987; i++) 
        {
            int digit1 = i / 100;
            int digit2 = (i / 10) % 10;
            int digit3 = i % 10;

            // 중복된 숫자 , 0 이 포함되지 않는 후보 추가
            if (digit1 != digit2 && digit1 != digit3 && digit2 != digit3
                    && digit1 != 0 && digit2 != 0 && digit3 != 0) {
                candidates.add(i);
            }
        }

        return candidates;
    }

    // 후보 수 필터링(딩동)
    private static ArrayList<Integer> filterCandidates(ArrayList<Integer> candidates, int guess, int strike, int ball) 
    {
        ArrayList<Integer> filteredCandidates = new ArrayList<>();

        for (int candidate : candidates) {
            int candidateDigit1 = candidate / 100;
            int candidateDigit2 = (candidate / 10) % 10;
            int candidateDigit3 = candidate % 10;

            int guessDigit1 = guess / 100;
            int guessDigit2 = (guess / 10) % 10;
            int guessDigit3 = guess % 10;

            int currentStrike = 0;
            int currentBall = 0;

            if (candidateDigit1 == guessDigit1) 
            	currentStrike++;
            
            if (candidateDigit2 == guessDigit2) 
            	currentStrike++;
            
            if (candidateDigit3 == guessDigit3) 
            	currentStrike++;

            if (candidateDigit1 == guessDigit2 || candidateDigit1 == guessDigit3) 
            	currentBall++;
            
            if (candidateDigit2 == guessDigit1 || candidateDigit2 == guessDigit3) 
            	currentBall++;
            
            if (candidateDigit3 == guessDigit1 || candidateDigit3 == guessDigit2) 
            	currentBall++;

            // 스트라이크, 볼 개수 일치하면 추가
            if (currentStrike == strike && currentBall == ball)
                filteredCandidates.add(candidate);
        }

        return filteredCandidates;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());
        
        ArrayList<Integer> candidates = generateCandidates();

        for (int i = 0; i < n; i++)
        {
            String[] input = br.readLine().split(" ");
            int guess = Integer.parseInt(input[0]);
            int strike = Integer.parseInt(input[1]);
            int ball = Integer.parseInt(input[2]);

            candidates = filterCandidates(candidates, guess, strike, ball);
        }

        System.out.println(candidates.size());
    }
}
