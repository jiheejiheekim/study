package day03;
//알고리즘3 14페이지

import java.util.Arrays;
import java.util.Scanner;

class Point implements Comparable<Point>{
	int x;
	int y;
	
	public Point() {
		
	}
	
	public Point(int x, int y) {
		this.x=x;
		this.y=y;
	}

	@Override
	public String toString() {
		return x+" "+y;
	}

	@Override
	public int compareTo(Point o) {
		if(this.x > o.x) {
			return -1;	//오름차순 => 양수반환
		}else if(this.x == o.x && this.y > o.y) {
			return -1;	//내림차순 => 음수반환
		}else {
			return 1;	//내림차순 => 음수반환
		}
	}

	
}////////////////////

public class Q17_PointSort {

	public static void main(String[] args) {
		//스캐너 이용해서 좌표를 여러개 입력받아서
		Scanner sc=new Scanner(System.in);
		System.out.println("몇 개의 좌표를 입력하겠습니까? => ");
		int num=sc.nextInt();	//좌표 개수
		
		Point [] arr=new Point[num];
		
		sc.nextLine();
		
		for(int i=0; i<num; i++) {
			int x=sc.nextInt();
			int y=sc.nextInt();
			arr[i]=new Point(x,y);
		}
		
		//Point 타입의 배열에 저장 후 sort()한다
		
		Arrays.sort(arr);
		System.out.println(Arrays.toString(arr));

	}

}
