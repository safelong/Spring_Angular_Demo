package com.service;

import java.util.List;

import com.bean.UserBean;

public interface IUserService {
	public UserBean getUserById(long id);

	public boolean addUser(UserBean user);

	public List<UserBean> getAllUsers();

	public boolean deleteUser(long id);

	public boolean updateUser(UserBean user);

}
