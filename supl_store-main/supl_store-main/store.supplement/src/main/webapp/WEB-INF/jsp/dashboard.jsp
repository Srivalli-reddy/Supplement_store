<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f4f6;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 1rem;
            text-align: center;
        }
        h1, h2 {
            color: #333;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #4CAF50;
            color: white;
        }
        a.button {
            display: inline-block;
            margin: 15px;
            padding: 10px 20px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a.button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome, ${user.username}</h1>
        <p>Your role: ${user.role}</p>
        <a href="/logout" class="button">Logout</a>
    </header>

    <h2>All Registered Users</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.username}</td>
                    <td>${u.role}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>All Products</h2>
    <table>
        <thead>
            <tr>
                <th>Category</th>
                <th>Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.category}</td>
                    <td>${p.name}</td>
                    <td>₹${p.price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="/admin/add-product" class="button">Add New Product</a>
</body>
</html>
