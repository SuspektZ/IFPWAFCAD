<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 03-Feb-2016, 10:56:12
    Author     : Harry
--%>
<sql:query var="subjects" dataSource="jdbc/IFPWAFCAD">
    SELECT subject.id, name FROM Subject
</sql:query>

<sql:query var="intPost" dataSource="jdbc/IFPWAFCAD">
    SELECT login, namn, UserAuthority FROM AllUsers
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IFPWAFCAD Homepage</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <!-- include test.jsp-->
        <table border="0" class="table">
            <thead>
                <tr><br><br>
            <th>IFPWAFCAD offers expert counseling in a wide range of fields.</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>To view the contact details of an IFPWAFCAD certified former
                professional wrestler in your area, select a subject below:</td>
        </tr>
        <tr>
            <td><form action="response.jsp">    
                    <strong>Select a subject:</strong>
                    <select name="testid">
                        <c:forEach var="row" items="${subjects.rows}">
                            <option value="${row.id}">${row.name}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Go" name="Go" />
                </form>
            </td>
        </tr>
        <tr>
            <td><form action="intPostIndex.jsp">
                    <strong>Intelligent Post</strong>

                    <input type="submit" value="IntPost" name="IntPost">
                </form></td>
        </tr>
    </tbody>
</table>
<%@include file="showUsers.jsp" %>
</body>
</html>
