package com.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Repository;

import com.bean.UserBean;
import com.dao.IUserDao;

@Repository
public class UserDaoImpl implements IUserDao {
	public static void main(String[] args) {
		UserDaoImpl t = new UserDaoImpl();
		for (UserBean user : userList) {
			System.out.println(user.getRegion()+"----="+user.getCounty());
		}
	}

	static List<UserBean> userList = new ArrayList<UserBean>();
	static {
		for (int i = 1; i < 10; i++) {
			int region=(1+new Random().nextInt(3))*100;
			userList.add(new UserBean(i, region+"", region+1+new Random().nextInt(7)+"", "测试_" + i,
					new Random().nextInt(4000), new Date()));
		}
	}

	public void addUser(UserBean user) {
		user.setId(userList.size() + 1);
		userList.add(user);
	}

	public List<UserBean> getAllUsers() {
		return userList;
	}

	public void deleteUser(long id) {
		Iterator<UserBean> it = userList.iterator();
		while (it.hasNext()) {
			if (it.next().getId() == id) {
				it.remove();
			}
		}
	}

	public void updateUser(UserBean user) {
		Iterator<UserBean> it = userList.iterator();
		while (it.hasNext()) {
			if (it.next().getId() == user.getId()) {
				it.remove();
			}
		}
		userList.add(user);
	}

	public UserBean getUserById(long id) {
		for (int i = 0, len = userList.size(); i < len; i++) {
			if (userList.get(i).getId() == id) {
				return userList.get(i);
			}
		}
		return null;
	}
}
