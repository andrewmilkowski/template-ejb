<%-- 
    Document   : CustomerList
    Created on : Nov 18, 2009, 1:05:36 PM
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
            <title>Customer Listing</title>
            <LINK REL="stylesheet" TYPE="text/css" MEDIA="all" HREF="css/default.css">
        </head>
        <body >
            <h1><h:outputText value="Customer Listing"/></h1>
            <h:form>
            <h:outputLabel value="Logged in user is: "/><h:outputText value="#{customer.loginUserName}"/>&nbsp;&nbsp;&nbsp;
            <h:outputLink value="Logout.jsp" disabled="#{customer.userNotLogin}">Logout</h:outputLink>
            <h:panelGrid cellspacing="3">
            <h:dataTable value="#{customer.customers}" var="item"
                         border="1" cellspacing="0" cellpadding="1"
                         rowClasses="tab_odd_row,tab_even_row">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="CustomerId"/>
                    </f:facet>
                    <!-- Replace outputText with commandLink here to navigate
                    to the details page -->
                    <h:commandLink action="#{customer.showDetails(item)}"
                                   value="#{item.customerId}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Name"/>
                    </f:facet>
                    <h:outputText value="#{item.name}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="CreditLimit"/>
                    </f:facet>
                    <h:outputText value="#{item.creditLimit}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Discount %"/>
                    </f:facet>
                    <h:outputText value="#{item.discountCode.rate}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="State"/>
                    </f:facet>
                    <h:outputText value="#{item.state}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="City"/>
                    </f:facet>
                    <h:outputText value="#{item.city}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Zip"/>
                    </f:facet>
                    <h:outputText value="#{item.zip}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Phone"/>
                    </f:facet>
                    <h:outputText value="#{item.phone}"/>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Email"/>
                    </f:facet>
                    <h:outputText value="#{item.email}"/>
                </h:column>
            </h:dataTable>
            </h:panelGrid>
            </h:form>
        </body>
    </html>
</f:view>
