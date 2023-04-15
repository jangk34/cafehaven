package poly.service;

import java.util.List;

import poly.dto.ReviewDTO;

public interface IReviewService {

	// 등록
	public int insertReview(ReviewDTO rDTO) throws Exception;

	// 리뷰 리스트 ajax 조회
	public List<ReviewDTO> getReview(ReviewDTO rDTO) throws Exception;

	// 리뷰 리스트 조회
	public List<ReviewDTO> getReviewList() throws Exception;

	// -----------------------율
	// 마이페이지 > 내가쓴 글 보기
	public List<ReviewDTO> userWriteList() throws Exception;
}
