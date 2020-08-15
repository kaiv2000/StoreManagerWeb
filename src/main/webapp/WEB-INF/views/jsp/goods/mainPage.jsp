<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>

<jsp:include page="../fragments/header.jsp"/>

<body>

<div class="container">

    <div class="well">

        <h3 style="padding-left: 6%">
            <span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>
            Виберіть категорію товару або скористайтесь пошуком
            <span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>
        </h3>

    </div>

    <c:if test="${not empty msg}">
        <div class="alert alert-${css} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>${msg}</strong>
        </div>
    </c:if>

</div>

<jsp:include page="../fragments/footer.jsp"/>

</body>
</html>