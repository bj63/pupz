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

<div class="main-content">
    <h1>${form.userId == null ? 'Create' : 'Edit'} User</h1>
    <form:form action="${pageContext.request.contextPath}/user/createSubmit" modelAttribute="form">
        <form:hidden path="userId" />

        <div>
            <form:label path="email">Email:</form:label>
            <form:input path="email" type="email" required="required" />
            <form:errors path="email" cssClass="error" />
        </div>
        <div>
            <form:label path="password">Password:</form:label>
            <form:password path="password" required="required" />
            <form:errors path="password" cssClass="error" />
        </div>
        <!-- Add any additional fields here -->
        <div>
            <input type="submit" value="${form.userId == null ? 'Create' : 'Update'} User">
        </div>
    </form:form>

<jsp:include page="../include/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>