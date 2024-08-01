<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pupz Profiles</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/global.css" rel="stylesheet">
</head>
<body>
<jsp:include page="include/header.jsp" />

<c:forEach var="profile" items="${profiles}">
    <div class="col-md-4 mb-4">
        <div class="card profile-card">
            <img src="${profile.imageUrl}" class="card-img-top" alt="Dog Image">
            <div class="card-body">
                <h5 class="card-title">${profile.name}</h5>
                <p class="card-text">Breed: ${profile.breed.name}</p>
                <p class="card-text">Age: ${profile.age}</p>
                <p class="card-text">${profile.description}</p>
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
