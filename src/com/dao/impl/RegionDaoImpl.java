package com.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.dao.IRegionDao;

@Repository
public class RegionDaoImpl implements IRegionDao {

	public Map<Integer, String> getRegions() {
		Map<Integer, String> regions = new HashMap<Integer, String>();
		regions.put(100, "北京市");
		regions.put(200, "湖南省");
		regions.put(300, "广州省");
		return regions;
	}

	public Map<Integer, String> getCountiesByRegion(int regionId) {
		Map<Integer, String> countiesMap = new HashMap<Integer, String>();
		if (regionId == 100) {
			countiesMap.put(101, "昌平区");
			countiesMap.put(102, "朝阳区");
			countiesMap.put(103, "崇文区");
			countiesMap.put(104, "东城区");
			countiesMap.put(105, "顺义区");
			countiesMap.put(106, "宣武区");
			countiesMap.put(107, "房山区");
		} else if (regionId == 200) {
			countiesMap.put(201, "常德市");
			countiesMap.put(202, "长沙市");
			countiesMap.put(203, "郴州市");
			countiesMap.put(204, "衡阳市");
			countiesMap.put(205, "怀化市");
			countiesMap.put(206, "娄底市");
			countiesMap.put(207, "邵阳市");
		} else {
			countiesMap.put(301, "潮州市");
			countiesMap.put(302, "东莞市");
			countiesMap.put(303, "佛山市");
			countiesMap.put(304, "广州市");
			countiesMap.put(305, "河源市");
			countiesMap.put(306, "江门市");
			countiesMap.put(307, "茂名市");
		}
		return countiesMap;
	}

	public Map<Integer, String> getCounties() {
		Map<Integer, String> countiesMap = new HashMap<Integer, String>();
		countiesMap.put(101, "昌平区");
		countiesMap.put(102, "朝阳区");
		countiesMap.put(103, "崇文区");
		countiesMap.put(104, "东城区");
		countiesMap.put(105, "顺义区");
		countiesMap.put(106, "宣武区");
		countiesMap.put(107, "房山区");
		countiesMap.put(201, "常德市");
		countiesMap.put(202, "长沙市");
		countiesMap.put(203, "郴州市");
		countiesMap.put(204, "衡阳市");
		countiesMap.put(205, "怀化市");
		countiesMap.put(206, "娄底市");
		countiesMap.put(207, "邵阳市");
		countiesMap.put(301, "潮州市");
		countiesMap.put(302, "东莞市");
		countiesMap.put(303, "佛山市");
		countiesMap.put(304, "广州市");
		countiesMap.put(305, "河源市");
		countiesMap.put(306, "江门市");
		countiesMap.put(307, "茂名市");
		return countiesMap;
	}

}
