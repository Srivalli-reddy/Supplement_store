<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>All Registered Users</title>
</head>
<body>
    <h2>Registered Users (Total: ${count})</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.role}</td>
                </tr>
            </c:forEach>
        </tbody>
		<td>${user.username != null && !user.username.isEmpty() ? user.username : 'N/A'}</td>
		<td>${user.role != null ? user.role : 'N/A'}</td>

    </table>
    <br>
    <a href="/dashboard">Back to Dashboard</a>
</body>
</html>
