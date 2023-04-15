package poly.util;


//정규식 문자 제거 해줄곳
public class FormatString {

	
	//xml파싱해서  ? 값 지워줌
	public static String stringChg(String str) throws Exception {
		
		String strCom=str;
		
		int idx=strCom.indexOf("?");
		String str1 = strCom.substring(0, idx);
		System.out.println("str1"+str1);

		return str1;
		
	}
	
public static String stringExtr(String str) throws Exception {
		
		String strCom=str;
		
		String str1 =strCom.substring(strCom.indexOf("?"),strCom.length());
		System.out.println("str1"+str1);
		
		return str1;
		
	}
public static String lastStringSub(String str) {
    if (str.length() > 0 && str.charAt(str.length()-1)==',') {
      str = str.substring(0, str.length()-1);
    }
    return str;
}
	/*
	 * 
	 * 
	 *   String mail = "abced naver";
	        
	        // 먼저 @ 의 인덱스를 찾는다 - 인덱스 값: 5
	        int idx = mail.indexOf(" "); 
	        
	        // @ 앞부분을 추출
	        // substring은 첫번째 지정한 인덱스는 포함하지 않는다.
	        // 아래의 경우는 첫번째 문자열인 a 부터 추출된다.
	        String mail1 = mail.substring(0, idx);
	        
	        // 뒷부분을 추출
	        // 아래 substring은 @ 바로 뒷부분인 n부터 추출된다.
	        String mail2 = mail.substring(idx+1);
	      
	        System.out.println("mail1 : "+mail1);abcde
	        System.out.println("mail2 : "+mail2);naver

	 * 
	 * 
	 * */

	
}
