<%-- 
    Document   : post
    Created on : 09-Feb-2016, 15:42:25
    Author     : Harry
--%>

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
            <input type="hidden" name="rowIdPost" value="${param.rowIdPost}" />
            <input type="submit" value="Mail"/>
        </form>
    </body>
</html>
