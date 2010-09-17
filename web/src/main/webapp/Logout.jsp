<%-- 
    Document   : Logout
    Created on : Dec 2, 2009, 10:24:23 AM
    Author     : Christopher Lam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Logout</title>
            <LINK REL="stylesheet" TYPE="text/css" MEDIA="all" HREF="css/default.css">
        </head>
        <body>
            <center>
                <h1><h:outputText value="You have logged out!"/></h1>
            <br><br><h:outputText value="What would you like to do?"/>
            <li><h:outputLink value="Login.jsp">Login again</h:outputLink></li>
            <li><h:outputLink value="CustomerList.jsp">Go to Customer Listing</h:outputLink></li>
            </center>
        </body>
    </html>
</f:view>
<%
    session.invalidate();
%>

