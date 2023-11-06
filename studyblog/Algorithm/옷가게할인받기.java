package day01;

public class 옷가게할인받기 {

	public static void main(String[] args) {
		Solution6 st=new Solution6();

		int price=10000;
		
		int result=st.solution(price);
		System.out.println(result);
	}

}
class Solution6 {
    public int solution(int price) {
        int answer = price;
        
        if(price>=100000 && price<300000) {
        	answer=(int)(price*0.95);
        }else if(price>=300000 && price<500000) {
        	answer=(int)(price*0.9);
        }else if(price>=500000) {
        	answer=(int)(price*0.8);
        }
        
        return answer;
    }
}