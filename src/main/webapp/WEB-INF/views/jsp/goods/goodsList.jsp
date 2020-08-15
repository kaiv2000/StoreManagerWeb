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

    <c:if test="${not empty msg}">
        <div class="alert alert-${css} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>${msg}</strong>
        </div>
    </c:if>


    <c:choose>
        <c:when test="${not empty goods}">

            <!--All products table-->
            <table class="table">
                <thead>
                <tr>
                    <th>ID товару</th>
                    <th>Назва товару</th>
                    <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">
                        <th>Прихідна</th>
                    </sec:authorize>

                    <th>Вихідна</th>
                    <th>Деталі</th>
                    <th>Місце продажу</th>
                    <th>Залишок</th>
                    <th>Продано</th>
                    <th>Статус</th>
                    <th style="text-align: right">
                        <span class="label label-info">Кількість: ${goods.size()}</span>
                    </th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="goods" items="${goods}">

                    <spring:url value="${goods.getClass().simpleName}" var="currentClassType"/>

                    <c:choose>
                        <c:when test="${currentClassType == 'Cellphone'}">
                            <spring:url value="/goods/${goods.id}?productType=CellPhones" var="productUrl"/>
                            <spring:url value="/delete-goods-${goods.id}?productType=CellPhones" var="deleteUrl"/>
                        </c:when>

                        <c:when test="${currentClassType == 'Accessories'}">
                            <spring:url value="/goods/${goods.id}?productType=Accessories" var="productUrl"/>
                            <spring:url value="/delete-goods-${goods.id}?productType=Accessories" var="deleteUrl"/>
                        </c:when>

                        <c:when test="${currentClassType == 'Spareparts'}">
                            <spring:url value="/goods/${goods.id}?productType=Parts" var="productUrl"/>
                            <spring:url value="/delete-goods-${goods.id}?productType=Parts" var="deleteUrl"/>
                        </c:when>
                    </c:choose>

                    <tr>
                        <td style="vertical-align: middle"><a href="${productUrl}">${goods.id}</a></td>
                        <th style="vertical-align: middle">${goods.name}</th>

                        <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">
                            <td style="vertical-align: middle">
                                <fmt:formatNumber value="${goods.priceIn}" minFractionDigits="0" maxFractionDigits="1"/>
                            </td>
                        </sec:authorize>

                        <td style="vertical-align: middle">${goods.priceOut}</td>

                        <td style="vertical-align: middle">${goods.details}</td>

                        <td style="vertical-align: middle">${goods.sellPointName}</td>

                        <c:choose>
                            <c:when test="${currentClassType ne 'Cellphone'}">
                                <td style="vertical-align: middle">${goods.quantity}</td>
                            </c:when>
                            <c:otherwise>
                                <td style="vertical-align: middle"></td>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${currentClassType ne 'Cellphone'}">
                                <td style="vertical-align: middle">${goods.soldQuantity}</td>
                            </c:when>
                            <c:otherwise>
                                <td style="vertical-align: middle"></td>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>

                            <c:when test="${goods.isSold()}">

                                <td style="vertical-align: middle">Продано</td>

                            </c:when>

                            <c:otherwise>

                                <td style="vertical-align: middle">Продається</td>

                            </c:otherwise>

                        </c:choose>

                        <td style="text-align: right; vertical-align: middle">

                            <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">

                                <button class="btn btn-danger"
                                        data-toggle="confirmation"
                                        data-btn-ok-label="ТАК"
                                        data-btn-ok-icon="glyphicon glyphicon-share-alt"
                                        data-btn-ok-class="btn-success"
                                        data-btn-cancel-label="НІ"
                                        data-btn-cancel-icon="glyphicon glyphicon-ban-circle"
                                        data-btn-cancel-class="btn-danger"
                                        data-title="Точно видалити товар?"
                                        data-content="Це видалить товар з бази даних"
                                        value="${deleteUrl}"
                                >
                                    <span class="glyphicon glyphicon-trash"/>
                                </button>

                            </sec:authorize>

                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>


        </c:when>

        <c:otherwise>
            <br>

            <div class="alert alert-info">
                <h4> Згідно заданого критерію товарів не знайдено </h4>
            </div>

        </c:otherwise>

    </c:choose>


</div>

<jsp:include page="../fragments/footer.jsp"/>

</body>
</html>