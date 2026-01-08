<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <style>
        /* 设置背景图，并使内容居中 */
        body {
            margin: 0;
            height: 100vh;
            background-image: url('images/m2.png'); /* 设置背景图片，替换为你实际的图片路径 */
            background-size: cover; /* 背景图片覆盖整个屏幕 */
            background-position: center; /* 背景图片居中 */
            display: flex;
            justify-content: center; /* 水平居中 */
            align-items: center; /* 垂直居中 */
            text-align: center; /* 文字居中 */
            font-family: Arial, sans-serif; /* 设置字体 */
        }

        /* 登录框样式 */
        .login-container {
            background: rgba(0, 0, 0, 0.6); /* 半透明背景，提升对比度 */
            padding: 30px;
            border-radius: 8px;
            width: 300px; /* 设置登录框宽度 */
            color: white; /* 字体颜色 */
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
        }

        .login-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        .login-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            font-size: 16px;
        }
    </style>
</head>
<body>

<!-- 登录内容 -->
<div class="login-container">
    <h2>登录</h2>
    <% if (request.getAttribute("error") != null) { %>
    <p class="error-message"><%= request.getAttribute("error") %></p>
    <% } %>
    <form action="LoginServlet" method="post">
        用户名：<input type="text" name="username"><br>
        密码：<input type="password" name="password"><br>
        <input type="submit" value="登录">
    </form>
</div>

</body>
</html>
