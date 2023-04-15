package poly.controller;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.PrimitiveArrayBuilder;

import poly.dto.ReviewDTO;
import poly.dto.UserDTO;
import poly.service.IReviewService;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class ReviewController {
	
	@Resource(name="ReviewService")
	private IReviewService reviewService;
	
	
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@RequestMapping(value="/notice/reviewList")
	public @ResponseBody List<ReviewDTO> reviewList(HttpServletRequest req) throws Exception {
		//rDTO 객체 생성
		
		
		//조회한 데이터를 리스트 형식으로 저장
		List<ReviewDTO> rList= reviewService.getReviewList();
				
		
		return rList;
		
	}
	
	
	//리뷰 등록 ajax
	@RequestMapping(value="/notice/cafeReviewRegProc",method=RequestMethod.POST)
	public @ResponseBody List<ReviewDTO> insertReviewReg(HttpServletRequest req) throws Exception{
		String userNo=CmmUtil.nvl(req.getParameter("userNo"));
		log.info("cafeReview userNo: "+ userNo);
		String menuName = CmmUtil.nvl(req.getParameter("menuName"));
		log.info("cafeReview menuName: "+ menuName);
		String cafeStar = CmmUtil.nvl(req.getParameter("cafeStar"));
		log.info("cafeReview cafeStar:"+cafeStar);
		String cafeReview =CmmUtil.nvl(req.getParameter("cafeReview"));
		log.info("cafeReview cafeReview:"+cafeReview);
		
		//dto저장
		
		ReviewDTO rDTO= new ReviewDTO();
		
		rDTO.setRegNo(userNo);
		rDTO.setMenuName(menuName);
		rDTO.setCafeStar(cafeStar);
		rDTO.setCafeReview(cafeReview);
		//들어갔는지  확인하려면   get으로
		
		log.info("리뷰 nDTO getRegNO"+rDTO.getRegNo());
		log.info("리뷰 nDTO getMenuName"+rDTO.getMenuName());
		log.info("리뷰 nDTO getCafeName"+rDTO.getCafeStar());
		log.info("리뷰 nDTO getCafeReview"+rDTO.getCafeReview());
		
		
		//등록된 정보를 rList 에 저장
		//결과값을 지원하지 않는다 .  DTO 로 받아올수없다 int 나 boolean ? 여기를 바꿔야되는게 맞는데  
		//ajax 로 insert 하고 화면 바로 보여 주려면 DTO 형식이나 list 로 받아와야 될거같은데  
		
		//ReviewDTO rDTO1=reviewService.insertReview(rDTO);
		List<ReviewDTO> rList = reviewService.getReview(rDTO);
		
		log.info("rList 시작:"+rList);
		
		
		
		return rList;
		
	}
	
	
}
