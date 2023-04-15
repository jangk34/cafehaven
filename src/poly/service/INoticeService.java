package poly.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import poly.dto.NoticeDTO;

public interface INoticeService {
	// 게시판 등록
	public int insertNotice(NoticeDTO nDTO) throws Exception;

	// 게시판 목록
	public List<NoticeDTO> getNoticeList() throws Exception;

	// 게시판 상세
	public NoticeDTO getNoticeDetail(NoticeDTO nDTO) throws Exception;

	// 게시판 삭제
	public int deleteNotice(String ntNo) throws Exception;

	// 게시판 수정
	public int updateNotice(NoticeDTO nDTO) throws Exception;

	// 게시판 조회수
	public int updateNoticeCount(String ntNo) throws Exception;

	// 답변 게시판 조회
	public NoticeDTO getAnswerNoticeDetail(String qaGrpno) throws Exception;

	// 답글 중복확인
	public int getAnswerCheck(String ntNo) throws Exception;

	// 마이페이지 > 내가 쓴 글 보기 -----------------------유라
	public List<NoticeDTO> userWriteList() throws Exception;

	/*
	 * //질문 답변달았는지 안달았는지 업데이트 public int qnaExpYn(String ntNo) throws Exception;
	 */
}
