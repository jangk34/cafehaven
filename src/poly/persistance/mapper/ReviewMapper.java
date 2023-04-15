package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ReviewDTO;

@Mapper("ReviewMapper")
public interface ReviewMapper {
	
	//리뷰등록
	public int insertReview(ReviewDTO rDTO) throws Exception;
	
	//리뷰상세보기ajax 리스트
	public List<ReviewDTO> getReview(ReviewDTO rDTO) throws Exception;	

	//리뷰 리스트 조회
	public List<ReviewDTO> getReviewList() throws Exception;	

	public List<ReviewDTO> userWriteList() throws Exception;

	
}
