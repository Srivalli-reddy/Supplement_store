<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fafafa;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #2196F3;
            color: white;
            padding: 1rem;
            text-align: center;
        }
        h1 {
            margin: 0;
        }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .product-card {
            background: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
        }
        .product-card h3 {
            margin: 0;
            color: #333;
        }
        .product-card p {
            color: #777;
        }
        .price {
            color: #4CAF50;
            font-weight: bold;
            margin-top: 10px;
        }
        a.logout {
            display: inline-block;
            margin: 15px;
            padding: 10px 20px;
            background: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a.logout:hover {
            background: #d32f2f;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome, ${user.username}</h1>
        <p>Your role: ${user.role}</p>
        <a href="/logout" class="logout">Logout</a>
    </header>

    <div class="product-grid">
        <c:forEach var="p" items="${products}">
            <div class="product-card">
                <h3>${p.name}</h3>
                <p>${p.category}</p>
                <p class="price">₹${p.price}</p>
            </div>
        </c:forEach>
    </div>
</body>
</html>
