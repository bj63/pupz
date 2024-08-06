<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../include/header.jsp" />

<div class="container">
    <h1 class="text-center my-4">User Details</h1>
    <div class="card">
        <img src="${user.profileImage}" class="card-img-top" alt="User Image">
        <div class="main-content">
            <h1>User Details</h1>
            <div class="detail-row">
                <span class="detail-label">Email:</span> ${user.email}
            </div>
            <!-- Add any additional user details here -->
            <a href="${pageContext.request.contextPath}/user/edit?userId=${user.id}" class="edit-button">Edit User</a>
        </div>
        <jsp:include page="../include/header.jsp" />
