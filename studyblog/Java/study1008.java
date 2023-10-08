package studyblog;

import java.util.*;

public class study1008 {

	public static void main(String[] args) {
		
		//1. HashMap 객체 생성해서 값 집어넣기
		HashMap map=new HashMap();
		map.put("번호", 1);
		map.put(2, "색깔");
		map.put("연봉", 7000);
		map.put("지역", "광주");
		
		//2. 값 출력하기
		Integer i1=(Integer)map.get("번호");
		System.out.println(i1);
		
		String i2=(String)map.get(2);
		System.out.println(i2);
		
		Integer i3=(Integer)map.get("연봉");
		System.out.println(i3);
		
		String i4=(String)map.get("지역");
		System.out.println(i4);
		
		//3. Generic 사용 해서 새 객체 생성
		HashMap<String, Integer> hs=new HashMap<>();
		hs.put("생년", 02);
		hs.put("연봉", 7000);
		hs.put("우편번호", 23701);
		hs.put("나이", 22);
		
		//4. key값만 꺼내오기
		System.out.println("------------key값만 꺼내오기 - 1번째 방법");
		Set<String> set=hs.keySet();
		System.out.println(set);
		
		System.out.println("------------key값만 꺼내오기 - 2번째 방법");
		Iterator<String> it=set.iterator();
		while(it.hasNext()) {
			String s=it.next();
			System.out.println(s);
		}
		
		//5. value값만 꺼내오기
		System.out.println("------------value값만 꺼내오기 - 1번째 방법");
		Collection<Integer> col=hs.values();
		System.out.println(col);
		
		System.out.println("------------value값만 꺼내오기 - 2번째 방법");
		for(Integer val:col) {
			System.out.println(val);
		}
		
	}

}
