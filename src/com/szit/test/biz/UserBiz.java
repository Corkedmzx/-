package com.szit.test.biz;

import com.szit.test.dao.UserDao;

public class UserBiz {

    private UserDao userDao;

    public UserBiz() {
        this.userDao = new UserDao();
    }

    // 用户验证
    public boolean checkUserCredentials(String username, String password) {
        return userDao.validateUser(username, password);
    }

    // 用户注册
    public boolean registerUser(String username, String password) {
        return userDao.insertUser(username, password);
    }

    // 检查用户名是否已被占用
    public boolean isUsernameTaken(String username) {
        return userDao.isUsernameTaken(username);
    }
}
