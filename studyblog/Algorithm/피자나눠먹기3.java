package day01;

public class 피자나눠먹기3 {

	public static void main(String[] args) {

		Solution4 st=new Solution4();
		
		int n=12;
		int slice=4;
		
		int num=st.solution(slice, n);
		System.out.println(num);
		
	}

}
	/* 10명 7슬라이스 2판 n%slice>0 : n/slice+1 : 2판
	 * 12명 4슬라이스 3판 n%slice==0 -> n/slice : 3판
	 * 15명 6슬라이스 3판 n%slice>0 : n/slice+1 : 3판 
	 * */


	class Solution4 {
	    public int solution(int slice, int n) {
	        int answer = 0;
	        
	        if(n%slice==0) {
	        	answer=n/slice;
	        }else if(n%slice>0) {
	        	answer=n/slice+1;
	        }
	        
	        return answer;	//피자의 개수
	    }
	}