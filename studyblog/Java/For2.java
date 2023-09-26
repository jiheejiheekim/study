package studyblog;

public class For2 {

	public static void main(String[] args) {
		
		/*[1] 
		 * 		*****\n
		 * 		*****\n
		 * 		*****\n
		 * 		*****\n
		 * 
		 * 4행 5열
		 */
		
		for(int i=0; i<4; i++) {
			for(int k=0; k<5; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		System.out.println("----------[2]----------");
		/* [2]
		 * 
		 *  *
		 *  **
		 *  ***
		 *  ****
		 * 
		 * */
		/*
		 *  (0,0)
			(1,0)(1,1)
			(2,0)(2,1)(2,2)
			(3,0)(3,1)(3,2)(3,3)
		*/
		
		for(int x=0; x<4; x++) {
			for(int y=0; y<4; y++) {
				if(x>=y) {
					System.out.print("*");
				}
			}
			System.out.println();
			
		}
		System.out.println("또 다른 방법");
		for(int x=1; x<=4; x++) {
			for(int y=1; y<=x; y++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
		
		System.out.println("----------[3]----------");
		
		/*[3]
		 * 
		 *    *
		 *   **
		 *  ***
		 * ****   
		 */
		
		/*
		(0,0)(0,1)(0,2)(0,3)
		(1,0)(1,1)(1,2)(1,3)
		(2,0)(2,1)(2,2)(2,3)
		(3,0)(3,1)(3,2)(3,3)
		*/
		
		for(int x=0; x<4; x++) {
			for(int y=0; y<4; y++) {
				if(x+y>=3) {
					System.out.print("*");
				}else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}
		
		
		
		
		
	}

}
