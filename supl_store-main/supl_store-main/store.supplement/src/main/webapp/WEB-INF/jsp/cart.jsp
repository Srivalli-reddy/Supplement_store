<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .cart-img {
            height: 100px;
            width: 100px;
            object-fit: cover;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h2 class="mb-4 text-center">Your Cart</h2>

    <c:if test="${empty cartItems}">
        <p class="text-center">Your cart is empty.</p>
    </c:if>

    <c:if test="${not empty cartItems}">
        <table class="table table-striped table-bordered">
            <thead class="table-primary">
                <tr>
                    <th>Image</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td><img src="${item.product.imageUrl}" class="cart-img" alt="Image"></td>
                        <td>${item.product.name}</td>
                        <td>₹${item.product.price}</td>
                        <td>${item.quantity}</td>
                        <td>₹${item.product.price * item.quantity}</td>
                        <td>
                            <a href="/customer/cart/delete/${item.id}" class="btn btn-sm btn-danger">Remove</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr class="table-secondary">
                    <td colspan="4" class="text-end fw-bold">Total</td>
                    <td colspan="2" class="fw-bold">₹${total}</td>
                </tr>
            </tbody>
        </table>
    </c:if>

    <a href="/customer/dashboard" class="btn btn-primary">← Continue Shopping</a>
</div>

</body>
</html>
