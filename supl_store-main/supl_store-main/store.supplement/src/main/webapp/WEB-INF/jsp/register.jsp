<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 350px;
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 4px;
            font-size: 16px;
        }
        .error {
            color: red;
            text-align: center;
        }
        .success {
            color: green;
            text-align: center;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
        }
    </style>
    <script>
        // Auto-redirect after 3 seconds if success message is present
        window.onload = function () {
            var success = "${success}";
            if (success) {
                setTimeout(function () {
                    window.location.href = "/login";
                }, 3000);
            }
        }
    </script>
</head>
<body>
<div class="register-container">
    <h2>Register</h2>
    <form action="/register" method="post">
        <label>Username:</label>
        <input type="text" name="username" required />

        <label>Password:</label>
        <input type="password" name="password" required />

        <label>Confirm Password:</label>
        <input type="password" name="confirmPassword" required />

        <label>Role:</label>
        <select name="role">
            <option value="CUSTOMER" selected>Customer</option>
            <option value="ADMIN">Admin</option>
        </select>

        <button type="submit">Register</button>
    </form>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <c:if test="${not empty success}">
        <div class="success">${success}</div>
    </c:if>

    <a href="/login">Already have an account? Login here</a>
</div>
</body>
</html>
