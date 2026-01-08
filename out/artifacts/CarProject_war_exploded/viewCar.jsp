<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查看汽车</title>
    <style>
        /* 设置背景图 */
        body {
            background-image: url('images/background.jpg'); /* 请替换为你的背景图路径 */
            background-size: cover; /* 背景图充满整个页面 */
            background-position: center center; /* 背景图居中 */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 使页面高度填满整个视口 */
        }

        /* 设置容器样式 */
        .container {
            width: 80%; /* 容器的宽度 */
            max-width: 800px; /* 最大宽度 */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* 半透明背景，便于阅读 */
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        p {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>汽车详细信息</h2>
    <p>品牌：${car.brand}</p>
    <p>颜色：${car.color}</p>
    <p>座位数：${car.seats}</p>
    <p>百公里耗油：${car.consum}</p>
    <p>生产日期：<fmt:formatDate value="${car.productdate}" pattern="yyyy-MM-dd"/></p>
    <p>日租金：${car.rentmoney}</p>
    <p>添加日期：<fmt:formatDate value="${car.createdate}" pattern="yyyy-MM-dd"/></p>
    <p>添加人：${car.username}</p>
    <a href="CarServlet?action=list">返回列表</a>
</div>
</body>
</html>
