package Week06;
 
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BOJ_3085_사탕게임 {
	
	// 각각 행과 열에서 최대 사탕 개수를 찾는 메소드
    private static int findMaxCandies(char[][] board) 
    {
        int maxCandies = 1;

        // 행에 대한 최대 사탕 개수 차직
        for (int i = 0; i < board.length; i++) 
        {
            int currentCandies = 1;
            for (int j = 1; j < board[i].length; j++) 
            {
                if (board[i][j] == board[i][j - 1])
                    currentCandies++;
                else
                    currentCandies = 1;
                
                maxCandies = Math.max(maxCandies, currentCandies);
            }
        }
        
        // 열 최대 사탕 개수
        for (int j = 0; j < board[0].length; j++) 
        {
            int currentCandies = 1;
            for (int i = 1; i < board.length; i++) 
            {
                if (board[i][j] == board[i - 1][j]) 
                
                    currentCandies++;
                else
                    currentCandies = 1;
                
                maxCandies = Math.max(maxCandies, currentCandies);
            }
        }

        return maxCandies;
    }
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());
        char[][] board = new char[n][n];

        for (int i = 0; i < n; i++)
            board[i] = br.readLine().toCharArray();

        int maxCandies = 0;

        
        // 행 기준으로 인접한 두 사탕을 교환하고 최대 사탕 개수 찾기
        for (int i = 0; i < n; i++) 
        {
            for (int j = 0; j < n - 1; j++) 
            {
                char temp = board[i][j];
                board[i][j] = board[i][j + 1];
                board[i][j + 1] = temp;

                int currentMax = findMaxCandies(board);

                maxCandies = Math.max(maxCandies, currentMax);

                temp = board[i][j];
                board[i][j] = board[i][j + 1];
                board[i][j + 1] = temp;
            }
        }
        
        // 열 기준으로 인접한 두 사탕을 교환하고 최대 사탕 개수 찾기
        for (int j = 0; j < n; j++) 
        {
            for (int i = 0; i < n - 1; i++) 
            {
                char temp = board[i][j];
                board[i][j] = board[i + 1][j];
                board[i + 1][j] = temp;

                int currentMax = findMaxCandies(board);

                maxCandies = Math.max(maxCandies, currentMax);

                temp = board[i][j];
                board[i][j] = board[i + 1][j];
                board[i + 1][j] = temp;
            }
        }

        System.out.println(maxCandies);
    }
}
