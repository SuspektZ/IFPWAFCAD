
<%-- 
    Document   : showUsers
    Created on : 04-Feb-2016, 22:38:15
    Author     : Harry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <!-- column headers -->
            <tr>
            <c:forEach var="columnName" items="${intPost.columnNames}">
                <th><c:out value="${columnName}"/></th>
            </c:forEach>
        </tr>
        <!-- column data -->
        <c:forEach var="row" items="${intPost.rowsByIndex}">
            <tr>
            <c:forEach var="column" items="${row}">
                <td><c:out value="${column}"/></td>
            </c:forEach>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
