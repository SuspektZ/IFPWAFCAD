<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : response
    Created on : 03-Feb-2016, 13:05:38
    Author     : Harry
--%>
<sql:query var="counselorQuery" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Subject, Counselor WHERE Counselor.id = Subject.FK_counselorID
    AND Subject.id = ? <sql:param value="${param.testid}"/>
</sql:query>
    <c:set var="counselorDetails" value="${counselorQuery.rows[0]}"/>
   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IFPWAFCAD - ${counselorDetails.name}</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <table border="0">
    <thead>
        <tr>
            <th colspan="2">${counselorDetails.name}</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>Description: </strong></td>
            <td><span style="font-size:smaller; font-style:italic;">${counselorDetails.description}</span></td>
        </tr>
        <tr>
            <td><strong>Counselor: </strong></td>
            <td>${counselorDetails.firstName} ${counselorDetails.nickName} ${counselorDetails.lastName} ${counselorDetails.Status}
                <br>
                <span style="font-size:smaller; font-style:italic;">
                member since: ${counselorDetails.memberSince}</span>
            </td>
        </tr>
        <tr>
            <td><strong>Contact Details: </strong></td>
            <td><strong>email: </strong>
                <a href="mailto:${counselorDetails.email}">${counselorDetails.email}</a>
                <br><strong>phone: </strong>${counselorDetails.telephone}
            </td>
        </tr>
    </tbody>
</table>
    </body>
</html>
