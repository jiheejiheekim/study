package day01;

public class ���ڳ����Ա�2 {

	public static void main(String[] args) {
		Solution5 st=new Solution5();
		
		int result=st.solution(10);
		System.out.println(result);
		

	}

}
/*
 * 6�� 	1�� 6����(6����*1��)=>1������
 * 10�� 5�� 30����(6����*5)=>3������
 * 4��  2�� 12����(6����*2)=>3������
 * 12�� 2�� 12����(6����*2)=>1������
 * 15�� 5�� 30����		=>2������
 * */

class Solution5 {
    public int solution(int n) {
    	int answer = 6;	//���� ���� ��
    	
    	while(answer%n!=0) {
    		answer+=6;
    	}
    	answer=answer/6;
    	
        return answer;
        
    }
}