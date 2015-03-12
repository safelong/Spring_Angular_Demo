package com.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.IRegionDao;
import com.service.IRegionService;

@Service
public class RegionServiceImpl implements IRegionService {
	@Autowired
	private IRegionDao regionDao;

	public Map<Integer, String> getRegions() {
		return regionDao.getRegions();
	}

	public Map<Integer, String> getCounties() {
		return regionDao.getCounties();
	}

	public Map<Integer, String> getCountiesByRegion(int regionId) {
		return regionDao.getCountiesByRegion(regionId);
	}

}
