<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/10/2021
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <form action="/create.jsp" method="post">

            <div class="form-group" style="margin-top:200px; background-color:#4fd9e8; height:215px;width: 400px;">
                <label for="myEmail">ID</label>
                <input type="id" id="myEmail" name="userName"  class="form-control" placeholder="Nhập ID">
                <label for="myPassword">Password</label>
                <input type="password" id="myPassword" name="Password" class="form-control" placeholder="Password">
                <button type="submit" class="btn btn-success" style="margin-left: 160px; margin-top:10px;
                    ">Submit</button>
                <br>
                <%
                    String login_msg=(String)request.getAttribute("error");
                    if(login_msg!=null) out.println("<font color=red size=4px style ='margin-left: 80px;'> "+login_msg+"</font>");
                %>
            </div>
        </form>
    </div>
    <div class="col-md-4"></div>
</div>
</body>
</html>