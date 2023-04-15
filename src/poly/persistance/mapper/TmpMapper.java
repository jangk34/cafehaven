package poly.persistance.mapper;

import config.Mapper;
import poly.dto.TmpDTO;

@Mapper("TmpMapper")
public interface TmpMapper {
	// 장바구니 등록
	public int insertTmp(TmpDTO tDTO) throws Exception;
}
