package user;

import java.lang.*;
import java.io.*;
import java.sql.*;
import java.text.*;
import java.util.*;

public class MyUtil {
		//8859_1을 KSC5601로 변환
	public String toKorean(String str) {
		String convStr = null;
		try {
			if(str == null)
				return "";

			convStr = new String(str.getBytes("8859_1"), "KSC5601");
		} catch (UnsupportedEncodingException e) {
		}

		return convStr;
	}
        //KSC5601을 8859_1로 변환
	public String formKorean(String str) {
		String convStr = null;
		try {
			if (str == null)
				return "";
			convStr = new String(str.getBytes("KSC5601"), "8859_1");
		} catch (UnsupportedEncodingException e) {
		}

		return convStr;
	}

	// Null을 ""로 변환
	public String checkNull(String str) {
		String strTmp;
		if(str == null)
			strTmp = "";
		else
			strTmp = str;
		return strTmp;
	}

	// Null을 0으로 변환
	public String checkNull2(String str) {
		String strTmp;
		if(str == null)
			strTmp = "0";
		else
			strTmp = str;
		return strTmp;
	}

	// TextArea에서 입력받은 캐리지 리턴값을 <br>태그로 변환
	public String n12br(String comment)
	{
		// 넘어온 값의 길이를 구합니다.
		int length = comment.length();
		StringBuffer buffer = new StringBuffer();

		//변수의 길이 만큼 반복문을 통해 돌립니다.
		for (int i =0; i<length; ++i)
		{
			//단어를 하나씩 잘라서 변수에 넣습니다.
			String comp = comment.substring(i, i+1);
			if ("\r".compareTo(comp) == 0)
			{
				comp = comment.substring(++i, i+1);
				//만약 엔터에 해당하는 값이 있을 경우에는 <BR>태그를
				//아닐 경우에는 그냥 값을 버퍼에 저장
				if ("\n".compareTo(comp) == 0)
					buffer.append("<BR>\r");
				else
					buffer.append("\r");
			}

			buffer.append(comp);
		}

		//구해진 값을 다시 리턴시킵니다.
		return buffer.toString();
	}

}