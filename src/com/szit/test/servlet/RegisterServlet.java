package com.szit.test.servlet;

import com.szit.test.biz.UserBiz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    private UserBiz userBiz;

    @Override
    public void init() throws ServletException {
        this.userBiz = new UserBiz();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 检查用户名是否已存在
        if (userBiz.isUsernameTaken(username)) {
            request.setAttribute("error", "用户名已被占用");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // 调用业务层保存用户数据
        boolean isRegistered = userBiz.registerUser(username, password);

        if (isRegistered) {
            response.sendRedirect("index.jsp"); // 注册成功后重定向到主页面
        } else {
            request.setAttribute("error", "注册失败，请稍后再试");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
