package poly.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService {

	@Resource(name = "UserMapper")
	private UserMapper userMapper;

	// 회원가입
	@Override
	public int insertUser(UserDTO uDTO) throws Exception {

		return userMapper.insertUser(uDTO);
	}

	// 회원 정보목록
	@Override
	public List<UserDTO> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserList();
	}

	// 회원정보 상세
	@Override
	public UserDTO getUserDetail(String userNo) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserDetail(userNo);
	}

	// 이메일 중복체크
	@Override
	public int getUserEmailCheck(String email) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserEmailCheck(email);
	}

	@Override
	public int deleteUser(String userNo) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.deleteUser(userNo);
	}

	// 로그인
	@Override
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserLogin(uDTO);
	}

	// 아이디 찾기
	@Override
	public List<UserDTO> getEmailFind(UserDTO uDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getEmailFind(uDTO);
	}

	/*
	 * //비밀번호찾기
	 * 
	 * @Override public List<UserDTO> getPwFind(UserDTO uDTO) throws Exception { //
	 * TODO Auto-generated method stub return userMapper.getPwFind(uDTO); }
	 */
	// 임시비밀번호
	@Override
	public HashMap<String, Object> updateTmpPass(HashMap<String, Object> hMap) throws Exception {
		// TODO Auto-generated method stub
		UserDTO uDTO = (UserDTO) hMap.get("uDTO");
		// 난수로 임시비밀번호를 만들어 패스워드에 저장
		long temp_Pw = (long) (Math.random() * 9000000000l) + 1000000000l;
		String temp_password = Long.toHexString(temp_Pw);
		uDTO.setPassword(temp_password);

		// 결과값반환 리턴값이 hMap 이라 result 를 hMap에 저장하고 값을 컨트롤러에 보내야됨
		int result = userMapper.updateTmpPass(uDTO);

		// 반환한값을 hMap 에 저장

		hMap.put("tmpPass", temp_password);
		hMap.put("result", result);

		return hMap;
	}

	// 회원정보변경
	@Override
	public int updateUser(UserDTO uDTO) throws Exception {
		System.out.println("serviceUpdateUser : " + uDTO.getEmail());
		System.out.println("serviceUpdateUser : " + uDTO.getName());
		System.out.println("serviceUpdateUser : " + uDTO.getBirth());
		System.out.println("serviceUpdateUser : " + uDTO.getPostAddr());
		System.out.println("serviceUpdateUser : " + uDTO.getAddr1());
		System.out.println("serviceUpdateUser : " + uDTO.getAddr2());
		System.out.println("serviceUpdateUser : " + uDTO.getUserTel());
		return userMapper.updateUser(uDTO);
	}
	// 새로운 비밀번호 업데이트

}
