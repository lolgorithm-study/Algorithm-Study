package Week06;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class BOJ_16955_오목이길수있을까 {
	
	/*
	 * 신건우의 아이디어를 채택.. 감사합니다람쥐
	 */
	
	private static int canWin(char[][] board) 
    {
        for (int i = 0; i < 10; i++) 
        {
            for (int j = 0; j < 10; j++) 
            {
                if (board[i][j] == '.')
                {
                    board[i][j] = 'X';

                    if (checkWin(board, 'X')) 
                    {
                        board[i][j] = '.';
                        return 1;
                    }
                    board[i][j] = '.';
                }
            }
        }

        return 0;
    }
	
	private static boolean checkWin(char[][] board, char player) 
    {
        // 가로 방향 확인
        for (int i = 0; i < 10; i++)
        {
            for (int j = 0; j < 6; j++) 
            {
                boolean win = true;
                for (int k = 0; k < 5; k++)
                {
                    if (board[i][j + k] != player) 
                    {
                        win = false;
                        break;
                    }
                }
                
                if (win) 
                	return true;
            }
        }

        // 세로 방향 확인
        for (int i = 0; i < 6; i++) 
        {
            for (int j = 0; j < 10; j++) 
            {
                boolean win = true;
                for (int k = 0; k < 5; k++) 
                {
                    if (board[i + k][j] != player) 
                    {
                        win = false;
                        break;
                    }
                }
                
                if (win) 
                	return true;
            }
        }

        // 대각선 방향 확인 (왼쪽 위에서 오른쪽 아래로)
        for (int i = 0; i < 6; i++)
        {
            for (int j = 0; j < 6; j++) 
            {
                boolean win = true;
                for (int k = 0; k < 5; k++) 
                {
                    if (board[i + k][j + k] != player) 
                    {
                        win = false;
                        break;
                    }
                }
                
                if (win)
                	return true;
            }
        }

        // 대각선 방향 확인 (오른쪽 위에서 왼쪽 아래로)
        for (int i = 0; i < 6; i++) 
        {
            for (int j = 9; j >= 4; j--) 
            {
                boolean win = true;
                
                for (int k = 0; k < 5; k++) 
                {
                    if (board[i + k][j - k] != player) 
                    {
                        win = false;
                        break;
                    }
                }
                
                if (win) 
                	return true;
            }
        }

        return false;
    }
    
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        char[][] board = new char[10][10];
        for (int i = 0; i < 10; i++)
            board[i] = br.readLine().toCharArray();

        int result = canWin(board);
        System.out.println(result);

        br.close();
    }
}

