<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Вхід</title>

    <spring:url value="/resources/favicon.ico" var="siteIcon"/>

    <link rel="icon" type="image/x-icon"href="${siteIcon}"/>

    <spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss"/>
    <spring:url value="/resources/core/css/loginPage.css" var="loginPageCss"/>

    <link href="${bootstrapCss}" rel="stylesheet"/>
    <link href="${loginPageCss}" rel="stylesheet"/>


</head>

<body>
<div id="mainWrapper">
    <div class="login-container">

        <div class="login-card">

            <div class="login-form">

                <c:url var="loginUrl" value="/login" />
                <form action="${loginUrl}" method="post" class="form-horizontal">

                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger">
                            <p>Невірний логін або пароль.</p>
                        </div>
                    </c:if>
                    <c:if test="${param.logout != null}">
                        <div class="alert alert-success">
                            <p>Ви успішно вийшли із системи.</p>
                        </div>
                    </c:if>

                    <h2 align="center">Введіть логін і пароль</h2>

                    <br></br>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="username" type="text" class="form-control" name="ssoId" placeholder="Введіть ваш логін">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" type="password" class="form-control" name="password" placeholder="Введіть ваш пароль">
                    </div>


                    <div class="input-group">
                        <div class="checkbox">
                            <label>
                                <input id="rememberme" type="checkbox" name="remember-me" value="1"> Запам'ятати мене
                            </label>
                        </div>
                    </div>


                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />

                    <div class="form-actions">
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Ввійти">
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>