<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/10/2021
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>

<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>

<div class="row">
    <div class="container-fluid">
        <h1 class="display-4 my-4 text-info"> List of users</h1>
        <table class="table table-striped " id="users" style="width: 100%;">
            <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-secondary">Copy</button>
                <button type="button" class="btn btn-secondary">CSV</button>
                <button type="button" class="btn btn-secondary">Print</button>
            </div>
            <div class="input-group mb-3" style="width: 20%; float: right;">
                <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
                </div>
            </div>
            <thead>
            <tr id="list-header">
                <th scope="col">+</th>
                <th scope="col"><input type="checkbox"></th>
                <th scope="col">ID</th>
                <th scope="col">Actions</th>
                <th scope="col">Name</th>
                <th scope="col">UserName</th>
                <th scope="col">Email</th>
                <th scope="col">Address1</th>
            </tr>

            </thead>
            <c:forEach items='${customers}' var="Customer">
                <tr>
                    <td><a href="/customers?action=view&id=${customer.id}">${customer.name}</a></td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td><a href="/customers?action=edit&id=${customer.id}">edit</a></td>
                    <td><a href="/customers?action=delete&id=${customer.id}">delete</a></td>
                </tr>
            </c:forEach>
            <tbody>
            <tr>
                <td scope="col">+</td>
                <td scope="col"><input type="checkbox"></td>
                <td scope="row">1</td>
                <td>
                    <a href="from.jsp" >
                        <button type="button" class="btn btn-primary"><i class="bi bi-pencil-square"></i>Primary</button>
                    </a>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"><i class="bi bi-trash"></i>Delete</button></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>