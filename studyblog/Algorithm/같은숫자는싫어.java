package day04;

import java.util.*;

/*	
 *  프로그래머스 같은 숫자는 싫어-------------------------------------------------
 *  배열 arr가 주어집니다. 배열 arr의 각 원소는 숫자 0부터 9까지로 이루어져 있습니다. 
 *	이때, 배열 arr에서 연속적으로 나타나는 숫자는 하나만 남기고 전부 제거하려고 합니다. 
 *	단, 제거된 후 남은 수들을 반환할 때는 배열 arr의 원소들의 순서를 유지해야 합니다.
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

public class 같은숫자는싫어 {
	public static void main(String[] args) {
		Solution st = new Solution();

		int[] num = { 1, 1, 3, 3, 0, 1, 1 };
		int[]result=st.solution(num);
		
		System.out.println(Arrays.toString(result));
		
	}

}
