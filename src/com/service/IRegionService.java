package com.service;

import java.util.Map;

public interface IRegionService {
	public Map<Integer, String> getRegions();

	public Map<Integer, String> getCountiesByRegion(int regionId);

	public Map<Integer, String> getCounties();
}
