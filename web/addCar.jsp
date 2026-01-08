<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加汽车</title>
    <style>
        body {
            background-image: url('images/m1.jpeg'); /* 设置背景图片 */
            background-size: cover;  /* 背景图片覆盖整个页面 */
            background-position: center center; /* 背景图片居中 */
            background-attachment: fixed; /* 背景图固定在页面，不随滚动条移动 */
            font-family: Arial, sans-serif; /* 设置字体 */
            margin: 0;
            padding: 0;
            height: 100vh; /* 使页面高度为视口高度 */
            display: flex;
            justify-content: center; /* 水平居中 */
            align-items: center; /* 垂直居中 */
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.8); /* 背景色，并加入透明度 */
            padding: 20px;
            border-radius: 10px; /* 圆角 */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 阴影 */
            width: 300px; /* 设置容器宽度 */
            text-align: center; /* 文字居中 */
        }
        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%; /* 按钮宽度占满容器 */
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049; /* 鼠标悬停时改变按钮颜色 */
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>添加汽车</h2>
    <form action="CarServlet" method="post">
        <input type="hidden" name="action" value="addCar">
        品牌：<input type="text" name="brand"><br>
        颜色：<input type="text" name="color"><br>
        座位数：<input type="number" name="seats"><br>
        百公里耗油：<input type="text" name="consum"><br>
        生产日期：<input type="date" name="productdate"><br>
        日租金：<input type="text" name="rentmoney"><br>
        <input type="submit" value="添加汽车">
    </form>
</div>
</body>
</html>
