package kr.or.ddit.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserUtil {
	
	public static String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
}
