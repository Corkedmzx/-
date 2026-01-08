package com.szit.test.dao;

import java.sql.*;

public class MySqlConnection {

	/**
	 * 创建连接
	 *
	 * @return 返回活动的Connection
	 */
	public static Connection getConnection() {
		Connection cn = null;
		try {
			// 1.加载驱动
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2.创建连接对象
			cn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/car_sql?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false&serverTimezone=Asia/Shanghai",
					"root", "123456");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return cn;
	}

	/**
	 * 关闭对象
	 *
	 * @param conn 连接对象
	 * @param pstmt PreparedStatement对象
	 * @param rs ResultSet对象
	 */
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 查询，获取结果集
	 *
	 * @param sql        SQL语句
	 * @param parameters 参数集合
	 * @return 返回查询结果集
	 */
	public static ResultSet getResultSet(String sql, Object[] parameters) {
		ResultSet rs = null;
		Connection cn = null;
		PreparedStatement pstmt = null;

		try {
			// 获取数据库连接
			cn = getConnection();

			// 创建命令对象
			pstmt = cn.prepareStatement(sql);

			// 给SQL语句传递参数
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					pstmt.setObject(i + 1, parameters[i]);
				}
			}

			// 执行查询
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rs;
	}

	/**
	 * 执行增、删、改操作
	 *
	 * @param sql        SQL语句
	 * @param parameters 参数集合
	 * @return 返回是否操作成功
	 */
	public static boolean execute(String sql, Object[] parameters) {
		boolean isSuccess = false;
		Connection cn = null;
		PreparedStatement pstmt = null;

		try {
			// 获取数据库连接
			cn = getConnection();

			// 创建命令对象
			pstmt = cn.prepareStatement(sql);

			// 给SQL语句传递参数
			if (parameters != null) {
				for (int i = 0; i < parameters.length; i++) {
					pstmt.setObject(i + 1, parameters[i]);
				}
			}

			// 执行增、删、改操作
			pstmt.executeUpdate();

			// 如果执行成功，返回 true
			isSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭连接、PreparedStatement和ResultSet
			close(cn, pstmt, null);
		}

		return isSuccess;
	}

	/**
	 * 执行更新操作（增、删、改）
	 *
	 * @param sql    SQL语句
	 * @param params 参数集合
	 * @return 返回受影响的行数
	 */
	public static int executeUpdate(String sql, Object[] params) {
		try (Connection conn = getConnection();
			 PreparedStatement ps = conn.prepareStatement(sql)) {

			// 设置查询参数
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}

			// 执行更新操作并返回受影响的行数
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}
}
