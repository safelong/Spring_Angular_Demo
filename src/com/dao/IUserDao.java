package com.dao;

import java.util.List;

import com.bean.UserBean;

public interface IUserDao {
    public void addUser(UserBean user);
    
    public List<UserBean> getAllUsers();
    
    public void deleteUser(long id);
    
    public void updateUser(UserBean user);
    
    public UserBean getUserById(long id);
}
