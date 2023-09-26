package studyblog;

public class For {
	public static void main(String[] args) {
		
		//for문 이용해서 1~10까지의 합과 곱을 구해 출력하세요
		
		int sum=0;
		
		for (int i=1; i<=10; i++) {
			System.out.print(i+"+");
			sum+=i;
			if(i==10) {
				System.out.print("10="+sum);
			}
		}
		
		System.out.println();
		//1~20까지 정수 중 2 또는 3의 배수가 아닌 수를
		//출력하고, 이 수들의 총합을 구하세요
		
		int sum2=0;
		for(int i=1; i<=20; i++) {
			if(i%2!=0 && i%3!=0) {
				System.out.print(i+", ");
				sum2+=i;
			}
		}
		System.out.println();
		System.out.println("총 합 : "+sum);

	
		
		
		//알파벳 대문자A,B...Z 를 for루프 이용해 출력하기
		
		for(int i=65; i<=90; i++) {
			System.out.print((char)i+", ");
		}
		

		
		
		
	}
	

}
