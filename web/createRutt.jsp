<%-- 
    Document   : createRutt
    Created on : 22-Feb-2016, 10:59:17
    Author     : Harry
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="intPostCreateRutt" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Rutt WHERE
    id = ? <sql:param value="${param.createNewRutt}"/>;
</sql:query>
<c:set var="intPostCreateRuttDetails" value="${intPostCreateRutt.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page - createRutt</title>
    </head>
    <body>
        <form name="testCreateRutt"
              action="intPostUser.jsp"
              method="POST">
            <input type="hidden" name="login" value="${intPostUserDetails.login}" />
            <input type="hidden" name="password" value="${intPostUserDetails.epw}" />
            <table border="0">
                <tr>
                    <td>Enter New Rutt ID(integer):</td>
                    <td><input type="integer" name="createNewRutt" />
                </tr>
                <tr>
                    <td>Enter New Rutt Description:</td>
                    <td><input type="text" name="newRuttDescription" />
                </tr>
                <tr>
                    <td>Enter New Rutt Namn(unique):</td>
                    <td><input type="text" name="newRuttNamn" />
                </tr>
                <tr>
                    <td><input type="submit" value="Create Rutt"/></td>
                </tr>
        </form>
        <c:choose>
            <c:when test="${not empty param.createNewRutt &&
                            not empty param.newRuttDescription &&
                            not empty param.newRuttNamn &&
                            param.createNewRutt != intPostCreateRuttDetails.id}">
                <sql:update dataSource="jdbc/IFPWAFCAD" var="createNewRuttLogg">
                    INSERT INTO Logg (event,datum,whoWhat,byWho) VALUES('New Rutt Created',CURRENT_TIMESTAMP,?,?);
                    <sql:param value="${param.createNewRutt}"/>
                    <sql:param value="${param.login}"/>
                </sql:update>
                <sql:update dataSource="jdbc/IFPWAFCAD" var="createNewRuttSql">
                    INSERT INTO Rutt VALUES(?,?,?);
                    <sql:param value="${param.createNewRutt}"/>
                    <sql:param value="${param.newRuttDescription}"/>
                    <sql:param value="${param.newRuttNamn}"/>
                </sql:update>
            </c:when>
            <c:otherwise>
                <h1>Create Rutt</h1>
            </c:otherwise>
        </c:choose>
    </body>
</html>
