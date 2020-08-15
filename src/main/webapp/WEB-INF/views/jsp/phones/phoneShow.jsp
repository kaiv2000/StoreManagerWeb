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

<spring:url value="/cell-product-${goods.id}?productType=payDeptPhone" var="payDept"/>
<spring:url value="/cell-product-${goods.id}?productType=closeDeptPhone" var="closeDept"/>

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
        <ul class="nav nav-pills" role="tablist">
            <li role="presentation" class="active">Детальний опис товару</li>
            <li role="presentation"><span class="badge">Курс USD: ${usdRate}</span></li>
        </ul>
    </h1>

    <br/>

    <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">

        <c:if test="${not goods.isSold()}">

            <button class="btn btn-primary" onclick="location.href='${updateUrl}'">Редагувати товар
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            </button>


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
                Видалити товар
                <span class="glyphicon glyphicon-trash"/>
            </button>


        </c:if>
    </sec:authorize>


    <c:if test="${goods.isInDebt()}">

        <button class="btn btn-success" onclick="location.href='${payDept}'">Оплата кредиту
            <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
        </button>

        <button class="btn btn-danger"
                data-toggle="confirmation"
                data-btn-ok-label="ТАК"
                data-btn-ok-icon="glyphicon glyphicon-share-alt"
                data-btn-ok-class="btn-success"
                data-btn-cancel-label="НІ"
                data-btn-cancel-icon="glyphicon glyphicon-ban-circle"
                data-btn-cancel-class="btn-danger"
                data-title="Точно закрити кредит?"
                data-content="Цю операцію повернути назад не можливо"
                value="${closeDept}"
        >
            Закриття кредиту
            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
        </button>


    </c:if>

    <c:choose>

        <c:when test="${not goods.isSold()}">

            <button class="btn btn-success" onclick="location.href='${cellUrl}'">Продаж товару
                <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
            </button>

        </c:when>

        <c:otherwise>

            <button class="btn btn-success" onclick="location.href='${returnUrl}'">Повернення товару
                <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
            </button>

        </c:otherwise>

    </c:choose>

    <script>
        function printLabel() {
            window.print();
        };
    </script>

    <button class="btn btn-info" onClick="printLabel()">Друк чека
        <span class="glyphicon glyphicon-print" aria-hidden="true"></span>
    </button>

    <button class="btn btn-info" onClick="location.href='${printLabel}'">Друк лейби
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
        <div class="col-sm-10 showed-print">${goods.priceOut}
        </div>
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

    <c:if test="${goods.isInDebt()}">

        <div class="row">
            <label class="col-sm-2">Кредитний внесок ГРН</label>
            <div class="col-sm-10 showed-print">${goods.priceOutFirstPart}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Залишок до оплати ГРН</label>
            <div class="col-sm-10 showed-print">${goods.priceOutRemainder}</div>
        </div>

        <div class="row">
            <label class="col-sm-2">Деталі кредиту</label>
            <div class="col-sm-10 showed-print">${goods.debtDetails}</div>
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

<div class="printable only-print">=========================</div>
<div class="printable only-print">Магазин StartApp</div>
<div class="printable only-print">${goods.sellPointName}</div>

<c:choose>

    <c:when test="${goods.sellPointName == 'м.Тячів'}">
        <div class="printable only-print">вул.Незалежності 42</div>
        <div class="printable only-print">тел.: +38-096-213-85-80</div>
    </c:when>

    <c:when test="${goods.sellPointName  == 'м.Рахів'}">
        <div class="printable only-print">вул.Миру 31</div>
        <div class="printable only-print">тел.: +38-097-452-89-58</div>
    </c:when>

    <c:when test="${goods.sellPointName  == 'м.Іршава'}">
        <div class="printable only-print">площа Народна 4</div>
        <div class="printable only-print">тел.: +38-068-218-04-91</div>
    </c:when>

</c:choose>

<div class="printable only-print">**************************************</div>

<div class="printable only-print">Товар:</div>
<div class="printable only-print">${goods.name}</div>

<div class="row only-print">
    <forprint>IMEI:</forprint>
    <forprint text-right>${goods.imei}</forprint>
</div>

<div class="printable only-print">Гарантія: ${goods.warrantyTime}</div>

<div class="row only-print">
    <forprint>Ціна:</forprint>
    <forprint text-right>${goods.priceOutHryvnya} грн</forprint>
</div>

<c:if test="${not empty goods.discount}">
    <div class="printable only-print">Знижка: ${goods.discount} %</div>
</c:if>

<c:if test="${goods.isInDebt()}">

    <div class="printable only-print">*** В КРЕДИТ ***</div>

    <div class="row only-print">
        <forprint>Оплачено: </forprint>
        <forprint text-right>${goods.priceOutFirstPart} грн</forprint>
    </div>

    <div class="row only-print">
        <forprint>Залишок до оплати:</forprint>
        <forprint text-right>${goods.priceOutRemainder} грн</forprint>
    </div>

    <div class="printable only-print">Деталі кредиту:</div>
    <div class="printable only-print">${goods.debtDetails}</div>

</c:if>


<div class="printable only-print">**************************************</div>
<div class="printable only-print">Дата:
    <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${goods.saleDate}"/>
</div>
<div class="printable only-print">
    <svg class="barcode"
         jsbarcode-value="${goods.id}"
         jsbarcode-displayValue="true"
         jsbarcode-height="40"
         jsbarcode-width="4"
         jsbarcode-textmargin="0">
    </svg>
</div>
<div class="printable only-print">**************************************</div>
<div class="printable only-print">ДЯКУЄМО ЗА ПОКУПКУ</div>
<div class="printable only-print">=========================</div>

<!--End print data-->

<jsp:include page="../fragments/footer.jsp"/>

</body>
</html>