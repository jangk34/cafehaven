package poly.persistance.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import config.Mapper;
import poly.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {
	// 게시판 등록
	public int insertNotice(NoticeDTO nDTO) throws Exception;

	// 게시판 리스트
	public List<NoticeDTO> getNoticeList() throws Exception;

	// 게시판 상세
	public NoticeDTO getNoticeDetail(NoticeDTO nDTO1) throws Exception;

	// 게시판 삭제
	public int deleteNotice(String ntNo) throws Exception;

	// 게시판 수정
	public int updateNotice(NoticeDTO nDTO) throws Exception;

	// 게시판 카운트
	public int updateNoticeCount(String ntNo) throws Exception;

	// 답변 게시판 조회
	public NoticeDTO getAnswerNoticeDetail(String qaGrpno) throws Exception;

	// 답글 중복체크
	public int getAnswerCheck(String ntNo) throws Exception;

	// 마이페이지 > 내가 쓴 글 보기 ------------------------유라
	public List<NoticeDTO> userWriteList() throws Exception;

	/*
	 * //질문에대한 답변 달았는지 안달았는지 여부 public int qnaExpYn(String ntNo) throws Exception;
	 */

}
