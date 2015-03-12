package com.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.IRegionService;

@Controller
@RequestMapping("/region")
public class RegionController {
	@Autowired
	private IRegionService regionService;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public @ResponseBody
	Map<Integer, String> getRegions() {
		return regionService.getRegions();
	}

	@RequestMapping(value = "/region", method = RequestMethod.GET)
	public @ResponseBody
	Map<Integer, String> getCounties(
			@RequestParam(required = true) int regionId) {
		return regionService.getCountiesByRegion(regionId);
	}
}
