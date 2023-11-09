package day04;

import java.util.*;

/*	
 *  ���α׷��ӽ� ���� ���ڴ� �Ⱦ�-------------------------------------------------
 *  �迭 arr�� �־����ϴ�. �迭 arr�� �� ���Ҵ� ���� 0���� 9������ �̷���� �ֽ��ϴ�. 
 *	�̶�, �迭 arr���� ���������� ��Ÿ���� ���ڴ� �ϳ��� ����� ���� �����Ϸ��� �մϴ�. 
 *	��, ���ŵ� �� ���� ������ ��ȯ�� ���� �迭 arr�� ���ҵ��� ������ �����ؾ� �մϴ�.
 *	-----------------------------------------------------------------------
 */

class Solution {
	
	
	public int[] solution(int[] arr) {
		int[] answer= {};
		ArrayList<Integer> list=new ArrayList<>();

		for(int i=0;i<arr.length-1; i++) {
			if(arr[i+1]!=arr[i]) {
				list.add(arr[i]);
			}
			if(i==arr.length-2) {
				list.add(arr[arr.length-1]);
			}
		}
		
		answer= new int[list.size()];
		
		for(int i=0; i<list.size(); i++) {
			answer[i]=list.get(i);
		}

		
		return answer;
	}
}

public class �������ڴ½Ⱦ� {
	public static void main(String[] args) {
		Solution st = new Solution();

		int[] num = { 1, 1, 3, 3, 0, 1, 1 };
		int[]result=st.solution(num);
		
		System.out.println(Arrays.toString(result));
		
	}

}
