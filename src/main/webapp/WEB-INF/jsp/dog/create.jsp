<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Dog</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="/pub/css/global.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />

<div class="container">
    <h1 class="text-center my-4">Create New Dog</h1>
    <form:form modelAttribute="form" action="/dog/create" method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <form:input path="name" id="name" class="form-control"/>
            <form:errors path="name" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="age">Age</label>
            <form:input path="age" id="age" type="number" class="form-control"/>
            <form:errors path="age" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="gender">Gender</label>
            <form:select path="gender" id="gender" class="form-control">
                <form:option value="Male">Male</form:option>
                <form:option value="Female">Female</form:option>
            </form:select>
            <form:errors path="gender" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <form:textarea path="description" id="description" class="form-control"/>
            <form:errors path="description" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="imageUrl">Image URL</label>
            <form:input path="imageUrl" id="imageUrl" class="form-control"/>
            <form:errors path="imageUrl" cssClass="error"/>
        </div>
        <div class="form-group">
            <label for="userId">Owner</label>
            <form:select path="userId" id="userId" class="form-control">
                <form:options items="${users}" itemValue="id" itemLabel="username"/>
            </form:select>
            <form:errors path="userId" cssClass="error"/>
        </div>
        <button type="submit" class="btn btn-primary">Create Dog</button>
    </form:form>
</div>

<jsp:include page="../include/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>