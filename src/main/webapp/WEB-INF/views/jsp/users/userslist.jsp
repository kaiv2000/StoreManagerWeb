<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<jsp:include page="../fragments/header.jsp"/>

<spring:url value="/newuser" var="newUser"/>

<body>

<div class="container">

    <c:if test="${not empty msg}">
        <div class="alert alert-${css} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>${msg}</strong>
        </div>
    </c:if>

    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">Список Користувачів</span></div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Логін</th>
                <th>Ім'я</th>
                <th>Призвіще</th>
                <th></th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <spring:url value="/edit-user-${user.ssoId}" var="editUser"/>
                <tr>
                    <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">
                        <td><a href="${editUser}">${user.ssoId}</a></td>
                    </sec:authorize>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td style="text-align: right;">
                        <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">
                            <spring:url value="/delete-user-${user.ssoId}" var="deleteUser"/>

                            <button class="btn btn-danger"
                                    data-toggle="confirmation"
                                    data-btn-ok-label="ТАК"
                                    data-btn-ok-icon="glyphicon glyphicon-share-alt"
                                    data-btn-ok-class="btn-success"
                                    data-btn-cancel-label="НІ"
                                    data-btn-cancel-icon="glyphicon glyphicon-ban-circle"
                                    data-btn-cancel-class="btn-danger"
                                    data-title="Точно видалити користувача?"
                                    data-content="Це видалить користувача з бази даних"
                                    value="${deleteUser}"
                            >
                                <span class="glyphicon glyphicon-trash"/>
                            </button>
                        </sec:authorize>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
    <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">
        <button class="btn btn-primary" onclick="location.href='${newUser}'">Додати користувача</button>
    </sec:authorize>
</div>

<jsp:include page="../fragments/footer.jsp"/>

</body>
</html>