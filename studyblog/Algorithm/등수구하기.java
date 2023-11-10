package day05;
import java.util.*;

/*
 * N명의 학생의 국어점수가입력되면 각 학생의 등수를 
 * 입력된 순서대로출력하는프로그램을 작성하세요
 * 같은 점수가 입력될 경우 높은 등수로 동일하게 처리한다.
 * 즉 가장 높은 점수가 92점인데 92점이 3명 존재하면 
 * 1등이 3명이고 그 다음 학생은 4등이다.
*/
public class 등수구하기 {

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		System.out.println("학생 수 입력 : ");
		int stnum=sc.nextInt();
		
		System.out.println("국어 성적 5개 입력 : ");
		int[] kpoint=new int[stnum];
		for(int i=0; i<stnum; i++) {
			kpoint[i]=sc.nextInt();
		}
		
	
		int[] arr=korank(kpoint);
		System.out.println(Arrays.toString(arr));

	}
	
	/*
	 78 82 65 82 100
	 */
	
	public static int[] korank(int[] kpoint) {
		int[] arr=new int[kpoint.length];		//등수 배열
		
		int rank;
		
		for(int i=0; i<kpoint.length; i++) {
			rank=1; //등수
			for(int j=0; j<kpoint.length; j++) {
				if(i!=j && kpoint[i] < kpoint[j]) {
					rank+=1;
				}
			}
			arr[i]=rank;
		}
		return arr;
		//System.out.println("arr    : "+Arrays.toString(arr));
		//System.out.println("kpoint : "+Arrays.toString(kpoint));
	
	}
	

}
