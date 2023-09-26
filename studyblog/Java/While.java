package studyblog;
import java.util.*;

public class While {

	public static void main(String[] args) {
		//[1] while문을 이용해서 해당하는 구구단 식을 출력하세요
		
		//[2] while문을 중첩하여 구구단 전체를 테이블 형태로 출력하세요
		/*
		 * 2x1=2	3x1=3	4x1=4		.....	9x1=9
		 * 2x2=4	3x2=6 .....
		 * 
		 * 2x9=18	3x9=27
		 * */
		
				System.out.println("--------[1]--------");
		System.out.println("보고 싶은 구구단의 숫자를 입력하세요 ex)2=> ");
		
		Scanner sc=new Scanner(System.in);
		int num=sc.nextInt();
		
		int i=1;
		while(i<10) {
			System.out.printf("%d x %d = %d\n", num, i, num*i);
			i++;
		}
		
		
		System.out.println("--------[2]--------");
		//[2] while문을 중첩하여 구구단 전체를 테이블 형태로 출력하세요
		/*
		* 2x1=2	3x1=3	4x1=4		.....	9x1=9
		* 2x2=4	3x2=6 .....
		* 
		* 2x9=18	3x9=27
		* */
		
		
		int a=1;
		
		while(a<10) {
			int b=2;
			while(b<10) {
				System.out.printf("%d x %d = %d\t", b, a, a*b);
				b++;       		//b * a : b가 9가 되면 그제서야 a++
			}
			a++;
			System.out.println();	//이 문장 수행 후 다시 b는 2로 초기화됨
		}

		

		
	}

}
