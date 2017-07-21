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

                <c:choose>
                    <c:when test="${currentIndex == 1}">
                        <a  href="#">First page</a>
                       <a class="w3-left w3-btn" href="#">< Previous</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${firstUrl}">First page</a>
                        <a class="w3-left w3-btn" href="${prevUrl}">< Previous</a>
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
                            <a class="active" href="${pageUrl}"><c:out value="${i}"/></a>
                        </c:when>
                        <c:otherwise>
                           <a href="${pageUrl}"><c:out value="${i}"/></a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${currentIndex == page.totalPages}">
                        <a class="w3-right w3-btn" href="#">Next ></a>
                        <a href="#">Last page</a>
                    </c:when>
                    <c:otherwise>
                        <a class="w3-right w3-btn" href="${nextUrl}">Next ></a>
                        <a href="${lastUrl}">Last page</a>
                    </c:otherwise>
                </c:choose>
        </div>

    </c:param>
</c:import>

<!-- pagination------------- -->
<style>
    .w3-btn, .w3-btn:link, .w3-btn:visited {
        color: #FFFFFF;
        background-color: #4CAF50;
    }

    .w3-left {
        margin-right: 5px;
    }

    *, *:before, *:after {
        box-sizing: inherit;
    }

    html, body {
        font-family: Verdana, sans-serif;
        font-size: 15px;
        line-height: 1.5;
    }

    html {
        -ms-text-size-adjust: 100%;
        -webkit-text-size-adjust: 100%;
    }

    .pagination {
        display: inline-block;

    }

    .pagination a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
    }

    .pagination a.active {
        background-color: #4CAF50;
        color: white;
    }

    .pagination a:hover:not(.active) {
        background-color: #ddd;
    }
</style>