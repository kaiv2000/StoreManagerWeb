<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<jsp:include page="../fragments/header.jsp"/>

<spring:url value="/update-goods-${goods.id}?productType=CellPhones" var="updateUrl"/>
<spring:url value="/delete-goods-${goods.id}?productType=CellPhones" var="deleteUrl"/>

<spring:url value="/cell-product-${goods.id}?productType=CellPhones" var="cellUrl"/>
<spring:url value="/return-product-${goods.id}?productType=CellPhones" var="returnUrl"/>

<spring:url value="/print-${goods.id}?productType=CellPhones" var="printLabel"/>

<spring:url value="/print-${goods.id}?productType=CellPhones" var="printLabel"/>

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

    <h1>
        Друк лейби товару
    </h1>

    <br/>

    <script>
        function printLabel() {
            window.print();
        };
    </script>

    <button class="btn btn-info" onClick="printLabel()">Друк лейби
        <span class="glyphicon glyphicon-print" aria-hidden="true"></span>
    </button>

    <br/>
    <br/>

    <div class="row">
        <label class="col-sm-2">ID</label>
        <div class="col-sm-10 hidden-print">${goods.id}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Назва</label>
        <div class="col-sm-10 showed-print">${goods.name}</div>
    </div>

    <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">

        <div class="row">
            <label class="col-sm-2">Прихідна ціна</label>
            <div class="col-sm-10 hidden-print">
                <fmt:formatNumber value="${goods.priceIn}" minFractionDigits="0" maxFractionDigits="1"/>
            </div>
        </div>

    </sec:authorize>

    <div class="row">
        <label class="col-sm-2">Вихідна ціна $</label>
        <div class="col-sm-10 showed-print">${goods.priceOut}</div>
    </div>


    <div class="row">
        <label class="col-sm-2">Вихідна ціна ГРН</label>
        <div class="col-sm-10 showed-print">${goods.priceOutHryvnya}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">IMEI</label>
        <div class="col-sm-10 showed-print">${goods.imei}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Трек номер</label>
        <div class="col-sm-10 hidden-print">${goods.trackNumber}</div>
    </div>


    <div class="row">
        <label class="col-sm-2">Деталі</label>
        <div class="col-sm-10 hidden-print">${goods.details}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Місце продажу товару</label>
        <div class="col-sm-10 showed-print">${goods.sellPointName}</div>
    </div>

    <div class="row">
        <label class="col-sm-2">Дата приходу товару</label>
        <div class="col-sm-10 showed-print">
            <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${goods.arrivalDate}"/>
        </div>
    </div>

    <c:if test="${goods.isSold()}">

        <div class="row">
            <label class="col-sm-2">Дата продажу товару</label>
            <div class="col-sm-10 showed-print">
                <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${goods.saleDate}"/>
            </div>
        </div>

        <div class="row">
            <label class="col-sm-2">Гарантія</label>
            <div class="col-sm-10 showed-print">${goods.warrantyTime}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Знижка</label>
            <div class="col-sm-10 showed-print">${goods.discount} %</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Ім'я покупця</label>
            <div class="col-sm-10 hidden-print">${goods.sellerName}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">№ телефону покупця</label>
            <div class="col-sm-10 hidden-print">${goods.sellerNumber}</div>
        </div>

    </c:if>


    <div class="row hidden-print">
        <label class="col-sm-2">Штрихкод</label>
        <svg class="barcode"
             jsbarcode-value="${goods.id}"
             jsbarcode-displayValue="false"
             jsbarcode-height="30"
             jsbarcode-textmargin="0"
             jsbarcode-height="80">
        </svg>
    </div>

</div>

<!--Start print data-->

<div class="printable only-print">${goods.name}</div>
<div class="printable only-print">${goods.priceOutHryvnya} грн</div>
<div class="printable only-print">
    <svg class="barcode"
         jsbarcode-value="${goods.id}"
         jsbarcode-displayValue="true"
         jsbarcode-height="40"
         jsbarcode-width="4"
         jsbarcode-textmargin="0">
    </svg>
</div>

<!--End print data-->

<jsp:include page="../fragments/footer.jsp"/>

</body>
</html>