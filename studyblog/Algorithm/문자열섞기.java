package day02;

import java.util.Arrays;

public class ¹®ÀÚ¿­¼¯±â {

	public static void main(String[] args) {
		Solutionaa aa=new Solutionaa();
		
		String str1="aaaaa";
		String str2="bbbbb";
		
		String a=aa.solution(str1, str2);
		
		System.out.println(a);

	}

}
class Solutionaa {
    public String solution(String str1, String str2) {
        String answer = "";
        
        char[] a=str1.toCharArray();
        char[] b=str2.toCharArray();
        
        for(int i=0; i<a.length; i++) {
        	//System.out.print(a[i]);
        	//System.out.print(b[i]);
        	answer+=(char)a[i];
        	answer+=(char)b[i];
        }
        
        return answer;
    }
}
