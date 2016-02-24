<%-- 
    Document   : collect
    Created on : 09-Feb-2016, 15:39:34
    Author     : Harry
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <title>JSP Page</title>
    </head>
    <body>
        <form action="intPostUser.jsp" method="post">
            <input type="hidden" name="login" value="${param.login}" />
            <input type="hidden" name="password" value="${param.password}" />
            <input type="hidden" name="ruttid" value="${param.ruttid}" />
            <input type="hidden" name="rowId" value="${param.rowId}" />
            <input type="submit" value="collect"/>
        </form>
    </body>
</html>
