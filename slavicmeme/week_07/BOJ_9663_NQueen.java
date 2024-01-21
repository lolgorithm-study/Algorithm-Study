package Week07;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BOJ_9663_NQueen {
	
	/*

	   1. 재귀호출을 어떻게 할 것인가
	
	   2. 퀸을 놓을 수 있는지 여부를 어떻게 조건문으로 판별 할 것인가
	 */

    static int N;
    static int count = 0;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        N = Integer.parseInt(br.readLine());

        // 각 열에 퀸을 놓을 행의 위치를 저장하는 배열
        int[] queenPos = new int[N];

        // 백트래킹을 이용하여 퀸을 놓는 경우의 수를 탐색
        nQueen(queenPos, 0);

        System.out.println(count);
    }

    // 퀸을 놓는 함수
    static void nQueen(int[] queenPos, int row) {
        if (row == N) 
        {
            // N개의 퀸을 모두 놓은 경우
            count++;
            return;
        }

        for (int i = 0; i < N; i++) 
        {
            queenPos[row] = i;
            if (Possibility(queenPos, row))
                // 현재 위치에 퀸을 놓을 수 있다면 다음 행으로 진행
                nQueen(queenPos, row + 1);
            // 백트래킹: 현재 위치에 퀸을 놓을 수 없으면 다른 위치로 시도
        }
    }

    // 현재 위치에 퀸을 놓을 수 있는지 확인하는 함수
    static boolean Possibility(int[] queenPos, int row) 
    {
        for (int i = 0; i < row; i++)
        {
            // 같은 열에 놓였거나, 대각선 상에 위치하는지 확인
            if (queenPos[i] == queenPos[row] || Math.abs(queenPos[i] - queenPos[row]) == row - i)
                return false;
        }
        return true;
    }
}
