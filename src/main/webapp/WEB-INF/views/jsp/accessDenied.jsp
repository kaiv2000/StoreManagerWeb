<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Доступ заборонено</title>

    <spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss"/>
    <spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs"/>

    <link href="${bootstrapCss}" rel="stylesheet"/>
    <script src="${bootstrapJs}"></script>

    <style>
        body {
            padding-top: 80px;
            padding-bottom: 60px;
        }

        div {
            font-size: 20px;
        }

        .navbar-default {
            background-color: #4178f1;
            border-color: #6aaff7;
        }

        .navbar-default .navbar-brand {
            color: #ecf0f1;
        }

        .navbar-default .navbar-brand:hover,
        .navbar-default .navbar-brand:focus {
            color: #ffffff;
        }

        .navbar-default .navbar-text {
            color: #ecf0f1;
        }

        .navbar-default .navbar-nav > li > a {
            color: #ecf0f1;
        }

        .navbar-default .navbar-nav > li > a:hover,
        .navbar-default .navbar-nav > li > a:focus {
            color: #ffffff;
        }

        .navbar-default .navbar-nav > .active > a,
        .navbar-default .navbar-nav > .active > a:hover,
        .navbar-default .navbar-nav > .active > a:focus {
            color: #ffffff;
            background-color: #6aaff7;
        }

        .navbar-default .navbar-nav > .open > a,
        .navbar-default .navbar-nav > .open > a:hover,
        .navbar-default .navbar-nav > .open > a:focus {
            color: #ffffff;
            background-color: #6aaff7;
        }

        .navbar-default .navbar-toggle {
            border-color: #6aaff7;
        }

        .navbar-default .navbar-toggle:hover,
        .navbar-default .navbar-toggle:focus {
            background-color: #6aaff7;
        }

        .navbar-default .navbar-toggle .icon-bar {
            background-color: #ecf0f1;
        }

        .navbar-default .navbar-collapse,
        .navbar-default .navbar-form {
            border-color: #ecf0f1;
        }

        .navbar-default .navbar-link {
            color: #ecf0f1;
        }

        .navbar-default .navbar-link:hover {
            color: #ffffff;
        }

        @media (max-width: 767px) {
            .navbar-default .navbar-nav .open .dropdown-menu > li > a {
                color: #ecf0f1;
            }

            .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover,
            .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
                color: #ffffff;
            }

            .navbar-default .navbar-nav .open .dropdown-menu > .active > a,
            .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover,
            .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
                color: #ffffff;
                background-color: #6aaff7;
            }
        }
    </style>

    <spring:url value="/" var="urlHome"/>
    <spring:url value="/logout" var="logOut"/>


    <nav class="navbar navbar-default navbar-fixed-top">

        <div class="container">


            <div id="navbar">
                <ul class="nav navbar-nav navbar-right">

                    <li>
                        <table>
                            <tr>
                                <td>
                                    <span class="label label-info" style="font-size: 10px">${loggedinuser}</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a style="color: white; font-size: 13px;" href="${logOut}"><span
                                            class="glyphicon glyphicon-log-out"></span>Вийти</a>
                                </td>
                            </tr>
                        </table>
                    </li>

                </ul>
            </div>

        </div>

        </div>
    </nav>

</head>

<body>

<div class="container">

    <div class="alert alert-danger">
        <strong>${loggedinuser}</strong>, у вас немає доступу до цієї сторінки.
    </div>

    <h2>Перейти на <a href="<c:url value="${urlHome}" />">головну сторінку</a></h2>

</div>

<jsp:include page="fragments/footer.jsp"/>


</body>
</html>