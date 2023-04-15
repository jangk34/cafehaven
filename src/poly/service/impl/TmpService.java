package poly.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.MenuDTO;
import poly.dto.TmpDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.MenuMapper;
import poly.persistance.mapper.TmpMapper;
import poly.persistance.mapper.UserMapper;
import poly.service.ITmpService;

@Service("TmpService")
public class TmpService implements ITmpService {
	@Resource(name="TmpMapper")
	private TmpMapper tmpMapper;

	// 장바구니 등록	
	@Override
	public int insertTmp(TmpDTO tDTO) throws Exception {
		return tmpMapper.insertTmp(tDTO);
	}
	

	

}
