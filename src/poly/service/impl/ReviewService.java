package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ReviewDTO;
import poly.persistance.mapper.ReviewMapper;
import poly.service.IReviewService;

@Service("ReviewService")
public class ReviewService implements IReviewService {
	@Resource(name = "ReviewMapper")
	private ReviewMapper reviewMapper;

	// 리뷰등록
	@Override
	public int insertReview(ReviewDTO rDTO) throws Exception {

		System.out.println("insertReview service menuname: " + rDTO.getMenuName());
		System.out.println("insertReview service review: " + rDTO.getCafeReview());

		return reviewMapper.insertReview(rDTO);
	}

	// 리뷰 ajax 등록후 조회 리스트
	@Override
	public List<ReviewDTO> getReview(ReviewDTO rDTO) throws Exception {
		reviewMapper.insertReview(rDTO);
		// get으로 dto를 가져와서 return select
		return reviewMapper.getReview(rDTO);
	}

	// 리뷰 리스트
	@Override
	public List<ReviewDTO> getReviewList() throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.getReviewList();
	}

	// -------------------------유라
	// 마이페이지 > 내가쓴 글 보기
	@Override
	public List<ReviewDTO> userWriteList() throws Exception {
		// TODO Auto-generated method stub
		return reviewMapper.userWriteList();
	}

}
