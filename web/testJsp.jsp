<%-- 
    Document   : testJsp
    Created on : 04-Feb-2016, 21:35:13
    Author     : Harry
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="intPostNewUser" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM AllUsers WHERE login = ? <sql:param value="${param.loginNewUser}"/>;
</sql:query>
<c:set var="intPostNewUserDetails" value="${intPostNewUser.rows[0]}"/>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="testNewUser"
              action="intPostUser.jsp"
              method="POST">
            <input type="hidden" name="login" value="${intPostUserDetails.login}" />
            <input type="hidden" name="password" value="${intPostUserDetails.epw}" />
            <table border="0">
                <tr>
                    <td>Enter login:</td>
                    <td><input type="text" name="loginNewUser" />
                </tr>
                <tr>
                    <td>Enter Name:</td>
                    <td><input type="text" name="namnNewUser" />
                </tr>
                <tr>
                    <td>Enter Password:</td>
                    <td><input type="text" name="epwNewUser" />
                </tr>
                <tr>
                    <td><input type="submit" value="Create New User"/></td>
                </tr>
        </form>
        <c:choose>
            <c:when test="${not empty param.loginNewUser &&
                            not empty param.namnNewUser &&
                            not empty param.epwNewUser &&
                            param.loginNewUser != intPostNewUserDetails.login}">
                <sql:update dataSource="jdbc/IFPWAFCAD" var="newUser">
                    INSERT INTO Users VALUES(?,?,?);
                    <sql:param value="${param.loginNewUser}" />
                    <sql:param value="${param.namnNewUser}" />
                    <sql:param value="${param.epwNewUser}" />
                </sql:update>
                <sql:update dataSource="jdbc/IFPWAFCAD" var="loggNewUser">
                    INSERT INTO Logg (event,datum,whoWhat,byWho) VALUES('New User',CURRENT_TIMESTAMP, ?, ? );
                    <sql:param value="${param.loginNewUser}" />
                    <sql:param value="${intPostUserDetails.login}" />
                </sql:update>
                <sql:query var="intPost" dataSource="jdbc/IFPWAFCAD">
                    SELECT login, namn, UserAuthority FROM AllUsers
                </sql:query>
                <h1><br>New user created!<br></h1>
                </c:when>
                <c:otherwise>
                <h1>Create New User</h1>
            </c:otherwise>
        </c:choose>
    </body>
</html>
