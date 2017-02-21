<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/layout.jsp" charEncoding="UTF-8">
    <c:param name="title" value="User List" />
    <c:param name="body">
    	<div class="container" role="main">
	    	<h1>User List</h1>
			<table class="table">
				<thead>
					<tr>
						<th>Name</th>
						<th>Age</th>
						<th>isAdmin</th>
						<th>Creation Date</th>
						<th>&nbsp;</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${listUser}">
						<tr>
							<td>${user.name}</td>
							<td>${user.age}</td>
							<td>${user.isAdmin} </td>
							<td>${user.creationDate}</td>
							<td>
								<a href="${pageContext.request.contextPath}/edit/${user.id}">Edit</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/delete/${user.id}">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>			
		</div> <!-- /container -->
	</c:param>
</c:import>