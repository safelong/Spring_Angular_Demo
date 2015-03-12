package com.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.UserBean;
import com.dao.IRegionDao;
import com.dao.IUserDao;
import com.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	private IUserDao userDao;

	@Autowired
	private IRegionDao regionDao;

	public UserBean getUserById(long id) {
		return userDao.getUserById(id);
	}

	public boolean addUser(UserBean user) {
		boolean flag = false;
		try {
			userDao.addUser(user);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

	public List<UserBean> getAllUsers() {
		List<UserBean> userList = userDao.getAllUsers();
		return translateUserInfo(userList);
	}

	public boolean deleteUser(long id) {
		boolean flag = false;
		try {
			userDao.deleteUser(id);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

	public boolean updateUser(UserBean user) {
		boolean flag = false;
		try {
			userDao.updateUser(user);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}

	public List<UserBean> translateUserInfo(List<UserBean> userList) {
		Map<Integer, String> regions = regionDao.getRegions();
		Map<Integer, String> counties = regionDao.getCounties();
		List<UserBean> resultList = new ArrayList<UserBean>();
		for (UserBean userBean : userList) {
			resultList.add(userBean.clone());
		}
		for (UserBean userBean : resultList) {
			userBean.setRegion(regions.get(Integer.valueOf(userBean.getRegion())));
			userBean.setCounty(counties.get(Integer.valueOf(userBean
					.getCounty())));
		}
		return resultList;
	}
}
