<%-- 
    Document   : createStopp
    Created on : 16-Feb-2016, 11:21:13
    Author     : Harry
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="intPostCreateStopp" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Stopp WHERE id = ? <sql:param value="${param.newStoppId}"/>;
</sql:query>
<c:set var="intPostCreateStoppDetails" value="${intPostCreateStopp.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="testCreateStopp"
              action="intPostUser.jsp"
              method="POST">
            <input type="hidden" name="login" value="${intPostUserDetails.login}" />
            <input type="hidden" name="password" value="${intPostUserDetails.epw}" />
            <table border="0">
                <tr>
                    <td>Enter Id:</td>
                    <td><input type="text" name="newStoppId" />
                </tr>
                <tr>
                    <td>Enter adress:</td>
                    <td><input type="text" name="newStoppAddress" />
                </tr>
                <tr>
                    <td>Enter beskrivning:</td>
                    <td><input type="text" name="newStoppBeskrivning" />
                </tr>
                <tr>
                    <td>Enter koordinat:</td>
                    <td><input type="text" name="newStoppKoordinat" />
                </tr>
                <tr>
                    <td>Enter Rutt:</td>
                    <td><input type="text" name="containingRutt" />
                </tr>
                <tr>
                    <td><input type="submit" value="Create New Postbox"/></td>
                </tr>
        </form>
        <c:choose>
            <c:when test="${not empty param.newStoppId &&
                            not empty param.newStoppAddress &&
                            not empty param.newStoppBeskrivning &&
                            not empty param.newStoppKoordinat &&
                            param.newStoppId != intPostCreateStoppDetails.id}">
                <sql:update dataSource="jdbc/IFPWAFCAD" var="CreateStopp">
                    INSERT INTO Stopp VALUES(?,?,?,?,?,0,'empty');
                    <sql:param value="${param.newStoppId}" />
                    <sql:param value="${param.newStoppAddress}" />
                    <sql:param value="${param.newStoppBeskrivning}" />
                    <sql:param value="${param.newStoppKoordinat}" />
                    <sql:param value="${param.newStoppKoordinat}" />
                </sql:update>
                <sql:update dataSource="jdbc/IFPWAFCAD" var="CreateStoppLogg">
                    INSERT INTO Logg (event,datum,whoWhat,byWho) VALUES('New Stopp Created',CURRENT_TIMESTAMP,?,?);
                    <sql:param value="${param.newStoppId}" />
                    <sql:param value="${param.login}" />
                </sql:update>
                <c:choose>
                    <c:when test="${not empty param.containingRutt}">
                        <sql:update dataSource="jdbc/IFPWAFCAD" var="addStopp">
                            INSERT INTO HarStopp VALUES(?,?);
                            <sql:param value="${param.containingRutt}" />
                            <sql:param value="${param.newStoppId}" />
                        </sql:update>
                    </c:when>
                </c:choose>
            </c:when>
            <c:otherwise>
                <h1><br>Create New Postbox<br></h1>
                </c:otherwise>
            </c:choose>
    </body>
</html>
