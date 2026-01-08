package com.szit.test.servlet;

import com.szit.test.biz.CarBiz;
import com.szit.test.entity.Car;
import com.szit.test.dao.CarDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CarServlet", urlPatterns = {"/CarServlet"})
public class CarServlet extends HttpServlet {
    private CarBiz carBiz;

    @Override
    public void init() throws ServletException {
        carBiz = new CarBiz();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setCharacterEncoding("UTF-8");
        if (action == null || action.isEmpty()) {
            action = "list";
        }
        switch (action) {
            case "list":
                listCars(request, response);
                break;
            case "delete":
                deleteCar(request, response);
                break;
            case "view":
                viewCar(request, response);
                break;
            case "search":
                searchCars(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void listCars(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int size = 4;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            // 参数错误处理
        }
        List<Car> cars = carBiz.findCarsByPage(page, size);
        int totalRecords = carBiz.getTotalRecords(); // 假设这个方法返回总记录数
        int totalPages = (int) Math.ceil((double) totalRecords / size);
        request.setAttribute("cars", cars);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("/listCar.jsp").forward(request, response);
    }

    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        carBiz.deleteCar(id);
        response.sendRedirect("CarServlet?action=list");
    }

    private void viewCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Car car = carBiz.getCarById(id);
        request.setAttribute("car", car);
        request.getRequestDispatcher("/viewCar.jsp").forward(request, response);
    }

    private void searchCars(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brand = request.getParameter("brand");
        int minSeats = Integer.parseInt(request.getParameter("minSeats"));
        int maxSeats = Integer.parseInt(request.getParameter("maxSeats"));
        int page = 1;
        int size = 4;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            // 参数错误处理
        }
        List<Car> cars = carBiz.searchCarsByConditions(brand, minSeats, maxSeats, page, size);
        int totalRecords = carBiz.getTotalRecordsByConditions(brand, minSeats, maxSeats); // 假设这个方法返回符合条件的总记录数
        int totalPages = (int) Math.ceil((double) totalRecords / size);
        request.setAttribute("cars", cars);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("/listCar.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Car car = new Car();
        car.setBrand(request.getParameter("brand"));
        car.setColor(request.getParameter("color"));
        car.setSeats(Integer.parseInt(request.getParameter("seats")));
        car.setConsum(Double.parseDouble(request.getParameter("consum")));
        car.setProductdate(java.sql.Date.valueOf(request.getParameter("productdate")));
        car.setRentmoney(Double.parseDouble(request.getParameter("rentmoney")));
        car.setCreatedate(new java.sql.Date(System.currentTimeMillis()));
        car.setUsername((String) request.getSession().getAttribute("username")); // 获取登录用户的用户名

        carBiz.addCar(car);
        response.sendRedirect("CarServlet?action=list");
    }
}