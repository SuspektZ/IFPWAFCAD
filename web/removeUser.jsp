<%-- 
    Document   : removeUser
    Created on : 09-Feb-2016, 13:20:57
    Author     : Harry
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="intPostRemoveUser" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM AllUsers WHERE
    login = ? <sql:param value="${param.loginRemoveUser}"/>;
</sql:query>
<c:set var="intPostUserRemove" value="${intPostRemoveUser.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Remove</title>
    </head>
    <body>
        <form name="testRemoveUser"
              action="intPostUser.jsp"
              method="POST">
            <input type="hidden" name="login" value="${intPostUserDetails.login}" />
            <input type="hidden" name="password" value="${intPostUserDetails.epw}" />
            <table border="0">
                <tr>
                    <td>Enter login:</td>
                    <td><input type="text" name="loginRemoveUser" />
                </tr>
                <tr>
                    <td><input type="submit" value="Remove User"/></td>
                </tr>
        </form>
        <c:choose>
            <c:when test="${intPostUserRemove.userAuthority == 'Admin'}" >
            <h1><br>Cannot delete Admin!<br></h1>
            </c:when>
            <c:when test="${not empty intPostUserRemove.login &&
                            intPostUserRemove.userAuthority == 'User'}" >
                <sql:update dataSource="jdbc/IFPWAFCAD" var="RemoveUserLogg">
                    INSERT INTO Logg (event,datum,whoWhat,byWho) VALUES('User Removed',CURRENT_TIMESTAMP,?,?);
                    <sql:param value="${intPostUserRemove.login}"/>
                    <sql:param value="${param.login}"/>
                </sql:update>
                <sql:update dataSource="jdbc/IFPWAFCAD" var="RemoveUser">
                    DELETE FROM Users WHERE login = ? <sql:param value="${intPostUserRemove.login}"/>
                </sql:update>
                    <h1><br>User Dismembered!<br></h1>
                <sql:query var="intPost" dataSource="jdbc/IFPWAFCAD">
                    SELECT login, namn, UserAuthority FROM AllUsers
                </sql:query>
            </c:when>
                <c:otherwise>
                    <h1>Remove User</h1>
                </c:otherwise>
        </c:choose>
    </body>
</html>
