package etcTest;

import java.util.Date;

public class DateTest {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Date today = new Date();
		Long MillisecondTime = today.getTime();
		System.out.println("time : " + MillisecondTime);
		
		today.setDate(10);
		MillisecondTime = today.getTime();
		System.out.println("time2 : " + MillisecondTime);
		
	}

}
