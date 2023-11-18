package com.newlecture.web.controller.admin.notice;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.newlecture.web.entity.Notice;
import com.newlecture.web.service.NoticeService;


@MultipartConfig(
		fileSizeThreshold=1024*1024, //1메가바이트가 넘어가면 메모리 말고 디스크를 쓰자는 의미
		maxFileSize=1024*1024*5,
		maxRequestSize=1024*1024*5*5
)
@WebServlet("/admin/board/notice/reg")
public class RegController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/view/admin/board/notice/reg.jsp")
		.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String isOpen=request.getParameter("open");
		
		Collection<Part> parts=request.getParts();
		
		StringBuilder builder=new StringBuilder();
		
		//조건검사
		for(Part p:parts) {
		
			if(!p.getName().equals("file")) continue; //file이 아니라면 빠져나옴
			
			Part filePart=p;
			String fileName=filePart.getSubmittedFileName(); //파일명 알아내기
			
			builder.append(fileName);
			builder.append(",");	//첫번째파일,두번째파일
			
			InputStream fis=filePart.getInputStream();
		
			String realPath=request.getServletContext().getRealPath("/upload");
			//물리경로를 알려줌
			System.out.println(realPath);
			
			String filePath=realPath + File.separator + fileName;
			//File.separator : 현재시스템이 가진 경로 구분방법을 문자로 제공해줌
			FileOutputStream fos=new FileOutputStream(filePath);
			
			byte[] buf=new byte[1024]; 
			//fis.read(): 파일을 다 읽었다는 의미의 결과값을 -1이라는 정수형으로 반환
			//반복문을 돌려 파일을 읽기(파일이 1바이트를 초과하기때문)
			int size=0;
			while((size=fis.read(buf)) != -1) {
				fos.write(buf,0,size); //버퍼에 담겨있는 a(0)부터 b(size,길이)까지
			}
			
			fos.close();
			fis.close();
		}//for---------------------------------------------------
		
		builder.delete(builder.length()-1,builder.length());
		
		boolean pub=false; //기본값 할당
		if(isOpen!=null) {
			pub=true;
		}
		
		Notice notice=new Notice();
		notice.setTitle(title);
		notice.setContent(content);
		notice.setPub(pub);
		notice.setWriterId("newlec"); //임의로 사용자 아이디 등록
		notice.setFiles(builder.toString());
		
		NoticeService service=new NoticeService();
		service.insertNotice(notice);
				
		response.sendRedirect("list");
		//경로를 입력하지 않으면 현재 매핑 "/admin/board/notice/reg" 끝부분 reg를 지우고
		//list를 입력하여 서비스로 이동 
	}
}
