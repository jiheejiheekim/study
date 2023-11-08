package day02;

public class 문자열뒤집기 {
	/*
	 * https://school.programmers.co.kr/learn/courses/30/lessons/181905
	 * */
	

	public static void main(String[] args) {
		Solutioncc cc=new Solutioncc();
		String str1="Progra21Sremm3";
		String str2="Stanley1yelnatS";
		

		String result1=cc.solution(str1, 6, 12);
		String result2=cc.solution(str2, 4, 10);
		
		System.out.println(result1);
		System.out.println(result2);

	}

}

class Solutioncc {
	public String solution(String my_string, int s, int e) {
		String answer="";

//		못 풀었음
		
//		
//		char[] arr=my_string.toCharArray();
//	
//		
//		for(int i=0; i<arr.length; i++) {
//			if(i>=s && i<=e) {
//				answer+=arr[arr.length-i-1];
//			}else {
//				answer+=arr[i];
//			}
//			
//		}

//		for(int i=0; i<s; i++) {
//			answer+=arr[i];
//		}
//		
//		for (int i=1; i<=s+1; i++) {
//			if(i<=s || i<=e) {
//				answer+=arr[arr.length-i-1];
//			}
//		}
//		
//		for(int i=0; i<=arr.length; i++) {
//			if(i>=e) {
//				answer+=arr[arr.length-1];
//				break;
//			}
//		}
		return answer;

		
	}
}
