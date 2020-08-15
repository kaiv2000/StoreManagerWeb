<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<jsp:include page="../fragments/header.jsp"/>

<body>

<div class="container">

    <c:choose>
        <c:when test="${not empty reportObjectList}">

            <!--Report table-->
            <table class="table">

                <thead>
                <tr class="info">
                    <th>Тип товару</th>
                    <th>Кількість не проданих</th>
                    <th>Загальна сума</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="reportObjectList" items="${reportObjectList}">

                    <tr>

                        <td style="vertical-align: middle"><b>${reportObjectList.productType}</b></td>

                        <td style="vertical-align: middle">${reportObjectList.activeQuantity}</td>

                        <td style="vertical-align: middle">
                            <fmt:formatNumber value="${reportObjectList.activeMoneySum}" minFractionDigits="0"
                                              maxFractionDigits="1"/>
                        </td>

                    </tr>

                </c:forEach>

                </tbody>
            </table>

        </c:when>

        <c:otherwise>
            <br>

            <div class="alert alert-info">
                <h4> Проблема доступу до бази даних </h4>
            </div>

        </c:otherwise>

    </c:choose>


</div>

<jsp:include page="../fragments/footer.jsp"/>

</body>
</html>