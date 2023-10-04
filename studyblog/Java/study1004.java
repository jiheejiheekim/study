package studyblog;
import java.util.*;

public class study1004 {

	public static void main(String[] args) {
		
		ArrayList<String> list2=new ArrayList<>();
		list2.add("홍길동");
		list2.add("김길동");
		list2.add("고길동");
		list2.add("민길동");
		//list2.add(500);   //[x], String유형이 아니라서 에러
		
		for(int i=0; i<list2.size(); i++){
		    String arrlist = list2.get(i);
		    System.out.println(arrlist);
		}
		
		//﻿예제 2 : list2에서 인덱스 2의 데이터를 삭제하세요
		list2.remove(2);
		
		System.out.println("--2번 인덱스 삭제 후--");
		for(int i=0; i<list2.size(); i++){
		    String arrlist = list2.get(i);
		    System.out.println(arrlist);
		}
		
		System.out.println("--for each--");
		//예제 3 :for each문은 Generic을 사용할 경우에 쓸 수 있다.
		for(String arr : list2) {
			System.out.println(arr);
		}
		
		//﻿예제 4 : list2의 2번 인덱스에 "양철수" 넣기
		list2.add(2,"양철수");
		
		System.out.println("--for each2--");
		for(String arr3 : list2) {
			System.out.println(arr3);
		}
		
		
		
		System.out.println("--HashSet--");
		HashSet<String> set=new HashSet<>();      //String타입만 들어가는 Hashset 객체 선언
		set.add("구글");
		set.add("네이버");
		set.add("다음");
		set.add("네이트");
		
		
		
		Iterator<String> it=set.iterator();
		
		while(it.hasNext()){                     //커서를 이동하면서 반복문을 돈다
			   String str=it.next();
			   System.out.println(str);
			}
		
		
		//for each loop
		System.out.println("--for each loop--");
		
		for(String str:set) {
		    System.out.println(str.toUpperCase());
		}
				
		System.out.println(set.size()+"<=저장된 객체 수");
		
		
	}

}
