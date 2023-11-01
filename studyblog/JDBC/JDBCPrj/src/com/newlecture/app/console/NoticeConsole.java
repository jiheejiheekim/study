package com.newlecture.app.console;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import com.newlecture.app.entity.Notice;
import com.newlecture.app.service.NoticeService;

public class NoticeConsole {

	private NoticeService service;
	private int page;	//상태변수
	private String searchField;
	private String searchWord;
	
	
	public NoticeConsole() {
		service=new NoticeService();
		page=1;					//기본값
		searchField="title";	
		searchWord="";	
	}
	
	public void printNoticeList() throws ClassNotFoundException, SQLException {
		List<Notice> list=service.getList(page, searchField, searchWord);	//int값(page) 넣고 출력
		int count=service.getCount();	//지역변수로 수정
		int lastPage=count/10;			//마지막페이지
		//lastPage = count%10==0? lastPage:lastPage+1;	//3항연산자
		lastPage = count%10>0? lastPage+1:lastPage;	//3항연산자
		
		System.out.println("-------------------------------------");
		System.out.printf("<공지사항> 총 %d 게시글\n", count);
		System.out.println("-------------------------------------");
		
		//반복문
		for(Notice n:list) {
			System.out.printf("%d. %s / %s / %s\n",
					n.getId(), n.getTitle(), n.getWriterId(), n.getRegDate());
		}
		System.out.println("-------------------------------------");
		System.out.printf("            %d / %d pages\n", page, lastPage);
	}
	


	public int inputNoticeMenu() {
		Scanner scan=new Scanner(System.in);
		
		System.out.printf("1.상세조회 / 2.이전 / 3.다음 / 4.글쓰기 /5.검색 /6.종료 >");
		//int menu=scan.nextInt();	
		//입력값이 숫자여도 엔터키가 영향을 줄 수 있음 -> String으로 받음
		
		String menu_=scan.nextLine();
		int menu=Integer.parseInt(menu_);
		
		return menu;
	}

	public void movePrevList() {	//2번(이전) 입력 시
		if(page==1) {
			System.out.println("=========================");
			System.out.println("[ 이전 페이지가 없습니다 ]");
			System.out.println("=========================");
		}
		page--;
	}

	public void moveNextList() throws ClassNotFoundException, SQLException {
		
		int count=service.getCount();	//지역변수로 수정
		int lastPage=count/10;			//마지막페이지
		lastPage = count%10>0? lastPage+1:lastPage;	//3항연산자
		
		if(page==lastPage) {
			System.out.println("=========================");
			System.out.println("[ 다음 페이지가 없습니다 ]");
			System.out.println("=========================");
		}
		page++;
		
	}

	public void inputSearchWord() {
		Scanner scan=new Scanner(System.in);
		
		//검색하기 위한 필드 만들기
		System.out.println("검색 범주(title/content/wriertId)중에 하나를 입력하세요");
		System.out.println(">");
		searchField=scan.nextLine();
		
		System.out.println("검색어 > ");
		searchWord = scan.nextLine();
	}

}
