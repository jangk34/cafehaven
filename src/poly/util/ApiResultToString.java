package poly.util;

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.net.URL;
import java.net.URLEncoder;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;



public class ApiResultToString {

	public String getString(HashMap<String, String> map) throws Exception {

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/baroApi"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=NcFjbOBSI%2BQTk%2FovAYOyOp73riif5LM8CcV9SrMUOLumNRUc2%2F%2B5DygIPD0TJ%2BENUHz8noCQXEOD4OmvPHbvtQ%3D%3D"); /*
																													 * Service
																													 */

		Set set = map.keySet();
		Iterator iterator = set.iterator();
		
		
		//占쏙옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쌘뤄옙 占쌍억옙占쌔댐옙!
		while (iterator.hasNext()) {
			String key = (String) iterator.next();
			urlBuilder.append("&" + URLEncoder.encode(key, "UTF-8") + "="
					+ URLEncoder.encode(map.get(key), "UTF-8")); /* 占쏙옙占쌀쏙옙占쏙옙 占식븝옙占싹깍옙 占쏙옙占쏙옙 id. */
		} /*
			 * 占쏙옙占쌀쏙옙占쏙옙 카占쌓곤옙占쏙옙 占쏙옙占쏙옙 baroApi占쏙옙占쏙옙 resId, catId 占쌓몌옙占쏙옙 占쌕몌옙 占쏙옙占쌜뤄옙占싱쇽옙占쏙옙 占쏙옙占쏙옙占싹깍옙 占쏙옙占쏙옙 占쌍울옙占쏙옙 占쌓몌옙占싱곤옙 占쏙옙占쌜뤄옙占싱션븝옙 占쌕몌옙
			 * 占쌓몌옙占쏙옙 占쏙옙占쌜뤄옙占싱션븝옙占쏙옙 占쏙옙占쏙옙 占쌜쇽옙占쏙옙 占쌓몌옙占쏙옙 占쏙옙占쏙옙玖占� 占싫댐옙.
			 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		StringBuffer sb = new StringBuffer();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		return sb.toString();
	}

}
