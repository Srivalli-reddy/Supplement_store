<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            background: linear-gradient(to right, #fdfbfb, #ebedee);
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(135deg, #2c3e50, #4ca1af);
            color: white;
            display: flex;
            flex-direction: column;
            padding: 25px;
            box-shadow: 2px 0 10px rgba(0,0,0,0.2);
        }

        .sidebar h2 {
            margin-bottom: 40px;
            font-size: 24px;
            border-bottom: 2px solid #fff;
            padding-bottom: 10px;
        }

        .sidebar a {
            color: #f1f1f1;
            text-decoration: none;
            margin: 12px 0;
            font-size: 18px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            color: #ffd700;
            font-weight: bold;
        }

        .main {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .logout-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
        }

        .logout-btn:hover {
            background-color: #c0392b;
        }

        table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .btn-back, .btn-add, .btn-delete {
            margin-bottom: 10px;
        }

        .product-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
        }

        h1, h2 {
            font-weight: 600;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <a onclick="showSection('dashboard')">🏠 Dashboard</a>
    <a onclick="showSection('products')">📦 Product List</a>
    <a onclick="showSection('users')">👥 Registered Users</a>
</div>

<!-- Main content -->
<div class="main">
    <div class="header">
        <h1>Welcome, Admin!</h1>
        <a href="/logout" class="btn logout-btn">Logout</a>
    </div>

    <!-- Dashboard section -->
    <div id="dashboard">
        <h2>Dashboard</h2>
        <p>Select an option from the sidebar to manage your store.</p>
    </div>

    <!-- Product list section -->
    <div id="products" style="display:none;">
        <button class="btn btn-secondary btn-back" onclick="showSection('dashboard')">← Back</button>
        <h2>Product List</h2>
        <a href="/admin/addProduct" class="btn btn-success btn-add">➕ Add New Product</a>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>₹${product.price}</td>
                        <td>
                            <img src="${product.imageUrl}" class="product-img" alt="${product.name}" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- User list section -->
    <div id="users" style="display:none;">
        <button class="btn btn-secondary btn-back" onclick="showSection('dashboard')">← Back</button>
        <h2>Registered Users</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.role}</td>
                        <td>
                            <form action="/admin/deleteUser/${user.id}" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                                <button type="submit" class="btn btn-danger btn-sm">🗑 Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS + Section Toggle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function showSection(sectionId) {
        document.getElementById('dashboard').style.display = 'none';
        document.getElementById('products').style.display = 'none';
        document.getElementById('users').style.display = 'none';
        document.getElementById(sectionId).style.display = 'block';
    }
</script>

</body>
</html>
