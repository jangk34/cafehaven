package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private Logger log = Logger.getLogger(this.getClass());

	//홈
		@RequestMapping(value = "home")
		public String home() {
			return "/home";
		}
	//다시 만드는 탑 
		/*@RequestMapping(value="basic")
		public String index() {
			return "/basic";
		}*/
		
	// 인덱스
		@RequestMapping(value="index")
		public String index() {
			return "/index";
		}
}
