package day01;

public class ���ڳ����Ա�3 {

	public static void main(String[] args) {

		Solution4 st=new Solution4();
		
		int n=12;
		int slice=4;
		
		int num=st.solution(slice, n);
		System.out.println(num);
		
	}

}
	/* 10�� 7�����̽� 2�� n%slice>0 : n/slice+1 : 2��
	 * 12�� 4�����̽� 3�� n%slice==0 -> n/slice : 3��
	 * 15�� 6�����̽� 3�� n%slice>0 : n/slice+1 : 3�� 
	 * */


	class Solution4 {
	    public int solution(int slice, int n) {
	        int answer = 0;
	        
	        if(n%slice==0) {
	        	answer=n/slice;
	        }else if(n%slice>0) {
	        	answer=n/slice+1;
	        }
	        
	        return answer;	//������ ����
	    }
	}