<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dog Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="include/header.jsp" />

<div class="container mt-5">
    <div class="card mb-3">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="${dog.imageUrl}" class="img-fluid rounded-start" alt="${dog.name}">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">${dog.name}</h5>
                    <p class="card-text"><strong>Breed:</strong> ${dog.breed}</p>
                    <p class="card-text"><strong>Age:</strong> ${dog.age}</p>
                    <p class="card-text"><strong>Description:</strong> ${dog.description}</p>
                    <a href="/dogs" class="btn btn-primary">Back to All Dogs</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="include/footer.jsp" />
</body>
</html>
