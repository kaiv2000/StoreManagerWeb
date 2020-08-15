<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

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

<spring:url value="/" var="urlHome"/>
<spring:url value="/product/add?productType=CellPhones" var="urlAddPhone"/>
<spring:url value="/product/add?productType=Accessories" var="urlAddAccessories"/>
<spring:url value="/product/add?productType=Parts" var="urlAddSpares"/>

<spring:url value="/userslist" var="usersList"/>
<spring:url value="/logout" var="logOut"/>


<spring:url value="/active?productType=CellPhones" var="activePhones"/>

<spring:url value="/active?productType=CellPhonesTyachiv" var="activePhonesTyachiv"/>
<spring:url value="/active?productType=CellPhonesRakhiv" var="activePhonesRakhiv"/>
<spring:url value="/active?productType=CellPhonesIrshava" var="activePhonesIrshava"/>

<spring:url value="/active?productType=Accessories" var="activeAccessories"/>

<spring:url value="/active?productType=AccessoriesTyachiv" var="activeAccessoriesTyachiv"/>
<spring:url value="/active?productType=AccessoriesRakhiv" var="activeAccessoriesRakhiv"/>
<spring:url value="/active?productType=AccessoriesIrshava" var="activeAccessoriesIrshava"/>

<spring:url value="/active?productType=Parts" var="activeParts"/>

<spring:url value="/active?productType=PartsTyachiv" var="activePartsTyachiv"/>
<spring:url value="/active?productType=PartsRakhiv" var="activePartsRakhiv"/>
<spring:url value="/active?productType=PartsIrshava" var="activePartsIrshava"/>


<spring:url value="/sold?productType=CellPhones" var="soldPhones"/>

<spring:url value="/sold?productType=CellPhonesTyachiv" var="soldPhonesTyachiv"/>
<spring:url value="/sold?productType=CellPhonesRakhiv" var="soldPhonesRakhiv"/>
<spring:url value="/sold?productType=CellPhonesIrshava" var="soldPhonesIrshava"/>

<spring:url value="/sold?productType=Accessories" var="soldAccessories"/>

<spring:url value="/sold?productType=AccessoriesTyachiv" var="soldAccessoriesTyachiv"/>
<spring:url value="/sold?productType=AccessoriesRakhiv" var="soldAccessoriesRakhiv"/>
<spring:url value="/sold?productType=AccessoriesIrshava" var="soldAccessoriesIrshava"/>

<spring:url value="/sold?productType=Parts" var="soldParts"/>

<spring:url value="/sold?productType=PartsTyachiv" var="soldPartsTyachiv"/>
<spring:url value="/sold?productType=PartsRakhiv" var="soldPartsRakhiv"/>
<spring:url value="/sold?productType=PartsIrshava" var="soldPartsIrshava"/>

<spring:url value="/sold?productType=inDebtPhones" var="inDebtPhones"/>

<spring:url value="/searchGoods" var="searchGoodsUrl"/>

<spring:url value="/reports" var="reports"/>

<nav class="navbar navbar-default navbar-fixed-top">

    <div class="container">

        <ul class="nav navbar-nav">

            <a class="navbar-brand" href="${urlHome}"><b>StartApp</b></a>

            <div class="btn-group navbar-btn">

                <div class="btn-group">

                    <a href="${activePhones}" class="btn btn-success" role="button">Телефони
                        <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                    </a>

                    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false">
                        <span class="caret"></span>
                    </button>

                    <ul class="dropdown-menu">

                        <li><a href="${soldPhones}">Продані
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                        </a>
                        </li>

                        <li><a href="${inDebtPhones}">Продані в кредит
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                        </a>
                        </li>

                        <li role="separator" class="divider"></li>
                        <li><a href="${activePhonesTyachiv}">Тячів
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldPhonesTyachiv}">Тячів продані
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
                        </li>

                        <li role="separator" class="divider"></li>

                        <li><a href="${activePhonesRakhiv}">Рахів
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldPhonesRakhiv}">Рахів продані
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
                        </li>

                        <li role="separator" class="divider"></li>

                        <li><a href="${activePhonesIrshava}">Іршава
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldPhonesIrshava}">Іршава продані
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span></a>
                        </li>

                    </ul>

                </div>

                <div class="btn-group">
                    <a href="${activeAccessories}" class="btn btn-info" role="button">Аксесуари
                        <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span>
                    </a>
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">

                        <li><a href="${soldAccessories}">Продані
                            <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span>
                        </a></li>


                        <li role="separator" class="divider"></li>
                        <li><a href="${activeAccessoriesTyachiv}">Тячів
                            <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldAccessoriesTyachiv}">Тячів продані
                            <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span></a>
                        </li>

                        <li role="separator" class="divider"></li>

                        <li><a href="${activeAccessoriesRakhiv}">Рахів
                            <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldAccessoriesRakhiv}">Рахів продані
                            <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span></a>
                        </li>

                        <li role="separator" class="divider"></li>

                        <li><a href="${activeAccessoriesIrshava}">Іршава
                            <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldAccessoriesIrshava}">Іршава продані
                            <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span></a>
                        </li>


                    </ul>
                </div>

                <div class="btn-group">

                    <a href="${activeParts}" class="btn btn-warning " role="button">Запчастини
                        <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                    </a>

                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false">
                        <span class="caret"></span>
                    </button>

                    <ul class="dropdown-menu">
                        <li><a href="${soldParts}">Продані
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                        </a></li>


                        <li role="separator" class="divider"></li>
                        <li><a href="${activePartsTyachiv}">Тячів
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldPartsTyachiv}">Тячів продані
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
                        </li>

                        <li role="separator" class="divider"></li>

                        <li><a href="${activePartsRakhiv}">Рахів
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldPartsRakhiv}">Рахів продані
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
                        </li>

                        <li role="separator" class="divider"></li>

                        <li><a href="${activePartsIrshava}">Іршава
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
                        </li>

                        <li><a href="${soldPartsIrshava}">Іршава продані
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
                        </li>

                    </ul>
                </div>

            </div>

        </ul>

        <form class="navbar-form navbar-left" action="${searchGoodsUrl}">

            <div class="input-group" style="width:120%">

                <input type="text" class="form-control" required="true" placeholder="Введіть назву, imei або ID"
                       name="searchString">

                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>

            </div>

        </form>

        <ul class="nav navbar-nav navbar-right">

            <sec:authorize access="hasRole('ADMINISTRATOR_ACCESS')">

                <li>
                    <a href="${reports}">
                        <b>Звіти</b>
                        <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
                    </a>
                </li>

                <li>
                    <a href="${usersList}">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    </a>
                </li>

            </sec:authorize>

            <li style="border-right:4px solid #4178f1">
                <table>
                    <tr>
                        <td>
                            <span class="label label-info" style="font-size: 10px">${loggedinuser} [${clientIp}]</span>
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

            <li>

                <div class="btn-group navbar-btn">

                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        Додати
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </button>

                    <ul class="dropdown-menu">

                        <li><a href="${urlAddPhone}">Додати телефон
                            <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                        </a>
                        </li>

                        <li><a href="${urlAddAccessories}">Додати аксесуари
                            <span class="glyphicon glyphicon-headphones" aria-hidden="true"></span>
                        </a></li>

                        <li><a href="${urlAddSpares}">Додати запчастини
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                        </a></li>

                    </ul>
                </div>
            </li>

        </ul>
    </div>
</nav>