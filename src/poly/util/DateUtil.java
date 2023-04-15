package poly.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String DateFormat(String date) throws ParseException {

		Date date1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
		
		String newstring = new SimpleDateFormat("yyyy-MM-dd").format(date1);
		return newstring;
	
	}

}
