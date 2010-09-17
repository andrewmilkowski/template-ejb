<%-- 
    Document   : CustomerDetails
    Created on : Nov 25, 2009, 3:52:24 PM
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
            <title>Customer Details</title>
            <LINK REL="stylesheet" TYPE="text/css" MEDIA="all" HREF="css/default.css">
        </head>
        <body>
            <h1><h:outputText value="Customer Details"/></h1>
        <h:form>
            <h:outputLabel value="Logged in user is: "/><h:outputText value="#{customer.loginUserName}"/>&nbsp;&nbsp;&nbsp;
            <h:outputLink value="Logout.jsp" disabled="#{customer.userNotLogin}">Logout</h:outputLink>
            <h:panelGrid columns="2" cellspacing="3" cellpadding="3" bgcolor="#eff5fa">
                <h:outputLabel value="Customer ID:"/>
                <h:inputText id="customerId" value="#{customer.details.customerId}" disabled="true"/>
                <h:outputLabel value="Customer Name:"/>
                <h:inputText id="customerName" value="#{customer.details.name}"/>
                <h:outputLabel value="Credit Limit:"/>
                <h:inputText id="creditLimit" value="#{customer.details.creditLimit}"/>
                <h:outputLabel value="Discount Code"/>
                <h:selectOneMenu id="discountCode" value="#{customer.details.discount}">
                    <f:selectItems value="#{customer.discountCodes}"/>
                </h:selectOneMenu>
                <h:outputLabel value="Email:"/>
                <h:inputText id="email" value="#{customer.details.email}"/>
                <h:outputLabel value="Phone:"/>
                <h:inputText id="phone" value="#{customer.details.phone}"/>
                <h:outputLabel value="Fax:"/>
                <h:inputText id="fax" value="#{customer.details.fax}"/>
                <h:outputLabel value="Address (Line 1):"/>
                <h:inputText id="address1" value="#{customer.details.addressline1}"/>
                <h:outputLabel value="Address (Line 2):"/>
                <h:inputText id="address2" value="#{customer.details.addressline2}"/>
                <h:outputLabel value="State:"/>
                <h:inputText id="state" value="#{customer.details.state}"/>
                <h:outputLabel value="City:"/>
                <h:inputText id="city" value="#{customer.details.city}"/>
                <h:outputLabel value="Zip:"/>
                <h:inputText id="zip" value="#{customer.details.zip}"/>
            </h:panelGrid>
            <br>
            <h:outputLink value="CustomerList.jsp">&lt;&lt;Back</h:outputLink>&nbsp;&nbsp;
            <h:commandButton id="update" value="Update" action="#{customer.update}"/>
        </h:form>
        </body>
    </html>
</f:view>
