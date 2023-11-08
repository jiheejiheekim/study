package day02;

public class A강조하기 {

	public static void main(String[] args) {
		Solutionbb bb=new Solutionbb();
		
		String str="PrOgRaMmErS";
		String result=bb.solution(str);
		System.out.println(result);
	}

}
class Solutionbb {
    public String solution(String myString) {
        String answer = "";
        
        char[] arr=myString.toCharArray();
        
        for(int i=0; i<arr.length; i++) {
        	if(arr[i]=='a') {
        		answer+=Character.toUpperCase(arr[i]);
        	}else if(arr[i]!='A' && Character.isUpperCase(arr[i])) {
        		answer+=Character.toLowerCase(arr[i]);
        	}else {
        		answer+=arr[i];
        	}
        }
        
        return answer;
    }
 }