# 汽车管理系统

一个基于 Java Servlet 和 JSP 开发的汽车管理系统，运行于 Apache Tomcat 服务器环境。

## 项目简介

这是一个功能完整的汽车租赁管理系统，支持用户注册登录、汽车信息的增删改查、分页显示、条件搜索等功能。系统采用经典的 MVC（Model-View-Controller）架构设计，代码结构清晰，易于维护和扩展。

## 技术栈

- **后端框架**: Java Servlet
- **前端技术**: JSP、HTML、CSS、JavaScript
- **数据库**: MySQL 8.0+
- **服务器**: Apache Tomcat 9.0.95
- **开发工具**: JDK 8+
- **依赖库**:
  - MySQL Connector/J 8.0.19
  - JSTL 1.2
  - Apache Commons FileUpload 1.2.2
  - Apache Commons IO 2.4

## 项目结构

```
CarProject/
├── src/                          # Java 源代码目录
│   └── com/szit/test/
│       ├── servlet/              # Servlet 控制器层
│       │   ├── CarServlet.java   # 汽车管理控制器
│       │   ├── LoginServlet.java # 登录控制器
│       │   └── RegisterServlet.java # 注册控制器
│       ├── biz/                  # 业务逻辑层
│       │   ├── CarBiz.java       # 汽车业务逻辑
│       │   └── UserBiz.java      # 用户业务逻辑
│       ├── dao/                  # 数据访问层
│       │   ├── CarDao.java       # 汽车数据访问接口
│       │   ├── impl/
│       │   │   └── CarDaoImpl.java # 汽车数据访问实现
│       │   ├── UserDao.java      # 用户数据访问接口
│       │   └── MySqlConnection.java # 数据库连接工具类
│       └── entity/               # 实体类
│           └── Car.java          # 汽车实体类
├── web/                          # Web 资源目录
│   ├── WEB-INF/
│   │   ├── lib/                  # 依赖库目录
│   │   └── web.xml              # Web 应用配置文件
│   ├── *.jsp                     # JSP 页面文件
│   │   ├── index.jsp            # 首页（登录页）
│   │   ├── login.jsp            # 登录页面
│   │   ├── register.jsp         # 注册页面
│   │   ├── listCar.jsp          # 汽车列表页面
│   │   ├── addCar.jsp           # 添加汽车页面
│   │   └── viewCar.jsp          # 查看汽车详情页面
│   └── images/                   # 图片资源目录
└── car_sql.sql                   # 数据库初始化脚本
```

## 功能特性

### 用户管理
- ✅ 用户注册功能
- ✅ 用户登录功能
- ✅ Session 会话管理

### 汽车管理
- ✅ 添加汽车信息（品牌、颜色、座位数、耗油量、生产日期、日租金等）
- ✅ 查看汽车列表（支持分页显示，每页4条记录）
- ✅ 查看汽车详细信息
- ✅ 删除汽车信息
- ✅ 条件搜索（按品牌、座位数范围搜索）
- ✅ 分页导航（首页、上一页、下一页、末页）

## 数据库设计

### 数据库信息
- **数据库名**: `car_sql`
- **字符集**: `utf8mb4`
- **排序规则**: `utf8mb4_0900_ai_ci`

### 数据表结构

#### 1. users 表（用户表）
| 字段名 | 类型 | 说明 |
|--------|------|------|
| username | varchar(255) | 用户名（唯一键） |
| password | varchar(255) | 密码 |

#### 2. cars 表（汽车表）
| 字段名 | 类型 | 说明 |
|--------|------|------|
| id | int | 主键，自增 |
| brand | varchar(50) | 品牌 |
| color | varchar(50) | 颜色 |
| seats | int | 座位数 |
| consum | decimal(5,1) | 百公里耗油量 |
| productdate | date | 生产日期 |
| rentmoney | decimal(10,2) | 日租金 |
| createdate | date | 添加日期 |
| username | varchar(255) | 添加人（外键关联 users.username） |

## 环境要求

- **JDK**: 1.8 或更高版本
- **Tomcat**: 9.0 或更高版本
- **MySQL**: 8.0 或更高版本
- **操作系统**: Windows / Linux / macOS

## 安装部署

### 1. 数据库配置

#### 创建数据库
```sql
CREATE DATABASE car_sql CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
```

#### 导入数据库
执行项目根目录下的 `car_sql.sql` 文件：
```bash
mysql -u root -p car_sql < car_sql.sql
```

#### 修改数据库连接配置
编辑 `src/com/szit/test/dao/MySqlConnection.java` 文件，修改数据库连接参数：

```java
cn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/car_sql?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&useSSL=false&serverTimezone=Asia/Shanghai",
    "root",          // 修改为你的数据库用户名
    "123456"         // 修改为你的数据库密码
);
```

### 2. 项目部署

#### 方式一：直接部署到 Tomcat webapps 目录

1. 将整个 `CarProject` 文件夹复制到 Tomcat 的 `webapps` 目录
2. 或者将项目打包成 WAR 文件，命名为 `CarProject.war`，放入 `webapps` 目录
3. 启动 Tomcat 服务器
4. 访问：`http://localhost:8080/CarProject/index.jsp`

#### 方式二：使用 IDE（如 IntelliJ IDEA 或 Eclipse）部署

1. 导入项目到 IDE
2. 配置 Tomcat 服务器
3. 添加项目依赖库（确保 `web/WEB-INF/lib` 目录下的所有 jar 包都在 classpath 中）
4. 运行项目

### 3. 编译项目

如果使用命令行编译：

```bash
# 编译 Java 源文件
javac -encoding UTF-8 -cp "web/WEB-INF/lib/*" -d web/WEB-INF/classes src/com/szit/test/**/*.java

# 确保编译后的 class 文件在正确的位置
```

## 使用说明

### 默认账号
- **用户名**: `admin`
- **密码**: `123456`

### 操作流程

1. **登录系统**
   - 访问首页会自动跳转到登录页面
   - 输入用户名和密码进行登录
   - 新用户可点击"注册"链接创建账户

2. **查看汽车列表**
   - 登录成功后自动跳转到汽车列表页面
   - 支持分页浏览，每页显示 4 条记录

3. **搜索汽车**
   - 在列表页面顶部输入搜索条件：
     - 品牌名称（支持模糊搜索）
     - 最小座位数
     - 最大座位数
   - 点击"搜索"按钮执行查询

4. **添加汽车**
   - 点击"添加汽车"按钮
   - 填写汽车信息表单
   - 提交后自动跳转到列表页面

5. **查看详情**
   - 在列表中点击"查看"按钮
   - 查看汽车的完整详细信息

6. **删除汽车**
   - 在列表中点击"删除"按钮
   - 确认后删除该汽车记录

## 注意事项

1. **数据库连接**: 确保 MySQL 服务已启动，并且数据库连接参数配置正确
2. **字符编码**: 项目使用 UTF-8 编码，确保数据库、服务器和 IDE 都设置为 UTF-8
3. **时区设置**: 数据库连接 URL 中已设置时区为 `Asia/Shanghai`，如需修改请更改连接字符串
4. **权限问题**: 确保 Tomcat 有读写 `webapps` 目录的权限
5. **端口占用**: 默认使用 8080 端口，如被占用请修改 Tomcat 配置

## 开发说明

### 架构设计
系统采用三层架构：
- **表示层（View）**: JSP 页面负责用户界面展示
- **控制层（Controller）**: Servlet 负责处理 HTTP 请求和响应
- **业务层（Business）**: Biz 类负责业务逻辑处理
- **数据访问层（DAO）**: Dao 类负责数据库操作
- **实体层（Entity）**: 实体类封装数据对象

### 代码规范
- 包名：`com.szit.test`
- 类名：使用大驼峰命名（PascalCase）
- 方法名：使用小驼峰命名（camelCase）
- 注释：关键方法和类都有注释说明

## 常见问题

### Q: 页面出现乱码？
A: 确保以下设置都为 UTF-8：
   - JSP 页面编码：`<%@ page contentType="text/html;charset=UTF-8" %>`
   - Servlet 请求编码：`request.setCharacterEncoding("UTF-8")`
   - 数据库字符集：`utf8mb4`

### Q: 无法连接数据库？
A: 检查以下几点：
   - MySQL 服务是否启动
   - 数据库连接参数是否正确
   - 数据库用户是否有足够权限
   - MySQL JDBC 驱动版本是否兼容

### Q: 404 错误？
A: 检查：
   - 项目部署路径是否正确
   - web.xml 配置是否正确
   - Servlet 的 urlPatterns 是否正确

## 更新日志

### v1.0.0 (2024-12-23)
- ✅ 初始版本发布
- ✅ 实现用户注册登录功能
- ✅ 实现汽车信息的增删改查功能
- ✅ 实现分页显示功能
- ✅ 实现条件搜索功能
- ✅ 完善用户界面样式

## 作者

项目由 SZIT 开发团队开发

## 许可证

MIT License

---

**提示**: 如有问题或建议，欢迎提交 Issue 或 Pull Request。
