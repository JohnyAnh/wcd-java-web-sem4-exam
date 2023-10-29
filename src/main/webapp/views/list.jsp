<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hoanganhvu
  Date: 20/10/2023
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CRUD Student</title>
    <link rel="shortcut icon" href="http://cdn.sstatic.net/stackoverflow/img/favicon.ico">
    <link rel="apple-touch-icon" href="http://cdn.sstatic.net/stackoverflow/img/apple-touch-icon.png">
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous">

</head>
<body>
<style>
    /* CSS để tạo nút giống với nút button */
    .button-link1 {
        display: inline-block;
        padding: 6px 12px;
        text-align: center;
        text-decoration: none;
        color: #000000;
        background-color: #ffae00; /* Màu nền của nút */
        border: 1px solid #ffae00; /* Viền của nút */
        border-radius: 5px;
        cursor: pointer;
    }

    /* Khi di chuột vào nút */
    .button-link1:hover {
        background-color: #f6bf4c; /* Màu nền thay đổi khi di chuột vào */
    }
    /* CSS để tạo nút giống với nút button */
    .button-link2 {
        display: inline-block;
        padding: 6px 12px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #c2011b; /* Màu nền của nút */
        border: 1px solid #c2011b; /* Viền của nút */
        border-radius: 5px;
        cursor: pointer;
    }

    /* Khi di chuột vào nút */
    .button-link2:hover {
        background-color: #960116; /* Màu nền thay đổi khi di chuột vào */
    }
</style>
<%--navbar--%>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="https://th.bing.com/th/id/OIP.nFn_mpOrmv-KNugzesNztwHaHa?w=176&h=180&c=7&r=0&o=5&dpr=2&pid=1.7" alt="Bootstrap" width="30" height="24">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/employee/index">List employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/employee/list">List</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Customer 2
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled">Customer 3</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<%--End Nav--%>
<h1>Employee Manager</h1>
<div class="alert">
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

</div>

<div class="container">
    <div class="row">
        <div class="col-12 d-flex justify-content-center align-items-center">


            <form class="col-6" action="/employee/index" method="post">

                <div class="input-group mb-3 input-group-sm">
                    <span class="input-group-text" >ID</span>
                    <input name="id" value="${employee.id}" type="text" class="form-control" readonly>
                </div>

                <div class="input-group mb-3 input-group-sm">
                    <span class="input-group-text" >Full Name</span>
                    <input name="name" value="${employee.name}" type="text" class="form-control">
                </div>


                <div class="input-group mb-3 input-group-sm">
                    <span class="input-group-text">Birth</span>
                    <input name="birth" value="${employee.birth}" type="date" class="form-control">
                </div>


                <div class="input-group mb-3 input-group-sm">
                    <span class="input-group-text">Address</span>
                    <input name="address" value="${employee.address}" type="text" class="form-control">
                </div>

                <div class="input-group mb-3 input-group-sm">
                    <span class="input-group-text">Position</span>
                    <input name="position" value="${employee.position}" type="text" class="form-control">
                </div>

                <div class="input-group mb-3 input-group-sm">
                    <span class="input-group-text">Department</span>
                    <input name="department" value="${employee.department}" type="text" class="form-control">
                </div>
                <div >
                    <button formaction="/employee/create"  class="btn btn-success">Create</button>
                    <button formaction="/employee/update"  class="btn btn-warning">Update</button>
                    <button formaction="/employee/delete"  class="btn btn-danger">Delete</button>
                    <button formaction="/employee/reset"  class="btn btn-primary">Reset</button>
                </div>
            </form>

        </div>
        <br>
        <div class="container mt-6">
            <h2>Table Employee</h2>
            <form action="/employee/search" method="post" class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Birth</th>
                    <th>Address</th>
                    <th>Position</th>
                    <th>Department</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>${employee.id}</td>
                        <td>${employee.name}</td>
                        <td>${employee.birth}</td>
                        <td>${employee.address}</td>
                        <td>${employee.position}</td>
                        <td>${employee.department}</td>
                        <td>
                            <a href="/employee/edit/?id=${employee.id}" class="button-link1">Edit</a>
                            <a href="/employee/delete/?id=${employee.id}" class="button-link2">Delete</a>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
