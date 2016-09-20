package kr.co.hanandong.common.utils;

public class Strings {
	
	public static String getString(Object object) {
		if (object == null) {
			return "";
		}
		else {
			return (String)object;
		}
	}
	
	public static String getString(Object object, String defaultValue) {
		if (object == null)
			return defaultValue;
		else if (((String)object).length() < 1)
			return defaultValue;
		else
			return (String)object;		
	}
	
	public static String getReplaced(String string, String oldString, String newString) {

        String convert 	= new String();
        int position	= 0;
        int begin 		= 0;

        position = string.indexOf(oldString);

        if (position == -1) {
            return string;
        }
        else
        {
            while (position != -1) {
                convert 	= convert + string.substring(begin, position) + newString;
                begin 		= position + oldString.length();
                position 	= string.indexOf(oldString, begin);
            }

            convert = convert + string.substring(begin);

            return convert;
        }
    }

}
