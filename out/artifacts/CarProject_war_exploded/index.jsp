<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>首页</title>
  <style>
    /* 设置页面背景 */
    body {
      background-image: url('images/m1.jpeg'); /* 替换为你的背景图片URL */
      background-size: cover; /* 背景图片覆盖整个页面 */
      background-position: center; /* 背景图片居中 */
      background-repeat: no-repeat; /* 防止背景图片重复 */
      height: 100vh; /* 页面高度为视口高度 */
      display: flex;
      justify-content: center; /* 水平居中 */
      align-items: center; /* 垂直居中 */
      margin: 0;
      font-family: Arial, sans-serif; /* 设置字体 */
      color: white; /* 文字颜色 */
      text-align: center; /* 文字居中 */
    }

    /* 登录表单样式 */
    .login-container {
      background-color: rgba(0, 0, 0, 0.6); /* 半透明黑色背景 */
      padding: 30px;
      border-radius: 10px; /* 圆角 */
      width: 300px; /* 固定宽度 */
    }

    /* 输入框和按钮样式 */
    .login-container input[type="text"],
    .login-container input[type="password"],
    .login-container input[type="submit"] {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border-radius: 5px;
      border: 1px solid #ccc;
    }

    .login-container input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      cursor: pointer;
    }

    .login-container input[type="submit"]:hover {
      background-color: #45a049;
    }

    /* 注册链接样式 */
    .register-link {
      display: block;
      margin-top: 15px;
      font-size: 14px;
      color: #4CAF50;
      text-decoration: none;
    }

    .register-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="login-container">
  <h2>欢迎来到汽车管理系统</h2>
  <h3>请登录</h3>
  <% if (request.getAttribute("error") != null) { %>
  <p style="color: red"><%= request.getAttribute("error") %></p>
  <% } %>
  <form action="LoginServlet" method="post">
    用户名：<input type="text" name="username"><br>
    密码：<input type="password" name="password"><br>
    <input type="submit" value="登录">
  </form>

  <!-- 注册链接 -->
  <a href="register.jsp" class="register-link">没有账户? 点击注册</a>
</div>
</body>
</html>
