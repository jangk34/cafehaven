package poly.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ChartDTO;
import poly.persistance.mapper.ChartMapper;
import poly.service.IChartService;

@Service("ChartService")
public class ChartService implements IChartService {
	@Resource(name="ChartMapper")
	private ChartMapper chartMapper;
	
	// 성별 차트
	/*@Override
	public List<ChartDTO> getWeekGender() throws Exception {
		List<ChartDTO> chList = chartMapper.getWeekGender();
		HashMap<String, String> rMap = new HashMap<String, String>();
		for(ChartDTO cDTO : chList) {
			if(rMap.containsKey(cDTO.getRegDate())) {
				String e[] = rMap.get(cDTO.getRegDate()).split(",");
				int e1 = Integer.parseInt(e[0])+Integer.parseInt(cDTO.getMale_count());
				int e2 = Integer.parseInt(e[1])+Integer.parseInt(cDTO.getFemale_count());
				
				rMap.put(cDTO.getRegDate(), String.valueOf(e1)+","+String.valueOf(e2));
			}else {
				rMap.put(cDTO.getRegDate(), cDTO.getMale_count()+","+cDTO.getFemale_count());
			}
		}
		chList.clear();
		for(String key : rMap.keySet()) {
			ChartDTO ctDTO = new ChartDTO();
			ctDTO.setRegDate(key);
			String male = rMap.get(key).toString().split(",")[0];
			String female = rMap.get(key).toString().split(",")[1];
			ctDTO.setMale_count(male);
			ctDTO.setFemale_count(female);
			chList.add(ctDTO);
		}
		return chList;
	}*/
	
}
