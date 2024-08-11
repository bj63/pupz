<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="../include/header.jsp" />

<section class="bg-light py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h1 class="text-center mb-5">${dog.name}</h1>

                <div class="card mb-4">
                    <img src="${dog.imageUrl}" class="card-img-top" alt="${dog.name}">
                    <div class="card-body">
                        <h5 class="card-title">Details</h5>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><strong>Breed:</strong> ${dog.breed.name}</li>
                            <li class="list-group-item"><strong>Age:</strong> ${dog.age} years</li>
                            <li class="list-group-item"><strong>Gender:</strong> ${dog.gender}</li>
                            <li class="list-group-item"><strong>Price:</strong> $<fmt:formatNumber value="${dog.price}" type="number" minFractionDigits="2" maxFractionDigits="2"/></li>
                            <li class="list-group-item"><strong>Vaccinated:</strong> ${dog.vaccinated ? 'Yes' : 'No'}</li>
                            <li class="list-group-item"><strong>Owner:</strong> ${dog.owner.username}</li>
                        </ul>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Description</h5>
                        <p class="card-text">${fn:escapeXml(dog.description)}</p>
                    </div>
                </div>

                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/dog/edit?id=${dog.id}" class="btn btn-primary mr-2">Edit</a>
                    <a href="${pageContext.request.contextPath}/dog/list" class="btn btn-secondary">Back to List</a>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp" />