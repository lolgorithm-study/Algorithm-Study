package Week07;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class BOJ_1759_암호만들기 {
	
	private static StringBuilder sb = new StringBuilder();
	
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String[] input = br.readLine().split(" ");
        int L = Integer.parseInt(input[0]);
        int C = Integer.parseInt(input[1]);
        char[] characters = new char[C];

        input = br.readLine().split(" ");
        
        for (int i = 0; i < C; i++)
            characters[i] = input[i].charAt(0);

        Arrays.sort(characters); // 아스키 코드로 정렬

        
        generater(characters, L, 0, 0);

        br.close();
    }

    // 가능성 있는 암호를 생성하는 메소드
    private static void generater(char[] characters, int L, int start, int depth) 
    {
        if (sb.length() == L) 
        {
            if (depth >= 1 && L - depth >= 2)
                System.out.println(sb.toString());
            
            return;
        }

        for (int i = start; i < characters.length; i++) 
        {
            sb.append(characters[i]);

            if (isVowel(characters[i]))
                generater(characters, L, i + 1, depth + 1);
            
            else
                generater(characters, L, i + 1, depth);

            sb.deleteCharAt(sb.length() - 1);
        }
    }

    // 주어진 문자가 모음인지 확인하는 메소드
    private static boolean isVowel(char c) 
    /*
     * vowel : 모음
		noun [ C ]
		UK  /vaʊəl/ US  /vaʊəl/
		Add to word list 
		B1
		a speech sound produced by humans when the breath flows out through the mouth without being blocked by the teeth, tongue, or lips:
		A short vowel is a short sound as in the word "cup".
		A long vowel is a long sound as in the word "shoe".
     */
    {
        return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
    }
}
