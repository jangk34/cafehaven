package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import poly.dto.MenuDTO;
import poly.dto.TmpDTO;
import poly.dto.TmpHistoryDTO;
import poly.dto.UserDTO;
import poly.service.IMenuService;
import poly.service.ITmpService;
import poly.service.IUserService;
import poly.service.impl.TmpService;
import poly.util.CmmUtil;

@Controller
public class TmpController {
	private Logger log= Logger.getLogger(this.getClass());
	@Resource(name="TmpService")
	private ITmpService tmpService;
	@Resource(name="MenuService")
	private IMenuService menuService;
	@Resource(name="UserService")
	private IUserService userService;
	// 장바구니 화면
	@RequestMapping(value="/tmpBasket/tmpBasketList", method=RequestMethod.GET)
	public String tmpBasketList(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info("tmpBasketList Start : " + this.getClass());
		log.info("tmpBasketList End : " + this.getClass());
		
		return "/tmpBasket/tmpBasketList";
	}
	
	
	// 장바구니에 세션으로 담기 
	@RequestMapping(value="/tmpBasket/tmpBasketRegProc", method=RequestMethod.POST)
	public void tmpBasketRegProc(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + "addTmpBasket start!!!");
		String menuNo = CmmUtil.nvl(req.getParameter("menuNo"));
		log.info(this.getClass() + " menuNo : " + menuNo);
		String menuPrice = CmmUtil.nvl(req.getParameter("menuPrice"));
		log.info(this.getClass() + " menuPrice : " + menuPrice);
		String menuQty = CmmUtil.nvl(req.getParameter("menuQty"));
		log.info(this.getClass() + " menuQty : " + menuQty);
		String menuName = CmmUtil.nvl(req.getParameter("menuName"));
		log.info(this.getClass() + " menuName : " + menuName);
		Object tmpSession = session.getAttribute("ss_tmpBasket");
		Map<String, TmpDTO> tMap;
		if(tmpSession == null){
			tMap = new HashMap();
			tMap.put(menuNo, new TmpDTO(menuNo, menuQty, menuPrice, menuName));
			session.setAttribute("ss_tmpBasket", tMap);
		}else{
			tMap = (Map<String, TmpDTO>)tmpSession;
			if(tMap.containsKey(menuNo)){
				TmpDTO tDTO = tMap.get(menuNo);
				tDTO.setMenuQty(Integer.parseInt(tDTO.getMenuQty()) + Integer.parseInt(menuQty) + "");
				tMap.put(menuNo, tDTO);
				session.setAttribute("ss_tmpBasket", tMap);
			}else{
				tMap.put(menuNo, new TmpDTO(menuNo, menuQty, menuPrice, menuName));
				session.setAttribute("ss_tmpBasket", tMap);
			}
		}
		log.info(this.getClass() + "addTmpBasket end!!!");
	}
	
	// 장바구니 수량 변경
	@RequestMapping(value="/tmpBasket/userTmpItemPlusMinus", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> userTmpItemPlusMinus(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".userTmpItemPlusMinus start!!!");
		String menuNo = CmmUtil.nvl(req.getParameter("menuNo"));
		log.info(this.getClass() + " menuNo : " + menuNo);
		String menuQty = CmmUtil.nvl(req.getParameter("menuQty"));
		log.info(this.getClass() + " menuQty : " + menuQty);
		Map<String, TmpDTO> tMap = (HashMap<String, TmpDTO>)session.getAttribute("ss_tmpBasket");
		Map<String, Object> returnMap = new HashMap();
		if(tMap == null){
			tMap = new HashMap();
		}
		if(tMap.containsKey(menuNo)){
			TmpDTO tDTO = tMap.get(menuNo);
			tDTO.setMenuQty(menuQty);
			tMap.put(menuNo, tDTO);
		}
		Iterator<String> keys = tMap.keySet().iterator();
		while(keys.hasNext()){
			String key = keys.next();
			returnMap.put(tMap.get(key).getMenuNo(), tMap.get(key));
		}
		Iterator<String> keyss = tMap.keySet().iterator();
		while(keyss.hasNext()){
			String key = keyss.next();
			log.info(this.getClass() + " session--------------------------------------");
			log.info(this.getClass() + "   menuNo : " + tMap.get(key).getMenuNo());
			log.info(this.getClass() + "   menuQty : " + tMap.get(key).getMenuQty());
			log.info(this.getClass() + "   menuPrice : " + tMap.get(key).getMenuPrice());
			log.info(this.getClass() + " session--------------------------------------");
		}
		session.setAttribute("ss_tmpBasket", tMap);
		menuNo = null;
		menuQty = null;
		tMap = null;
		log.info(this.getClass() + ".userTmpItemPlusMinus end!!!");
		return returnMap;
	}
	// 한개 삭제
	@RequestMapping(value="/tmpBasket/userTmpItemDeleteOne", method=RequestMethod.POST)
	public @ResponseBody Map<String, TmpDTO> userTmpItemDeleteOne(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + " userTmpItemDeleteOne start!!!");
		String menuNo = CmmUtil.nvl(req.getParameter("menuNo"));
		log.info(this.getClass() + " prdtNo : " + menuNo);
		Map<String, TmpDTO> tMap = (Map<String, TmpDTO>)session.getAttribute("ss_tmpBasket");
		if(tMap == null){
			tMap = new HashMap();
		}
		if(tMap.containsKey(menuNo)){
			tMap.remove(menuNo);
		}
		Iterator<String> keyss = tMap.keySet().iterator();
		while(keyss.hasNext()){
			String key = keyss.next();
			log.info(this.getClass() + " session--------------------------------------");
			log.info(this.getClass() + "   menuNo : " + tMap.get(key).getMenuNo());
			log.info(this.getClass() + "   menuQty : " + tMap.get(key).getMenuQty());
			log.info(this.getClass() + "   menuprice : " + tMap.get(key).getMenuPrice());
			log.info(this.getClass() + " session--------------------------------------");
		}
		session.setAttribute("ss_tmpBasket", tMap);
		log.info(this.getClass() + " userTmpItemDeleteOne end!!!");
		return tMap;
	}
	// 선택 삭제
	@RequestMapping(value="/tmpBasket/userTmpItemSelectedDelete", method=RequestMethod.POST)
	public @ResponseBody Map<String, TmpDTO> userTmpItemSelectedDelete(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + " userTmpItemSelectedDelete start!!!!");
		String[] menuNoArr	= req.getParameterValues("menuNo");
		Map<String, TmpDTO> tMap = (Map<String, TmpDTO>)session.getAttribute("ss_tmpBasket");
		if(tMap == null){
			tMap = new HashMap();
		}
		for(String menuNo : menuNoArr){
			if(tMap.containsKey(menuNo)){
				tMap.remove(menuNo);
			}
		}
		Iterator<String> keyss = tMap.keySet().iterator();
		while(keyss.hasNext()){
			String key = keyss.next();
			log.info(this.getClass() + " session--------------------------------------");
			log.info(this.getClass() + "   menuNo : " + tMap.get(key).getMenuNo());
			log.info(this.getClass() + "   menuQty : " + tMap.get(key).getMenuQty());
			log.info(this.getClass() + "   menuPrice : " + tMap.get(key).getMenuPrice());
			log.info(this.getClass() + " session--------------------------------------");
		}
		session.setAttribute("ss_tmpBasket", tMap);
		log.info(this.getClass() + " userTmpItemSelectedDelete end!!!"); 
		return tMap;
	}
	// 장바구니에서 주문
	@RequestMapping(value="order/userDoOrder", method=RequestMethod.GET)
	public String userDoOrder(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + "userDoOrder Start!");
		String userNo = CmmUtil.nvl((String)session.getAttribute("userNo"));
		/*
		스탬프 정보 가져오기
		*/
		Map<String,TmpDTO> tMap = (Map<String, TmpDTO>)session.getAttribute("ss_tmpBasket");
		if(tMap==null) {
			tMap = new HashMap();
		}
		String returnURL = "order/orderDetail";
		if(tMap.size()<1) {
			returnURL = "user/userAlert";
			model.addAttribute("msg", "주문하신 제품이 없습니다.");
			model.addAttribute("url", "/menu/menuList.do");
		}
		/*스탬트 모델*/
		log.info(this.getClass() + "userDoOrder End!");
		return returnURL;
	}
	
}
