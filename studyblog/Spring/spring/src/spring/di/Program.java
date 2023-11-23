package spring.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import spring.di.ui.ExamConsole;

public class Program {

	public static void main(String[] args) {
		
		/* 스프링에게 지시하는 방법으로 코드를 변경
		Exam exam=new NewlecExam();
		Exam exam=new NewlecExam(10,10,10,10);
		ExamConsole console=new GridExamConsole(); 
		
		console.setExam(exam);
		*/
		
		//지시사항 알리기
		ApplicationContext context=
				new AnnotationConfigApplicationContext(NewlecDIConfig.class);
				//new ClassPathXmlApplicationContext("spring/di/setting.xml");
		
		//Exam exam=context.getBean(Exam.class);
		//System.out.println(exam.toString());
		
		//bean에 console이라는 이름의 지시서를 꺼내달라 
		ExamConsole console=(ExamConsole)context.getBean("console");
		//ExamConsole console=context.getBean(ExamConsole.class);
		console.print();
		
		//Exam을 참조하기 위한 컬렉션 ArrayList
		//List<Exam> exams=new ArrayList<>();
		//List<Exam> exams=(List<Exam>) context.getBean("exams");
		//exams.add(new NewlecExam(1,1,1,1));
		
		
		//for(Exam e:exams) {
			//System.out.println(e);
		//}

	}

}
