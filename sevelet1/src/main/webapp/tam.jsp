<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/5/2021
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="test.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
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
                <input type="text" class="form-control" placeholder="Recipient's username"
                       aria-label="Recipient's username" aria-describedby="button-addon2">
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
            <c:forEach items='${requestScope["persons"]}' var="person">
                <tr>

                    <td scope="col">+</td>
                    <td scope="col"><input type="checkbox"></td>
                    <td>
                            ${person.id}
                    </td>

                    <td>
                        <a href="/person?action=create">
                        <button type="button" class="btn btn-primary"><i class="bi bi-file-earmark-plus-fill"></i>NewPerseon
                        </button>
                        </a>

                        <a href="/person?action=edit&id=${person.id}">
                            <button type="button" class="btn btn-primary"><i class="bi bi-pencil-square"></i>Primary
                            </button>
                        </a>
                            <a href="/person?action=delete&id=${person.id}">
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"><i class="bi bi-trash"></i>Delete
                        </button>
                            </a>

                    </td>
                    <td>
                        <a href="/person?action=view&id=${person.id}">
                        <button data-toggle="modal" data-target="#myView">${person.name}</button>
                        </a>
                    </td>

                    <td>
                        ${person.username}
                    </td>
                    <td>${person.email}</td>
                    <td>${person.address}</td>
                </tr>
            </c:forEach>
            </thead>
            <tbody>

            <tr>
                <td scope="col">+</td>
                <td scope="col"><input type="checkbox"></td>
                <td scope="row">1</td>
                <td>
                    <a href="/person?action=create">
                    <button type="button" class="btn btn-primary"><i class="bi bi-file-earmark-plus-fill"></i>New Person
                    </button>
                    </a>

                    <a href="/person?action=edit&id=${person.id}">
                        <button type="button" class="btn btn-primary"><i class="bi bi-pencil-square"></i>Primary
                        </button>
                    </a>
<%--                        <a href="/person?action=delete&id=${person.id}">--%>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal"><i
                            class="bi bi-trash"></i>Delete
                    </button>


                </td>
                <td>
                    <button data-toggle="modal" data-target="#myView">Leanne Graham</button>
                </td>
                <td>Bret</td>
                <td>Sincere@april.biz</td>
                <td>Kulas Light,Apt.556</td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-md-5">
            <span>
            <p style="margin-left: 15px;">Showing 0 to 0 of 0 entries</p>
        </span>
    </div>
    <div class="col-md-4" style="width: 200px; ">
        <form class="form-inline" style="float: right;">
            <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Preference</label>
            <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                <option selected value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <label class="my-1 mr-2" for="inlineFormCustomSelectPref">entries</label>
        </form>
    </div>
    <div class="col-md-2">
        <nav aria-label="Something..">
            <ul class="pagination">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
</body>
<%--delete doi tuong--%>
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Bạn Đã Xóa 1 Thành Viên</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="btn btn-success">
                Thành Công !!
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" data-dismiss="modal">Success</button>

            </div>
        </div>
    </div>
</div>

<%--Hiển thị đối tượng--%>
<div class="modal" id="myView">
    <div class="modal-dialog">
        <div class="modal-content" style="width:570px">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title" style="width: 100% ; text-align: center">Show Customer</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="container-fluid mt-3">
                <form>
                    <div class="form-group"
                         style="border: 1px solid;box-shadow: 5px 5px 2px 4px;;width: 525px;background-color: aquamarine;">
                        <div class="main" style="margin-left: 15px ;padding-bottom: 10px;">
                            <label for="id">ID</label>
                            <input type="text" id="id" name="id" value="${requestScope['person'].id}" class="form-control" placeholder="Nhập ID" style="width:200px">
                            <label for="name">Name</label>
                            <input type="text" id="name" name="name"  value="${requestScope['person'].name}" class="form-control" placeholder="Nhập Name"
                                   style="width:500px">
                            <label for="username">UserName</label>
                            <input type="text" id="username"  name="username"  value="${requestScope['person'].username}" class="form-control" placeholder="Nhập UserName"
                                   style="width:500px">
                            <label for="email">Email</label>
                            <input type="text" id="email" name="email"  value="${requestScope['person'].email}" class="form-control" placeholder="Nhập Email"
                                   style="width:500px">
                            <label for="address">Address1</label>
                            <input type="text" id="address" name="address"   value="${requestScope['person'].address}" class="form-control" placeholder="Address1"
                                   style="width:500px">
                        </div>
                    </div>
                </form>

            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" data-dismiss="modal">Success</button>

            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</html>
