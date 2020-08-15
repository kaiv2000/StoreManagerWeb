<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <h1>Оплата коштів за товар в кредит</h1>

    <br/>

    <div class="row">
        <label class="col-sm-2">ID</label>
        <div class="col-sm-10 hidden-print">${phone.id}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Назва</label>
        <div class="col-sm-10 showed-print">${phone.name}</div>
    </div>

    <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">
        <div class="row">
            <label class="col-sm-2">Прихідна ціна</label>
            <div class="col-sm-10 hidden-print">
                <fmt:formatNumber value="${phone.priceIn}" minFractionDigits="0" maxFractionDigits="1"/>
            </div>
        </div>
    </sec:authorize>


    <div class="row">
        <label class="col-sm-2">Вихідна ціна</label>
        <div class="col-sm-10 showed-print">${phone.priceOut}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Вихідна ціна ГРН</label>
        <div class="col-sm-10 showed-print">${phone.priceOutHryvnya}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">IMEI</label>
        <div class="col-sm-10 showed-print">${phone.imei}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Трек номер</label>
        <div class="col-sm-10 hidden-print">${phone.trackNumber}</div>
    </div>


    <div class="row">
        <label class="col-sm-2">Деталі</label>
        <div class="col-sm-10 hidden-print">${phone.details}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Місце продажу товару</label>
        <div class="col-sm-10 showed-print">${phone.sellPointName}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Дата приходу товару</label>
        <div class="col-sm-10 hidden-print">
            <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${phone.arrivalDate}"/>
        </div>
    </div>

    <div class="row">
        <label class="col-sm-2">Дата продажу товару</label>
        <div class="col-sm-10 showed-print">
            <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${phone.saleDate}"/>
        </div>
    </div>

    <div class="row">
        <label class="col-sm-2">Гарантія</label>
        <div class="col-sm-10 showed-print">${phone.warrantyTime}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Знижка</label>
        <div class="col-sm-10 showed-print">${phone.discount} %</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Ім'я покупця</label>
        <div class="col-sm-10 hidden-print">${phone.sellerName}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">№ телефону покупця</label>
        <div class="col-sm-10 hidden-print">${phone.sellerNumber}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Останній внесок</label>
        <div class="col-sm-10 showed-print">${phone.priceOutFirstPart}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Залишок до оплати</label>
        <div class="col-sm-10 showed-print">${phone.priceOutRemainder}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Деталі кредиту</label>
        <div class="col-sm-10 showed-print">${phone.debtDetails}</div>
    </div>

    <spring:url value="/payment-product-done" var="productPaymentUrl"/>

    <form:form class="form-horizontal" method="post" modelAttribute="phone" action="${productPaymentUrl}">

        <form:hidden path="id"/>
        <form:hidden path="name"/>
        <form:hidden path="priceIn"/>
        <form:hidden path="priceOut"/>
        <form:hidden path="priceOutHryvnya"/>
        <form:hidden path="imei"/>
        <form:hidden path="trackNumber"/>
        <form:hidden path="details"/>
        <form:hidden path="sellPointName"/>
        <form:hidden path="arrivalDate"/>
        <form:hidden path="saleDate"/>
        <form:hidden path="warrantyTime"/>
        <form:hidden path="discount"/>
        <form:hidden path="sellerName"/>
        <form:hidden path="sellerNumber"/>
        <form:hidden path="priceOutRemainder"/>
        <form:hidden path="debtDetails"/>
        <form:hidden path="sold"/>
        <form:hidden path="inDebt"/>


        <spring:bind path="priceOutFirstPart">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Наступний внесок ГРН</label>
                <div class="col-sm-10">
                    <form:input type="number" step="0.01" min="0" max="9999" path="priceOutFirstPart" required="true"
                                class="form-control"
                                id="priceFirstPart"
                                title="Наступний внесок - тільки цифри"
                                placeholder="Введіть суму кредитного внеску товару в гривнях"/>
                    <form:errors path="priceOutFirstPart" class="control-label"/>
                </div>
            </div>
        </spring:bind>


        <button class="btn btn-success" type="submit">Оплатити
            <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
        </button>

    </form:form>

</div>

<jsp:include page="../fragments/footer.jsp"/>


</body>
</html>