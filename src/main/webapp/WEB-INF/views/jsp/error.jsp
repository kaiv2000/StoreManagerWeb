<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>


<spring:url value="/" var="urlHome"/>


<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.3">

    <title>StartApp Apple Store</title>

    <spring:url value="/resources/favicon.ico" var="siteIcon"/>

    <link rel="icon" type="image/x-icon" href="${siteIcon}"/>

    <spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss"/>
    <spring:url value="/resources/core/js/jquery-3.2.1.min.js" var="JqueryJs"/>
    <spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs"/>
    <spring:url value="/resources/core/js/bootstrap-confirmation.min.js" var="bootstrapConfirmJs"/>
    <spring:url value="/resources/core/js/JsBarcode.all.min.js" var="jquerybarcode"/>

    <link href="${bootstrapCss}" rel="stylesheet"/>

    <script src="${JqueryJs}"></script>
    <script src="${bootstrapJs}"></script>
    <script src="${bootstrapConfirmJs}"></script>

    <script src="${jquerybarcode}"></script>


    <script>

        $(document).ready(
            function () {

                $('[data-toggle=confirmation]').confirmation({
                    rootSelector: '[data-toggle=confirmation]',
                    onConfirm: function () {
                        location.href = $(this).val();
                    }
                });

                JsBarcode(".barcode").init();

            });

    </script>

    <style type="text/css">

        @page {
            margin: 0;
        }

        @media screen {
            /*--This is for Screen--*/
            body {
                padding-bottom: 60px;
                padding-top: 60px;
            }

            .only-print {
                display: none;
            }

            .not-visible {
                display: none;
            }
        }

        @media print /*--This is for Printing--*/ {
            nav, .col-sm-2, .col-sm-10, label, .btn, href, a, ul, li, btn-group, dropdown-menu, header, header nav, footer, h1, title, .alert {
                display: none;
            }

            a[href]:after {
                content: " (" attr(href) ")";
            }

            .showed-print {
                font-weight: bold;
                text-align: center;
                font-size: 180%;
            }

            .only-print {
                font-weight: bold;
                text-align: center;
                font-size: 180%;
            }

            .hidden-print {
                display: none;
            }
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {display:none;}

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }


        td {
            font-size: 18px;
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

</head>

<body>

<div class="container">


    <div class="alert alert-danger">
        <strong>Сталася помилка... Мабуть такої сторінки не існує.</strong>
    </div>

    <h2>Перейти на <a href="<c:url value="${urlHome}" />">головну сторінку</a></h2>

    <p>${exception.message}</p>
    ${exception.message}.
    <c:forEach items="${exception.stackTrace}" var="stackTrace">
        ${stackTrace}
    </c:forEach>

</div>

<jsp:include page="../jsp/fragments/footer.jsp"/>

</body>
</html>