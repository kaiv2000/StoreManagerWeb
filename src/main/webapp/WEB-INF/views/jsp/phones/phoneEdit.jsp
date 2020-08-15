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

    <c:choose>
        <c:when test="${goodsForm['new']}">
            <h1>Додавання телефону</h1>
        </c:when>
        <c:otherwise>
            <h1>Редагування телефону</h1>
        </c:otherwise>
    </c:choose>
    <br/>

    <spring:url value="/savePhone" var="productActionUrl"/>

    <form:form class="form-horizontal" method="post" modelAttribute="goodsForm" action="${productActionUrl}">

        <form:hidden path="id"/>
        <form:hidden path="arrivalDate"/>

        <spring:bind path="name">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Назва товару</label>
                <div class="col-sm-10">
                    <form:input path="name" maxlength="100" type="text" class="form-control" title="Назва товару - тільки текст"
                                id="name" placeholder="Введіть назву товару"/>
                    <form:errors path="name" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="priceIn">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Прихідна ціна</label>
                <div class="col-sm-10">
                    <form:input type="number" step="0.01" min="0" max="9999" path="priceIn" class="form-control" id="priceIn"
                                title="Ціна товару - тільки цифри" placeholder="Введіть прихідну ціну товару"/>
                    <form:errors path="priceIn" class="control-label"/>
                </div>
            </div>
        </spring:bind>


        <spring:bind path="priceOut">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Вихідна ціна</label>
                <div class="col-sm-10">
                    <form:input min="0" max="9999" path="priceOut" class="form-control" id="priceOut" type="number"
                                title="Ціна товару - тільки цифри" placeholder="Введіть вихідну ціну товару"/>
                    <form:errors path="priceOut" class="control-label"/>
                </div>
            </div>
        </spring:bind>


        <spring:bind path="imei">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">IMEI</label>
                <div class="col-sm-10">
                    <form:input maxlength="50" path="imei" class="form-control" id="imei" type="text"
                                title="IMEI товару - тільки текст" placeholder="Введіть IMEI товару"/>
                    <form:errors path="imei" class="control-label"/>
                </div>
            </div>
        </spring:bind>


        <spring:bind path="trackNumber">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Трек номер</label>
                <div class="col-sm-10">
                    <form:input maxlength="50" path="trackNumber" class="form-control" id="trackNumber" type="text"
                                title="Трек номер товару - тільки текст" placeholder="Введіть трек номер товару"/>
                    <form:errors path="trackNumber" class="control-label"/>
                </div>
            </div>
        </spring:bind>


        <spring:bind path="details">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <label class="col-sm-2 control-label">Деталі</label>
                <div class="col-sm-10">
                    <form:input maxlength="150" path="details" class="form-control" id="details" type="text"
                                title="Деталі товару - тільки текст" placeholder="Введіть деталі товару"/>
                    <form:errors path="details" class="control-label"/>
                </div>
            </div>
        </spring:bind>

        <spring:bind path="sellPointName">
            <div class="form-group ${status.error ? 'has-error' : ''}">

                <label class="col-sm-2 control-label">Місце продажі</label>

                <div class="col-sm-10">
                    <form:select path="sellPointName"  items="${availableCellPoints}" class="form-control"/>
                    <form:errors path="sellPointName" class="control-label"/>
                </div>

            </div>
        </spring:bind>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${goodsForm['new']}">
                        <button type="submit" class="btn-lg btn-primary">Додати новий товар</button>
                    </c:when>
                    <c:otherwise>
                        <button type="submit" class="btn-lg btn-primary">Зберегти інформацію про товар</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>

</div>

<jsp:include page="../fragments/footer.jsp"/>


</body>
</html>