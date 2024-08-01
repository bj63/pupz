<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New User</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="assests/css/global.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />

<div class="container">
    <h1 class="text-center my-4">Create New User</h1>
    <form:form modelAttribute="form" action="/user/create" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <form:input path="username" id="username" class="form-control"/>
            <form:errors path="username" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="name">First Name</label>
            <form:input path="name" id="name" class="form-control"/>
            <form:errors path="name" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="surname">Last Name</label>
            <form:input path="surname" id="surname" class="form-control"/>
            <form:errors path="surname" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="age">Age</label>
            <form:input path="age" id="age" type="number" class="form-control"/>
            <form:errors path="age" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="country">Country</label>
            <form:input path="country" id="country" class="form-control"/>
            <form:errors path="country" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <form:input path="email" id="email" type="email" class="form-control"/>
            <form:errors path="email" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <form:password path="password" id="password" class="form-control"/>
            <form:errors path="password" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="isOwner">Is Owner</label>
            <form:checkbox path="isOwner" id="isOwner" class="form-check-input"/>
            <form:errors path="isOwner" cssClass="error"/>
        </div>

    <form method="post" action="${pageContext.request.contextPath}/file-upload" enctype="multipart/form-data">
        <input type="hidden" name="employeeId" value="${employeeId}"/>

        <div class="row align-items-center justify-content-center">
            <div class="col-2">
                <label for="file" class="col-form-label">File</label>
            </div>
            <div class="col-4">
                <input type="file" id="file" name="file" class="form-control">
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Create User</button>
    </form:form>
</div>

<jsp:include page="../include/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>