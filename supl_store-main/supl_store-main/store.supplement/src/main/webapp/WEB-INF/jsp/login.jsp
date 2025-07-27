<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <form action="/login" method="post">
        <h2>Login</h2>
        <label>Username:</label>
        <input type="text" name="username" required />

        <label>Password:</label>
        <input type="password" name="password" required />

        <input type="submit" value="Login" />
        <p class="error">${error}</p>
        <a href="/register">Register here</a>
    </form>
</body>
</html>
