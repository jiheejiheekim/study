package spring.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import spring.di.ui.ExamConsole;

public class Program {

	public static void main(String[] args) {
		
		/* ���������� �����ϴ� ������� �ڵ带 ����
		Exam exam=new NewlecExam();
		Exam exam=new NewlecExam(10,10,10,10);
		ExamConsole console=new GridExamConsole(); 
		
		console.setExam(exam);
		*/
		
		//���û��� �˸���
		ApplicationContext context=
				new AnnotationConfigApplicationContext(NewlecDIConfig.class);
				//new ClassPathXmlApplicationContext("spring/di/setting.xml");
		
		//Exam exam=context.getBean(Exam.class);
		//System.out.println(exam.toString());
		
		//bean�� console�̶�� �̸��� ���ü��� �����޶� 
		ExamConsole console=(ExamConsole)context.getBean("console");
		//ExamConsole console=context.getBean(ExamConsole.class);
		console.print();
		
		//Exam�� �����ϱ� ���� �÷��� ArrayList
		//List<Exam> exams=new ArrayList<>();
		//List<Exam> exams=(List<Exam>) context.getBean("exams");
		//exams.add(new NewlecExam(1,1,1,1));
		
		
		//for(Exam e:exams) {
			//System.out.println(e);
		//}

	}

}
