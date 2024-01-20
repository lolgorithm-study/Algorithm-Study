package Week06;
 
import java.io.*;

public class BOJ_7490_0만들기 {

    static int n;
    static StringBuilder sb = new StringBuilder();
    
    // KGH combo 수식을 만드는 함수(재귀)
    private static void combo(int num, int len, String str) 
    {
        if (len == n) 
        {
            if (calculate(str) == 0)
                formatAndAppend(str);

            return;
        }

        combo(num + 1, len + 1, str + (num + 1));
        combo(num + 1, len + 1, str + '+' + (num + 1));
        combo(num + 1, len + 1, str + '-' + (num + 1));
    }

    // 수식 계산하기
    private static int calculate(String str) 
    {
        int result = 0;
        char operator = '+';
        StringBuilder numBuilder = new StringBuilder();

        // 수식을 순회하면서 계산하기
        for (char ch : str.toCharArray()) 
        {
            if (ch == '+' || ch == '-') 
            {
                int num = Integer.parseInt(numBuilder.toString());
                if (operator == '+')
                    result += num;
                else
                    result -= num;
                
                operator = ch;
                numBuilder = new StringBuilder();
            } 
            
            else
                numBuilder.append(ch);
        }

        // 마지막 숫자 처맇기
        int lastNum = Integer.parseInt(numBuilder.toString());
        if (operator == '+')
            result += lastNum;
        else
            result -= lastNum;

        return result;
    }

    // 포맷에 맞게 수식 만들고 추가하기
    private static void formatAndAppend(String str) 
    {
        StringBuilder formattedStr = new StringBuilder();
        char prevChar = ' ';

        for (char ch : str.toCharArray()) 
        {
            if (Character.isDigit(prevChar) && Character.isDigit(ch))
                formattedStr.append(' ').append(ch);
            else
                formattedStr.append(ch);
            prevChar = ch;
        }

        sb.append(formattedStr.toString()).append("\n");
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int t = Integer.parseInt(br.readLine());
        while (t-- > 0)
        	/* 저번에도 설명 햇듯이 for range(0, t) 와 같음 t-- 는 t -= 1
        	 * 식이 한번 돌 때마다 t 값은 -- 되고 결국 0어 false 가 되어 멈추는 로직.. 알지?
        	 */
        {
            n = Integer.parseInt(br.readLine());
            combo(1, 1, "1");
            sb.append("\n");
        }
        
        System.out.println(sb.toString());
    }
}
