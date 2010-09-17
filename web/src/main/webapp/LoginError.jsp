<%-- 
    Document   : LoginError
    Created on : Dec 3, 2009, 11:37:41 AM
    Author     : Christopher Lam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Login Failure</title>
            <LINK REL="stylesheet" TYPE="text/css" MEDIA="all" HREF="css/default.css">
        </head>
        <body>
            <br><center>
            <h1><h:outputText value="Login Failed!"/></h1>
            <br><br>
            <h:outputLink value="Login.jsp">Please try again</h:outputLink>
            </center>
        </body>
    </html>
</f:view>
