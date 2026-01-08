package com.szit.test.servlet;
import com.szit.test.biz.UserBiz;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    // 创建业务逻辑层对象
    private UserBiz userBiz;

    @Override
    public void init() throws ServletException {
        // 在 init 方法中初始化业务逻辑层
        this.userBiz = new UserBiz();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 调用业务逻辑层的验证方法
        boolean isValidUser = userBiz.checkUserCredentials(username, password);

        if (isValidUser) {
            request.getSession().setAttribute("username", username);
            response.sendRedirect("CarServlet?action=list");
        } else {
            request.setAttribute("error", "用户名或密码错误");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
