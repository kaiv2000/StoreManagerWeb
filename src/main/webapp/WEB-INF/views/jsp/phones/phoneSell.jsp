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

    <h1>Продаж товару</h1>

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
        <label class="col-sm-2">Дата приходу товару</label>
        <div class="col-sm-10 hidden-print">
            <fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${phone.arrivalDate}"/>
        </div>
    </div>

    <div class="row showed-print">
        <label class="col-sm-2">Штрихкод</label>
        <svg class="barcode"
             jsbarcode-value="${phone.id}"
             jsbarcode-displayValue="false"
             jsbarcode-height="30"
             jsbarcode-textmargin="0"
             jsbarcode-height="80">
        </svg>
    </div>

    <spring:url value="/cell-product-done" var="phoneCellUrl"/>

    <form:form class="form-horizontal" method="post" modelAttribute="phone" action="${phoneCellUrl}">

        <form:hidden path="id"/>
        <form:hidden path="name"/>
        <form:hidden path="priceIn"/>
        <form:hidden path="priceOut"/>
        <form:hidden path="priceOutHryvnya"/>
        <form:hidden path="imei"/>
        <form:hidden path="trackNumber"/>
        <form:hidden path="details"/>
        <form:hidden path="arrivalDate"/>

        <spring:bind path="warrantyTime">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Гарантія товару</label>
                <div class="col-sm-10">
                    <form:select path="warrantyTime" items="${availableWarranty}" class="form-control"/>
                    <form:errors path="warrantyTime" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="discount">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Знижка</label>
                <div class="col-sm-10">
                    <form:input min="0" max="90" path="discount" class="form-control" id="discount" type="number"
                                title="Знижка товару - тільки цифри"
                                placeholder="Введіть знижку на товар. На відсоток від цієї цифри зменшиться вихідна ціна товару"/>
                    <form:errors path="discount" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="sellerName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Ім'я покупця</label>
                <div class="col-sm-10">
                    <form:input path="sellerName" required="true" class="form-control" id="sellerName" type="text"
                                title="Ім'я покупця - тільки текст" placeholder="Введіть Ім'я покупця товару"/>
                    <form:errors path="sellerName" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="sellerNumber">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">№ телефону покупця</label>
                <div class="col-sm-10">
                    <form:input path="sellerNumber" required="true" class="form-control" id="sellerNumber" type="text"
                                title="№ телефону покупця - тільки текст" placeholder="Введіть № телефону покупця"/>
                    <form:errors path="sellerNumber" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="sellPointName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Місце продажу товару</label>
                <div class="col-sm-10">
                    <form:select path="sellPointName" items="${availableCellPoints}" class="form-control"/>
                    <form:errors path="sellPointName" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="inDebt">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Продаж в кредит</label>

                <div class="col-sm-10">

                    <label class="switch">
                        <input type="checkbox"
                               onchange="document.getElementById('priceFirstPart').disabled = !this.checked;
                                     document.getElementById('debtDetails').disabled = !this.checked;"/>
                        <div class="slider round"></div>
                    </label>

                </div>

            </div>
        </spring:bind>

        <spring:bind path="priceOutFirstPart">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Перший внесок ГРН</label>
                <div class="col-sm-10">
                    <form:input type="number" step="0.01" min="0" max="9999" path="priceOutFirstPart" required="true"
                                class="form-control"
                                id="priceFirstPart"
                                title="Перший внесок - тільки цифри"
                                placeholder="Введіть суму першого внеску товару в гривнях (при продажі в кредит)"
                                disabled="true"/>
                    <form:errors path="priceOutFirstPart" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="debtDetails">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Деталі кредиту</label>
                <div class="col-sm-10">
                    <form:input path="debtDetails" class="form-control" id="debtDetails" type="text" required="true"
                                title="Деталі кредиту - тільки текст"
                                placeholder="Введіть вартість і назву аксесуарів, якщо вони взяті в кредит"
                                disabled="true"/>
                    <form:errors path="debtDetails" class="control-label"/>
                </div>
            </div>
        </spring:bind>


        <button class="btn btn-success" type="submit">Продаж товару
            <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
        </button>

    </form:form>

</div>

<jsp:include page="../fragments/footer.jsp"/>


</body>
</html>