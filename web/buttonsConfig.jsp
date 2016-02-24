<%-- 
    Document   : buttonsConfig
    Created on : 13-Feb-2016, 22:02:31
    Author     : Harry
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="intPostCollect" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Stopp WHERE id = ? <sql:param value="${param.rowId}"/>;
</sql:query>
<sql:query var="intPostPost" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Stopp WHERE id = ? <sql:param value="${param.rowIdPost}"/>;
</sql:query>
<c:set var="intPostCollectDetails" value="${intPostCollect.rows[0]}"/>
<c:set var="intPostPostDetails" value="${intPostPost.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty param.rowId &&
                            intPostCollectDetails.status != 'empty'}">
                <sql:update dataSource="jdbc/IFPWAFCAD" var="collectPost">
                    UPDATE Stopp SET status = 'empty' WHERE id = ?;
                    <sql:param value="${param.rowId}" />
                </sql:update>
                <sql:update dataSource="jdbc/IFPWAFCAD" var="collectPostLogg">
                    INSERT INTO Logg (event,datum,whoWhat,byWho) VALUES('Collect',CURRENT_TIMESTAMP,?,?);
                    <sql:param value="${param.rowId}" />
                    <sql:param value="${param.login}" />
                </sql:update>
            </c:when>
            <c:when test="${not empty param.rowIdPost &&
                            intPostPostDetails.status != 'mail'}">
                <sql:update dataSource="jdbc/IFPWAFCAD" var="collectPost">
                    UPDATE Stopp SET status = 'mail' WHERE id = ?;
                    <sql:param value="${param.rowIdPost}" />
                </sql:update>
                <sql:update dataSource="jdbc/IFPWAFCAD" var="collectPostLogg">
                    INSERT INTO Logg (event,datum,whoWhat,byWho) VALUES('New Mail',CURRENT_TIMESTAMP,?,'Ready to Collect');
                    <sql:param value="${param.rowIdPost}" />
                </sql:update>
            </c:when>
        </c:choose>
    </body>
</html>
