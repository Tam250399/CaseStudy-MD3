<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/8/2021
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid mt-3">
    <div class="row">
        <div class="col-md-6 offset-5">
            <h2>UPDATE</h2>
        </div>
    </div>
    <form  method="post" style="padding-left: 300px;">
        <!-- Vertical -->
        <div class="form-group" style="border: 1px solid;box-shadow: 5px 5px 2px 4px;;width: 670px;background-color: aquamarine;">
            <div class="main" style="margin-left: 90px ;padding-top: 30px;">
                <label for="id">ID</label>
                <input  type="text" name="id" id="id" value="${requestScope['person'].id}" class="form-control" placeholder="Nhập ID" style="width:200px">
                <label for="name">Name</label>
                <input type="text" name="name" id="name"  value="${requestScope['person'].name}" class="form-control" placeholder="Nhập Name" style="width:500px">
                <label for="username">UserName</label>
                <input type="text"  name="username" id="username"  value="${requestScope['person'].username}" class="form-control" placeholder="Nhập UserName" style="width:500px">
                <label for="email">Email</label>
                <input type="email"  name="email" id="email"  value="${requestScope['person'].email}" class="form-control" placeholder="Nhập Email" style="width:500px">
                <label for="address">Address1</label>
                <input type="text" name="address" id="address"  value="${requestScope['person'].address}" class="form-control" placeholder="Address1" style="width:500px">
            </div>
            <div class="col-md-6 offset-5">
                <button  type="submit" class="btn btn-primary" style="margin-top:50px;margin-bottom:20px">Submit</button>
                <a href="/person" type="submit" class="btn btn-primary" style="margin-top:50px;margin-bottom:20px">Back to list </a>
            </div>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
