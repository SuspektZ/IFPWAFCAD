<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : intPostUser
    Created on : 04-Feb-2016, 18:37:50
    Author     : Harry
--%>

<sql:query var="intPostUser" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM AllUsers WHERE
    AllUsers.login = ? <sql:param value="${param.login}"/>
</sql:query>
<sql:query var="intPostRutt" dataSource="jdbc/IFPWAFCAD">
    SELECT id, namn FROM Rutt
</sql:query>
<sql:query var="intPostRuttChoice" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM StoppView WHERE rutten = ? <sql:param value="${param.ruttid}"/>
</sql:query>
<c:set var="intPostUserDetails" value="${intPostUser.rows[0]}"/>
<c:set var="intPostRuttDetails" value="${intPostRuttChoice.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>intPostUser</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        
        <script>
            window.onload = function () {
                if (!window.location.hash) {
                    window.location = window.location + '#loaded';
                    window.location.reload();
                }
            };
        </script>
        <%@include file="buttonsConfig.jsp" %>
        <c:choose>
            <c:when test="${param.password == intPostUserDetails.epw}">
                <h1>${intPostUserDetails.namn} - ${intPostUserDetails.UserAuthority}
                    ${login}</h1>
                <form action="index.jsp" method="post">
                    <input type="submit" value="Log Out"/>
                </form>
                <form action="intPostUser.jsp" method="post"> 
                    <input type="hidden" name="login" value="${intPostUserDetails.login}" />
                    <input type="hidden" name="password" value="${intPostUserDetails.epw}" />
                    <strong><br><br>Select a Rutt:</strong>
                    <select name="ruttid">
                        <c:forEach var="row" items="${intPostRutt.rows}">
                            <option value="${row.id}">${row.namn}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Go" name="Go" />
                </form>
                <%! int ruttNr = 1;%>
                <table border="1" name="testTable">
                    <!-- column headers -->
                    <tr>
                        <c:forEach var="columnNameRutt" items="${intPostRuttChoice.columnNames}">
                            <th><c:out value="${column}"/>${columnNameRutt}</th>
                            </c:forEach>
                    </tr>
                    <!-- column data -->
                    <c:forEach var="rowRutt" items="${intPostRuttChoice.rowsByIndex}">
                        <tr>
                            <td><%=ruttNr++%></td>
                            <c:forEach var="column" items="${rowRutt}" begin="1">
                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                            <td>
                                <c:set var="testar" value="<%=ruttNr%>" />
                                <jsp:include page="collect.jsp">
                                    <jsp:param name="ruttNr" value="<%=ruttNr%>" />
                                    <jsp:param name="rowId" value="${intPostRuttChoice.rows[testar-2].id}" />
                                </jsp:include>
                            </td>
                            <td>
                                <jsp:include page="post.jsp">
                                    <jsp:param name="ruttNr" value="<%=ruttNr%>" />
                                    <jsp:param name="rowIdPost" value="${intPostRuttChoice.rows[testar-2].id}" />
                                </jsp:include>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <% ruttNr = 1;%>
                <c:choose>
                    <c:when test="${intPostUserDetails.UserAuthority == 'Admin'}">
                        <h1><br>Admin rights granted<br></h1>
                        <%@include file="testJsp.jsp" %> <!-- New User-->
                        <%@include file="removeUser.jsp" %>
                        <%@include file="createStopp.jsp" %>
                        <%@include file="removeStopp.jsp" %>
                        <%@include file="createRutt.jsp" %>
                        <%@include file="removeRutt.jsp" %>
                    </c:when>
                    <c:otherwise>
                        <!-- User Rights Granted-->
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <h1>Please enter mandatory information.</h1>
            </c:otherwise>
        </c:choose>
    </body>
</html>
