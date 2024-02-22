package Week10;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BOJ_16974_레벨햄버거 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        long X = Long.parseLong(st.nextToken());

        long result = eatPatties(N, X);
        System.out.println(result);
    }

    static long eatPatties(int level, long X) 
    {
        if (level == 0) 
        {
            if (X <= 0) return 0;
            else return 1;
        }

        long layerSize = (1L << level + 1) - 3; // 레벨-L 버거의 레이어 크기
        long halfBurger = (1L << level) - 1; // 레벨-(L-1) 버거 크기

        if (X == 1) return 0;
        else if (X <= 1 + layerSize) return eatPatties(level - 1, X - 1);
        else if (X == 2 + layerSize) return halfBurger + 1;
        else if (X <= 2 + layerSize * 2) return halfBurger + 1 + eatPatties(level - 1, X - 2 - layerSize);
        else return halfBurger * 2 + 1;
    }
}
