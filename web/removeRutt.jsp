<%-- 
    Document   : removeRutt
    Created on : 24-Feb-2016, 11:01:36
    Author     : Harry
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="intPostRemoveRutt" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Rutt WHERE
    id = ? <sql:param value="${param.idRemoveRutt}"/>;
</sql:query>
<c:set var="intPostRuttRemoveDetails" value="${intPostRemoveRutt.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page - RemoveRutt</title>
    </head>
    <body>
        <form name="testRemoveRutt"
              action="intPostUser.jsp"
              method="POST">
            <input type="hidden" name="login" value="${intPostUserDetails.login}" />
            <input type="hidden" name="password" value="${intPostUserDetails.epw}" />
            <table border="0">
                <tr>
                    <td>Enter Rutt(id):</td>
                    <td><input type="integer" name="idRemoveRutt" />
                </tr>
                <tr>
                    <td><input type="submit" value="Remove Rutt"/></td>
                </tr>
        </form>
        <c:choose>
            <c:when test="${not empty param.idRemoveRutt &&
                            param.idRemoveRutt == intPostRuttRemoveDetails.id}">
                <sql:update dataSource="jdbc/IFPWAFCAD" var="RemoveUserLogg">
                    INSERT INTO Logg (event,datum,whoWhat,byWho) VALUES('Rutt Removed',CURRENT_TIMESTAMP,?,?);
                    <sql:param value="${param.idRemoveRutt}"/>
                    <sql:param value="${param.login}"/>
                </sql:update>
                <sql:update dataSource="jdbc/IFPWAFCAD" var="RemoveUser">
                    DELETE FROM Rutt WHERE id = ? <sql:param value="${param.idRemoveRutt}"/>
                </sql:update>
            </c:when>
            <c:otherwise>
                <h1>Remove Rutt<br></h1>
                </c:otherwise>
            </c:choose>
    </body>
</html>
