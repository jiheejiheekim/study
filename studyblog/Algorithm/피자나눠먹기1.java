package day01;

public class ÇÇÀÚ³ª´²¸Ô±â1 {

	public static void main(String[] args) {
		
		int n=7;
		//int n=1;
		//int n=15;
		
		Solution3 st=new Solution3();
		
		int num=st.solution(n);
		System.out.println(num);
	}
}

	class Solution3 {
	    public int solution(int n) {
	        int answer = 0;
	        
	        if(n%7!=0) {
	        	answer=(n/7)+1;
	        }else if(n%7==0) {
	        	answer=n/7;
	        }

	        return answer;
	    }
	}
