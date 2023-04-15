package poly.util;


import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


public class OpenApiXml {
	
//XML 태그 구분 유틸

	public  static String getTagValue(String tag, Element element) {
		/*System.out.println("김한결 getTagValue"+element);*/
	/*	if(element==null||element.getElementsByTagName(tag).item(0).getChildNodes()==null) {
				String res="noData";
				return res;
			}else {}
		*/
				NodeList list = element.getElementsByTagName(tag).item(0).getChildNodes();
				Node nValue = (Node) list.item(0);
				return nValue.getNodeValue();	
			
			
			
		}
	}

		
		
	
	

