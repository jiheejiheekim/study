package day01;

public class 피자나눠먹기2 {

	public static void main(String[] args) {
		Solution5 st=new Solution5();
		
		int result=st.solution(10);
		System.out.println(result);
		

	}

}
/*
 * 6명 	1판 6조각(6조각*1판)=>1조각씩
 * 10명 5판 30조각(6조각*5)=>3조각씩
 * 4명  2판 12조각(6조각*2)=>3조각씩
 * 12명 2판 12조각(6조각*2)=>1조각씩
 * 15명 5판 30조각		=>2조각씩
 * */

class Solution5 {
    public int solution(int n) {
    	int answer = 6;	//피자 조각 수
    	
    	while(answer%n!=0) {
    		answer+=6;
    	}
    	answer=answer/6;
    	
        return answer;
        
    }
}