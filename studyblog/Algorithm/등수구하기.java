package day05;
import java.util.*;

/*
 * N���� �л��� �����������ԷµǸ� �� �л��� ����� 
 * �Էµ� �����������ϴ����α׷��� �ۼ��ϼ���
 * ���� ������ �Էµ� ��� ���� ����� �����ϰ� ó���Ѵ�.
 * �� ���� ���� ������ 92���ε� 92���� 3�� �����ϸ� 
 * 1���� 3���̰� �� ���� �л��� 4���̴�.
*/
public class ������ϱ� {

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		System.out.println("�л� �� �Է� : ");
		int stnum=sc.nextInt();
		
		System.out.println("���� ���� 5�� �Է� : ");
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
		int[] arr=new int[kpoint.length];		//��� �迭
		
		int rank;
		
		for(int i=0; i<kpoint.length; i++) {
			rank=1; //���
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
