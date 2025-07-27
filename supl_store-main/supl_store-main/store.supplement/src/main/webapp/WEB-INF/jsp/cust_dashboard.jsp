<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
	    body {
	        margin: 0;
	        padding: 0;
	        min-height: 100vh;
	        background: linear-gradient(135deg, #e0f7fa, #f1f8e9, #fff3e0);
	        background-size: 400% 400%;
	        animation: gradientAnimation 20s ease infinite;
	    }

	    @keyframes gradientAnimation {
	        0% {background-position: 0% 50%;}
	        50% {background-position: 100% 50%;}
	        100% {background-position: 0% 50%;}
	    }

	    .navbar-brand {
	        font-weight: bold;
	        font-size: 1.6rem;
	    }

		.card {
		    border-radius: 20px;
		    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
		    transition: transform 0.3s ease-in-out;
		    background-color: #ffffffc9;
		    backdrop-filter: blur(5px);
		    min-height: 320px;
		}

	    .card:hover {
	        transform: scale(1.05);
	        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
	    }

		.product-img {
		    height: 130px;
		    width: 100%;
		    object-fit: contain; /* change from cover to contain for full image visibility */
		    padding: 10px;
		    background-color: #fff;
		    border-top-left-radius: 20px;
		    border-top-right-radius: 20px;
		}

	    .add-to-cart-btn {
	        width: 100%;
	        font-weight: 600;
	    }

	    .welcome-text {
	        font-size: 1.1rem;
	        font-weight: 500;
	        margin-right: 15px;
	    }

	    .header-section {
	        background-color: rgba(255, 255, 255, 0.7);
	        border-radius: 15px;
	        padding: 15px;
	        margin-top: 30px;
	    }

	    h2 {
	        font-weight: 700;
	    }
	</style>

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/customer/dashboard">🛒 Supplements Store</a>
        <div class="d-flex align-items-center">
            <span class="welcome-text text-white">Welcome, ${username}!</span>
            <a href="/customer/cart" class="btn btn-warning me-2">🧺 View Cart</a>
            <a href="/logout" class="btn btn-danger">Logout</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container header-section text-center">
    <h2 class="mb-3">✨ Explore Our Products</h2>
    <p class="text-muted">Browse from a wide range of quality supplements tailored for your health goals!</p>
</div>

<div class="container mt-4">
    <div class="row">
        <c:forEach var="product" items="${products}">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <c:if test="${not empty product.imageUrl}">
                        <img src="${product.imageUrl}" class="card-img-top product-img" alt="${product.name}">
                    </c:if>
                    <div class="card-body d-flex flex-column justify-content-between">
                        <h5 class="card-title">${product.name}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">${product.category}</h6>
                        <p class="card-text">Price: ₹${product.price}</p>
                        <form method="post" action="/customer/cart/add/${product.id}">
                            <button type="submit" class="btn btn-success add-to-cart-btn">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
