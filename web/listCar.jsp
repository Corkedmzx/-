<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>汽车列表</title>
    <style>
        /* 设置背景图 */
        body {
            background-image: url('images/background.jpg'); /* 请替换为你实际的背景图 URL */
            background-size: cover; /* 让背景图充满整个页面 */
            background-position: center center; /* 背景图居中显示 */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 让页面高度充满视口 */
        }

        /* 设置容器样式，居中对齐 */
        .container {
            width: 80%; /* 设置一个合理的宽度 */
            max-width: 1200px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* 背景设置为半透明，便于阅读 */
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        button {
            padding: 5px 10px;
            margin: 5px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
        }

        button:hover {
            background-color: #45a049;
        }

        /* 分页和按钮区域样式 */
        .pagination {
            margin-top: 20px;
        }

        .pagination a, .pagination span {
            padding: 8px 16px;
            margin: 0 5px;
            text-decoration: none;
            color: #4CAF50;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>汽车列表</h2>
    <input type="text" id="brandSearch" placeholder="品牌搜索">
    <input type="number" id="minSeats" placeholder="最小座位数">
    <input type="number" id="maxSeats" placeholder="最大座位数">
    <button onclick="searchCars()">搜索</button>

    <table>
        <thead>
        <tr>
            <th>序号</th>
            <th>品牌</th>
            <th>颜色</th>
            <th>座位数</th>
            <th>日租金</th>
            <th>添加日期</th>
            <th>添加人</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="carList">
        <c:forEach items="${cars}" var="car" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${car.brand}</td>
                <td>${car.color}</td>
                <td>${car.seats}</td>
                <td>${car.rentmoney}</td>
                <td><fmt:formatDate value="${car.createdate}" pattern="yyyy-MM-dd"/></td>
                <td>${car.username}</td>
                <td>
                    <button onclick="viewCar(${car.id})">查看</button>
                    <button onclick="deleteCar(${car.id})">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <button onclick="window.location.href='addCar.jsp'">添加汽车</button>

    <!-- 分页链接 -->
    <div class="pagination">
        <!-- 判断当前页是否大于1，如果是，则显示首页和上一页 -->
        <c:if test="${page > 1}">
            <a href="CarServlet?action=list&page=1">首页</a>
            <a href="CarServlet?action=list&page=${page - 1}">上一页</a>
        </c:if>

        <!-- 只有当总页数大于3时，才进行折叠处理 -->
        <c:if test="${totalPages > 3}">
            <!-- 显示第一页 -->
            <a href="CarServlet?action=list&page=1">1</a>

            <!-- 判断是否需要显示省略号 -->
            <c:if test="${page > 3}">
                <span>...</span>
            </c:if>

            <!-- 只显示当前页 -->
            <c:if test="${page > 0 && page <= totalPages}">
                <a href="CarServlet?action=list&page=${page}">${page}</a>
            </c:if>


            <!-- 判断是否需要显示省略号 -->
            <c:if test="${page < totalPages - 2}">
                <span>...</span>
            </c:if>

            <!-- 显示最后一页 -->
            <a href="CarServlet?action=list&page=${totalPages}">${totalPages}</a>
        </c:if>

        <!-- 如果总页数小于等于3，则显示所有页 -->
        <c:if test="${totalPages <= 3}">
            <c:forEach begin="1" end="${totalPages}" var="p">
                <a href="CarServlet?action=list&page=${p}">${p}</a>
            </c:forEach>
        </c:if>

        <!-- 判断当前页是否小于总页数，如果是，则显示下一页和末页 -->
        <c:if test="${page < totalPages}">
            <a href="CarServlet?action=list&page=${page + 1}">下一页</a>
            <a href="CarServlet?action=list&page=${totalPages}">末页</a>
        </c:if>
    </div>

    <!-- 分页信息 -->
    <div>
        当前页：${page} / 总页数：${totalPages}
    </div>
</div>

<script>
    function searchCars() {
        var brand = document.getElementById('brandSearch').value;
        var minSeats = document.getElementById('minSeats').value;
        var maxSeats = document.getElementById('maxSeats').value;
        window.location.href = 'CarServlet?action=search&brand=' + encodeURIComponent(brand) + '&minSeats=' + minSeats + '&maxSeats=' + maxSeats;
    }

    function deleteCar(carId) {
        if (confirm('确定要删除这辆汽车吗？')) {
            window.location.href = 'CarServlet?action=delete&id=' + carId;
        }
    }

    function viewCar(carId) {
        window.location.href = 'CarServlet?action=view&id=' + carId;
    }

    window.onload = function() {
        loadCarList(1);
    };

    function loadCarList(page) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'CarServlet?action=list&page=' + page, true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                var cars = JSON.parse(xhr.responseText);
                var carList = document.getElementById('carList');
                carList.innerHTML = '';
                cars.forEach(function(car, index) {
                    var row = `<tr>
                            <td>${index + 1}</td>
                            <td>${car.brand}</td>
                            <td>${car.color}</td>
                            <td>${car.seats}</td>
                            <td>${car.rentmoney}</td>
                            <td>${car.createdate}</td>
                            <td>${car.username}</td>
                            <td>
                                <button onclick="viewCar(${car.id})">查看</button>
                                <button onclick="deleteCar(${car.id})">删除</button>
                            </td>
                        </tr>`;
                    carList.innerHTML += row;
                });
            }
        };
        xhr.send();
    }
</script>
</body>
</html>
