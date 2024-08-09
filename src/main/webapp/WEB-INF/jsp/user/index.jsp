<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pupz Users</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="/pub/css/global.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../include/header.jsp" />

    <div class="container">
        <h1 class="text-center my-4">Pupz Users</h1>
        <div class="row">
            <c:forEach var="user" items="${users}">
                <div class="col-md-4 mb-4">
                    <div class="card user-card">
                        <img src="${user.profileImage}" class="card-img-top" alt="User Image">
                        <div class="card-body">
                            <h5 class="card-title">${user.username}</h5>
                            <p class="card-text">Name: ${user.name} ${user.surname}</p>
                            <p class="card-text">Age: ${user.age}</p>
                            <p class="card-text">Country: ${user.country}</p>
                            <p class="card-text">Email: ${user.email}</p>
                            <p class="card-text">Owner: ${user.isOwner ? 'Yes' : 'No'}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="../include/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>