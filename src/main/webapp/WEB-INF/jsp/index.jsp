<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pupz Profiles</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/global.css" rel="stylesheet">
    <style>
        .profile-card {
            height: 100%;
        }
        .profile-card .card-img-top {
            height: 200px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<jsp:include page="include/header.jsp" />

<div class="container mt-4">
    <h1 class="mb-4">Pupz Profiles</h1>
    <div class="row">
        <c:forEach var="profile" items="${profiles}">
            <div class="col-md-4 mb-4">
                <div class="card profile-card">
                    <img src="${profile.imageUrl}" class="card-img-top" alt="${profile.name}">
                    <div class="card-body">
                        <h5 class="card-title">${profile.name}</h5>
                        <p class="card-text"><strong>Breed:</strong> ${profile.breed.name}</p>
                        <p class="card-text"><strong>Age:</strong> ${profile.age} years</p>
                        <p class="card-text"><strong>Gender:</strong> ${profile.gender}</p>
                        <p class="card-text"><strong>Buy Price:</strong> $<fmt:formatNumber value="${profile.buyPrice}" pattern="#,##0.00"/></p>
                        <p class="card-text"><strong>Vaccinated:</strong> ${profile.vaccinated ? 'Yes' : 'No'}</p>
                        <c:if test="${not empty profile.owner}">
                            <p class="card-text"><strong>Owner:</strong> ${profile.owner.name}</p>
                        </c:if>
                        <p class="card-text">${profile.description}</p>
                        <a href="/dog/detail/${profile.id}" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="include/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
