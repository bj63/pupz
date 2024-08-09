<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>


<div class="container my-5">
    <h1>User Details</h1>
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${user.name} ${user.surname}</h5>
                    <p class="card-text">
                        <strong>Email:</strong> ${user.email}<br>
                        <strong>Username:</strong> ${user.username}<br>
                        <strong>Age:</strong> ${user.age}<br>
                        <strong>Country:</strong> ${user.country}<br>
                    </p>
                    <a href="/users/${user.id}/edit" class="btn btn-primary">Edit</a>
                </div>
            </div>
        </div>
    </div>
</div>