package day03;
//�˰���3 14������

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
			return -1;	//�������� => �����ȯ
		}else if(this.x == o.x && this.y > o.y) {
			return -1;	//�������� => ������ȯ
		}else {
			return 1;	//�������� => ������ȯ
		}
	}

	
}////////////////////

public class Q17_PointSort {

	public static void main(String[] args) {
		//��ĳ�� �̿��ؼ� ��ǥ�� ������ �Է¹޾Ƽ�
		Scanner sc=new Scanner(System.in);
		System.out.println("�� ���� ��ǥ�� �Է��ϰڽ��ϱ�? => ");
		int num=sc.nextInt();	//��ǥ ����
		
		Point [] arr=new Point[num];
		
		sc.nextLine();
		
		for(int i=0; i<num; i++) {
			int x=sc.nextInt();
			int y=sc.nextInt();
			arr[i]=new Point(x,y);
		}
		
		//Point Ÿ���� �迭�� ���� �� sort()�Ѵ�
		
		Arrays.sort(arr);
		System.out.println(Arrays.toString(arr));

	}

}
