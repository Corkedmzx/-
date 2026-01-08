package com.szit.test.biz;

import com.szit.test.entity.Car;
import com.szit.test.dao.CarDao;
import com.szit.test.dao.impl.CarDaoImpl;

import java.util.List;

public class CarBiz {
    private CarDao carDao;

    public CarBiz() {
        this.carDao = new CarDaoImpl();
    }

    public List<Car> getAllCars() {
        return carDao.getAllCars();
    }

    public Car getCarById(int id) {
        return carDao.getCarById(id);
    }

    public void addCar(Car car) {
        carDao.addCar(car);
    }

    public void updateCar(Car car) {
        carDao.updateCar(car);
    }

    public void deleteCar(int id) {
        carDao.deleteCar(id);
    }

    public List<Car> findCarsByPage(int page, int size) {
        return carDao.findCarsByPage(page, size);
    }

    public List<Car> searchCarsByConditions(String brand, int minSeats, int maxSeats, int page, int size) {
        return carDao.searchCarsByConditions(brand, minSeats, maxSeats, page, size);
    }

    // 获取总记录数
    public int getTotalRecords() {
        return carDao.getTotalRecords();
    }

    // 获取符合条件的总记录数
    public int getTotalRecordsByConditions(String brand, int minSeats, int maxSeats) {
        return carDao.getTotalRecordsByConditions(brand, minSeats, maxSeats);
    }
}