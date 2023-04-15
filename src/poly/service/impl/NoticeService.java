package poly.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.persistance.mapper.NoticeMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService {

	@Resource(name = "NoticeMapper")
	private NoticeMapper noticeMapper;

	// 게시판 등록
	@Override
	public int insertNotice(NoticeDTO nDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.insertNotice(nDTO);
	}

	// 게시판목록조회
	@Override
	public List<NoticeDTO> getNoticeList() throws Exception {

		return noticeMapper.getNoticeList();

	}
	// 게시판 상세

	@Override
	public NoticeDTO getNoticeDetail(NoticeDTO nDTO) throws Exception {

		/*
		 * noticeMapper.updateNoticeCount(map); System.out.println();map.get("ntNo");
		 */
		return noticeMapper.getNoticeDetail(nDTO);
	}

	// 게시판 삭제
	@Override
	public int deleteNotice(String ntNo) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.deleteNotice(ntNo);
	}

	// 게시판 수정
	@Override
	public int updateNotice(NoticeDTO nDTO) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("updateService:" + nDTO.getNtNo());
		System.out.println("updateService:" + nDTO.getNtTitle());
		System.out.println("updateService:" + nDTO.getNtCont());
		System.out.println("updateService:" + nDTO.getNtWriter());
		System.out.println("updateService:" + nDTO.getRegDate());
		System.out.println("updateService:" + nDTO.getRegNo());

		return noticeMapper.updateNotice(nDTO);
	}

	// 조회수 카운트
	@Override
	public int updateNoticeCount(String ntNo) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.updateNoticeCount(ntNo);
	}

	// 답변글 상세보기
	@Override
	public NoticeDTO getAnswerNoticeDetail(String qaGrpno) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.getAnswerNoticeDetail(qaGrpno);
	}

	// 답글중복 체크
	@Override
	public int getAnswerCheck(String ntNo) throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.getAnswerCheck(ntNo);
	}

	// 마이페이지 > 내가 쓴 글 보기 ---------------------유라
	@Override
	public List<NoticeDTO> userWriteList() throws Exception {
		// TODO Auto-generated method stub
		return noticeMapper.userWriteList();
	}
	/*
	 * @Override public int qnaExpYn(String ntNo) throws Exception { // TODO
	 * Auto-generated method stub return noticeMapper.qnaExpYn(ntNo); }
	 */

}
