package com.szit.test.dao;

import com.szit.test.entity.Car;
import java.util.List;

public interface CarDao {
    List<Car> getAllCars();
    Car getCarById(int id);
    void addCar(Car car);
    void updateCar(Car car);
    void deleteCar(int id);
    List<Car> findCarsByPage(int page, int size);
    List<Car> searchCarsByConditions(String brand, int minSeats, int maxSeats, int page, int size);
    int getTotalRecords(); // 获取总记录数
    int getTotalRecordsByConditions(String brand, int minSeats, int maxSeats); // 获取符合条件的总记录数
}