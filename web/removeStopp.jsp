<%-- 
    Document   : removeStopp
    Created on : 16-Feb-2016, 13:40:36
    Author     : Harry
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="intPostRemoveStopp" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Stopp WHERE
    id = ? <sql:param value="${param.loginRemoveStopp}"/>;
</sql:query>
<c:set var="intPostStoppRemove" value="${intPostRemoveStopp.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="testRemoveStopp"
              action="intPostUser.jsp"
              method="POST">
            <input type="hidden" name="login" value="${intPostUserDetails.login}" />
            <input type="hidden" name="password" value="${intPostUserDetails.epw}" />
            <table border="0">
                <tr>
                    <td>Enter id:</td>
                    <td><input type="text" name="loginRemoveStopp" />
                </tr>
                <tr>
                    <td><input type="submit" value="Remove Stopp"/></td>
                </tr>
        </form>
        <c:choose>
            <c:when test="${not empty param.loginRemoveStopp &&
                            param.loginRemoveStopp == intPostStoppRemove.id}">
                <sql:update dataSource="jdbc/IFPWAFCAD" var="RemoveUserLogg">
                    INSERT INTO Logg (event,datum,whoWhat,byWho) VALUES('Stopp Removed',CURRENT_TIMESTAMP,?,?);
                    <sql:param value="${param.loginRemoveStopp}"/>
                    <sql:param value="${param.login}"/>
                </sql:update>
                <sql:update dataSource="jdbc/IFPWAFCAD" var="RemoveUser">
                    DELETE FROM Stopp WHERE id = ? <sql:param value="${param.loginRemoveStopp}"/>
                </sql:update>
            </c:when>
            <c:otherwise>
                <h1>Remove Stopp<br></h1>
                </c:otherwise>
            </c:choose>
    </body>
</html>
