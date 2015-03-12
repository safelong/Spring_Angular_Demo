package com.dao;

import java.util.Map;


public interface IRegionDao {
     public Map<Integer, String> getRegions();
     public Map<Integer, String> getCountiesByRegion(int regionId);
     public Map<Integer, String> getCounties();
}
