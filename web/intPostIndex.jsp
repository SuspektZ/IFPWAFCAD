<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : intPostIndex
    Created on : 04-Feb-2016, 15:49:00
    Author     : Harry
--%>

<sql:query var="intPost" dataSource="jdbc/IFPWAFCAD">
    SELECT login, namn, UserAuthority FROM AllUsers
</sql:query>
<c:set var="intPostDetails" value="${intPost.rows[0]}"/>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <title>IntPostIndex</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <form name="newCitizenForm"
              action="intPostUser.jsp"
              method="POST">
            <table border="1">
                <tr>
                    <td>Enter login:</td>
                    <td><input type="text" name="login"/>
                </tr>
                <tr>
                    <td>Enter Password:</td>
                    <td><input type="text" name="password" />
                </tr>
                <tr>
                    <td><input type="submit" value="Login"/></td>
                </tr>
            </table>
        </form>

    </body>
</html>
