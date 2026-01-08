package com.szit.test.dao;

import java.sql.*;

public class UserDao {

    // 查询数据库，验证用户的用户名和密码是否正确
    public boolean validateUser(String username, String password) {
        // SQL 查询语句
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        Object[] params = {username, password};

        // 使用 MySqlConnection 类进行数据库查询
        ResultSet rs = MySqlConnection.getResultSet(sql, params);

        try {
            // 如果查询到数据，说明用户名和密码是匹配的
            if (rs != null && rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;  // 如果没有匹配的记录，返回 false
    }

    // 插入新用户
    public boolean insertUser(String username, String password) {
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        Object[] params = {username, password};

        // 使用 MySqlConnection 类执行更新操作（插入）
        return MySqlConnection.executeUpdate(sql, params) > 0; // 如果插入成功，返回 true
    }

    // 检查用户名是否已存在
    public boolean isUsernameTaken(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        Object[] params = {username};

        // 使用 MySqlConnection 查询用户名是否存在
        ResultSet rs = MySqlConnection.getResultSet(sql, params);

        try {
            // 如果查询到数据，说明该用户名已存在
            if (rs != null && rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;  // 如果没有查询到数据，说明用户名是可用的
    }
}
