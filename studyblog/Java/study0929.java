package studyblog;
import java.util.*;

public class study0929 {

	public static void main(String[] args) {
		//[문제1] Math.random()을 이용해서
		//0<= a <10 사이의 임의의 정수를 발생시키세요, 변수 a
		
		int a = (int)(Math.random()*10);
		System.out.println("a : "+a);
		
		
		System.out.println("--------[2]---------");
		//5<=v3<15 사이의 임의의 정수를 발생시키세요, +5
		
		int b = (int)(Math.random()*10+5);
		System.out.println("b : "+b);
		
		
		System.out.println("--------Array---------");
		
		char[] c = {'J', 'a', 'v', 97};	//97은 'a'의 아스키코드
		System.out.println("b.length: "+c.length);
		System.out.println(c[3]);	//a
		System.out.println("*****************");
		//for문을 이용해서 c에 저장된 값을 한꺼번에 출력하세요
		
		for(int i=0; i<c.length; i++) {
			System.out.println(c[i]);
		}
		
		
		System.out.println("--------for-each---------");
		
		char[] cc = {'J', 'a', 'v', 97};	

		for(char ccc:cc) {
			System.out.println(ccc);
		}
		
		System.out.println(">>>>>>>>>>>>2차원배열<<<<<<<<<<");
		//1) 선언
//		int [][]a;	
//		int []a[];
		int aa[][];
		
		
		//2) 메모리할당 : 행의 크기, 열의 크기 지정
		aa=new int[3][2];		//3행 2열

		//3) 초기화 : 하지않으면 디폴트값인 0이 들어있음
		aa[0][0]=10;
		aa[0][1]=20;
		
		aa[1][0]=30;
		aa[1][1]=40;
		
		aa[2][0]=50;
		aa[2][1]=60;
		System.out.println("--------for---------");
		//[1] for문을 이용한 출력
		for(int i=0; i<aa.length; i++) {
			for(int k=0; k<aa[i].length; k++) {
				System.out.println("aa["+i+"]["+k+"] = "+aa[i][k]);
			}
		}

		System.out.println("--------for-each---------");
		//[2] for each문을 이용한 출력
		for(int[] z:aa) {		//행 z가 aa를 참조
			for(int x:z) {	  	//열 x가 행 z를 참조
				System.out.print(x+", ");
			}
			System.out.println();
		}
		

		
		
		
		
		
	}

}
