package com.szit.test.dao.impl;

import com.szit.test.dao.CarDao;
import com.szit.test.entity.Car;
import com.szit.test.dao.MySqlConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDaoImpl implements CarDao {
    @Override
    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Cars";
        try (Connection conn = MySqlConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrand(rs.getString("brand"));
                car.setColor(rs.getString("color"));
                car.setSeats(rs.getInt("seats"));
                car.setConsum(rs.getDouble("consum"));
                car.setProductdate(rs.getDate("productdate"));
                car.setRentmoney(rs.getDouble("rentmoney"));
                car.setCreatedate(rs.getDate("createdate"));
                car.setUsername(rs.getString("username"));
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    @Override
    public Car getCarById(int id) {
        Car car = null;
        String sql = "SELECT * FROM Cars WHERE id = ?";
        try (Connection conn = MySqlConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    car = new Car();
                    car.setId(rs.getInt("id"));
                    car.setBrand(rs.getString("brand"));
                    car.setColor(rs.getString("color"));
                    car.setSeats(rs.getInt("seats"));
                    car.setConsum(rs.getDouble("consum"));
                    car.setProductdate(rs.getDate("productdate"));
                    car.setRentmoney(rs.getDouble("rentmoney"));
                    car.setCreatedate(rs.getDate("createdate"));
                    car.setUsername(rs.getString("username"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }

    @Override
    public void addCar(Car car) {
        String sql = "INSERT INTO Cars (brand, color, seats, consum, productdate, rentmoney, createdate, username) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = MySqlConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, car.getBrand());
            pstmt.setString(2, car.getColor());
            pstmt.setInt(3, car.getSeats());
            pstmt.setDouble(4, car.getConsum());
            pstmt.setDate(5, new java.sql.Date(car.getProductdate().getTime()));
            pstmt.setDouble(6, car.getRentmoney());
            pstmt.setDate(7, new java.sql.Date(car.getCreatedate().getTime()));
            pstmt.setString(8, car.getUsername());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCar(Car car) {
        String sql = "UPDATE Cars SET brand = ?, color = ?, seats = ?, consum = ?, productdate = ?, rentmoney = ?, createdate = ?, username = ? WHERE id = ?";
        try (Connection conn = MySqlConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, car.getBrand());
            pstmt.setString(2, car.getColor());
            pstmt.setInt(3, car.getSeats());
            pstmt.setDouble(4, car.getConsum());
            pstmt.setDate(5, new java.sql.Date(car.getProductdate().getTime()));
            pstmt.setDouble(6, car.getRentmoney());
            pstmt.setDate(7, new java.sql.Date(car.getCreatedate().getTime()));
            pstmt.setString(8, car.getUsername());
            pstmt.setInt(9, car.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCar(int id) {
        String sql = "DELETE FROM Cars WHERE id = ?";
        try (Connection conn = MySqlConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Car> findCarsByPage(int page, int size) {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Cars LIMIT ? OFFSET ?";
        try (Connection conn = MySqlConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, size);
            pstmt.setInt(2, (page - 1) * size);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Car car = new Car();
                    car.setId(rs.getInt("id"));
                    car.setBrand(rs.getString("brand"));
                    car.setColor(rs.getString("color"));
                    car.setSeats(rs.getInt("seats"));
                    car.setConsum(rs.getDouble("consum"));
                    car.setProductdate(rs.getDate("productdate"));
                    car.setRentmoney(rs.getDouble("rentmoney"));
                    car.setCreatedate(rs.getDate("createdate"));
                    car.setUsername(rs.getString("username"));
                    cars.add(car);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    @Override
    public List<Car> searchCarsByConditions(String brand, int minSeats, int maxSeats, int page, int size) {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Cars WHERE brand = ? AND seats BETWEEN ? AND ? LIMIT ? OFFSET ?";
        try (Connection conn = MySqlConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, brand);
            pstmt.setInt(2, minSeats);
            pstmt.setInt(3, maxSeats);
            pstmt.setInt(4, size);
            pstmt.setInt(5, (page - 1) * size);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Car car = new Car();
                    car.setId(rs.getInt("id"));
                    car.setBrand(rs.getString("brand"));
                    car.setColor(rs.getString("color"));
                    car.setSeats(rs.getInt("seats"));
                    car.setConsum(rs.getDouble("consum"));
                    car.setProductdate(rs.getDate("productdate"));
                    car.setRentmoney(rs.getDouble("rentmoney"));
                    car.setCreatedate(rs.getDate("createdate"));
                    car.setUsername(rs.getString("username"));
                    cars.add(car);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }

    @Override
    public int getTotalRecords() {
        String sql = "SELECT COUNT(*) FROM Cars";
        try (Connection conn = MySqlConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int getTotalRecordsByConditions(String brand, int minSeats, int maxSeats) {
        String sql = "SELECT COUNT(*) FROM Cars WHERE brand = ? AND seats BETWEEN ? AND ?";
        try (Connection conn = MySqlConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, brand);
            pstmt.setInt(2, minSeats);
            pstmt.setInt(3, maxSeats);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}