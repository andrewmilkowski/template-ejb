<%-- 
    Document   : Login
    Created on : Dec 3, 2009, 11:37:28 AM
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
            <title>Login</title>
            <LINK REL="stylesheet" TYPE="text/css" MEDIA="all" HREF="css/default.css">
        </head>
        <body>
            <center><br><br><br>
            <h2><h:outputText value="Please Login"/></h2>
            <form action="j_security_check">
                <h:panelGrid columns="2" bgcolor="#eff5fa" cellspacing="5" frame="box">
                <h:outputLabel value="User ID:"/>
                <h:inputText id="j_username" tabindex="1" />
                <h:outputLabel value="Password:"/>
                <h:inputSecret id="j_password"/>
                <h:outputLabel value=""/>
                <h:commandButton id="login" value="Login"/>
            </h:panelGrid>
            </form>
            </center>
        </body>
    </html>
</f:view>
<%
    session = request.getSession(true); //Force to create a new session
%>
