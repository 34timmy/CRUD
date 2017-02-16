<%--
  Created by IntelliJ IDEA.
  User: Тимур
  Date: 10.02.2017
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Management Screen</title>
</head>
<body>
<div align="center">
    <h1>User List</h1>
    <h3>
        <a href="newUser">New User</a>
    </h3>
    <table border="1">

        <th>Name</th>
        <th>Age</th>
        <th>Admin</th>
        <th>Date</th>
        <th>Action</th>

        <c:forEach var="user" items="${listUser}">
            <tr>

                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>${user.isAdmin}</td>
                <td>${user.creationDate}</td>
                <td><a href="editUser?id=${user.id}">Edit</a>
                    <a
                            href="deleteUser?id=${user.id}">Delete</a></td>

            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>