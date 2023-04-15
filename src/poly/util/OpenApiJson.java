/*package poly.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.JsonObject;

public class OpenApiJson {
	
//Json
	
	public OpenApiJson() throws Exception{
		
		JSONParser jsonParser =new JSONParser();// Json을 파싱하기위한 변수 선언인거같음
	    JSONObject jsonObject = (JSONObject)jsonParser.parse(readUrl());// url을 읽어오는거 같음
		JSONObject json = (JSONObject) jsonObject.get("items");//최상위경로 items를 나타내는거같음
		JSONArray array = (JSONArray)json.get("item");
		for (int i = 0 ; i < array.size(); i++) {
			  JSONObject entity = (JSONObject)array.get(i);
	             String ctprvnNm = CmmUtil.nvl((String) entity.get("ctprvnNm"));
	             System.out.println(CmmUtil.nvl(ctprvnNm));
	             
	             String indsLclsCd = CmmUtil.nvl((String) entity.get("indsLclsCd"));
	             System.out.println(CmmUtil.nvl(indsLclsCd));
	             
	             String bizesId = CmmUtil.nvl((String) entity.get("bizesId"));
	             System.out.println(CmmUtil.nvl(bizesId));
	             
	             String bizesNm = CmmUtil.nvl((String) entity.get("bizesNm"));
	             System.out.println(CmmUtil.nvl(bizesNm));
	             
	             String flrNo = CmmUtil.nvl((String) entity.get("flrNo"));
	             System.out.println(CmmUtil.nvl(flrNo));
			
		}
		
		
	}
	
	private static String readUrl() throws Exception{
		BufferedInputStream reader = null;
		try {
			//URL 값넣기 
			URL url =new URL();
			reader = new BufferedInputStream(url.openStream());
	        StringBuffer buffer = new StringBuffer();
	        int i;
	        yte[] b = new byte[4096];
            while( (i = reader.read(b)) != -1){
              buffer.append(new String(b, 0, i));
            }
            return buffer.toString();
        } finally {
            if (reader != null)
                reader.close();
        }
    }
 
    
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        try {
            new OpenApiJson();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
 
}
		
		
	
	

*/