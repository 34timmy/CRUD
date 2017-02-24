<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/WEB-INF/views/layout.jsp" charEncoding="UTF-8">
    <c:param name="title" value="User List"/>
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
        </div>
        <!-- /container -->
        <c:choose>
            <c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'list' ) }">
                <c:url var="firstUrl" value="/list/1"/>
                <c:url var="lastUrl" value="/list/${page.totalPages}"/>
                <c:url var="prevUrl" value="/list/${currentIndex - 1}"/>
                <c:url var="nextUrl" value="/list/${currentIndex + 1}"/>
            </c:when>
            <c:otherwise>
                <c:url var="firstUrl" value="/search/1?${requestScope['javax.servlet.forward.query_string']}"/>
                <c:url var="lastUrl"
                       value="/search/${page.totalPages}?${requestScope['javax.servlet.forward.query_string']}"/>
                <c:url var="prevUrl"
                       value="/search/${currentIndex - 1}?${requestScope['javax.servlet.forward.query_string']}"/>
                <c:url var="nextUrl"
                       value="/search/${currentIndex + 1}?${requestScope['javax.servlet.forward.query_string']}"/>
            </c:otherwise>
        </c:choose>
        <div class="pagination">
            <ul>
                <c:choose>
                    <c:when test="${currentIndex == 1}">
                        <li class="disabled"><a href="#">&lt;&lt;</a></li>
                        <li class="disabled"><a href="#">&lt;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${firstUrl}">&lt;&lt;</a></li>
                        <li><a href="${prevUrl}">&lt;</a></li>
                    </c:otherwise>
                </c:choose>
                <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
                    <c:choose>
                        <c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'list' ) }">
                            <c:url var="pageUrl" value="/list/${i}"/>
                        </c:when>
                        <c:otherwise>
                            <c:url var="pageUrl"
                                   value="/search/${i}?${requestScope['javax.servlet.forward.query_string']}"/>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${i == currentIndex}">
                            <li class="active"><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${pageUrl}"><c:out value="${i}"/></a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${currentIndex == page.totalPages}">
                        <li class="disabled"><a href="#">&gt;</a></li>
                        <li class="disabled"><a href="#">&gt;&gt;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${nextUrl}">&gt;</a></li>
                        <li><a href="${lastUrl}">&gt;&gt;</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

    </c:param>
</c:import>