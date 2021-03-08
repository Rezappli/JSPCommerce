<%@ page import="java.util.Iterator" %>
<%@ page import="commerce.gestion.Panier" %>
<%@ page import="commerce.catalogue.service.CatalogueManager" %><%--
  Created by IntelliJ IDEA.
  User: mathi
  Date: 08/03/2021
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Site web marchand</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="./css/style.css" type="text/css" />
    <link rel="stylesheet" href="./css/themes/storefont/assets/sass/woocommerce/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" id="storefront-woocommerce-style-css" href="./css/themes/storefont/assets/sass/woocommerce/woocommerce.css" type="text/css" />
    <link rel="stylesheet" href="./js/jplayer-2.9.2/skin/blue.monday/css/jplayer.blue.monday.css" type="text/css" />
    <script type="text/javascript" src="./js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="./js/jplayer-2.9.2/jplayer/jquery.jplayer.min.js"></script>
    <script type="text/javascript" src="./js/jplayer-2.9.2/add-on/jplayer.playlist.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <style id='storefront-style-inline-css' type='text/css'>
        table.cart td.product-remove,
        table.cart td.actions {
            border-top-color: #ffffff;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-nav navbar-collapse" id="navbarText">

            <ul class="navbar-collapse me-auto mb-2 mb-lg-0">
                <<li class="nav-item">
                    <img src="images/ecommerce.logo_.png" alt="<%=response.encodeURL("./afficheRecherche.jsp")%>" width="50" >
                </li>

            </ul>
        </div>
    </div>
</nav>
<div id="wrapper">
    <div id="inner-wrapper">
        <header id="header" class="col-full">
            <div id="logo">
            </div>
        </header>
