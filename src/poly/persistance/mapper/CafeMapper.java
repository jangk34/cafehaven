package poly.persistance.mapper;

import config.Mapper;
import poly.dto.CafeAttachDTO;
import poly.dto.CafeInfoDTO;

@Mapper("CafeMapper")
public interface CafeMapper {
	// 메뉴등록 전체 테이블 2개 글 + 첨부 테이블

	//카페관리 업데이트 글 수정
	public int updateCafeDetail(CafeInfoDTO cDTO) throws Exception; // 수정,삭제,삽입은 0,1값
	//카페관리 업데이트 글 삭제 후 삽입
	public int deleteCafeImg(CafeAttachDTO caDTO) throws Exception;
	//카페관리 업데이트 이미지 삽입
	public int insertCafeImg(CafeAttachDTO caDTO1) throws Exception;
	//카페관리 넘버
	public CafeInfoDTO getCafeInfoDetail(CafeInfoDTO cDTO) throws Exception;	// result타입과 형은 일치, 수정할시만
	//카페관리  이미지 넘버
	public CafeAttachDTO getCafeInfoAttach(CafeAttachDTO caDTO2) throws Exception;

	
}
