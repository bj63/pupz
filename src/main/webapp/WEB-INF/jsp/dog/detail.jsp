<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../include/header.jsp" />

<section class="bg-light py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="${dog.imageUrl}" class="img-fluid rounded-start" alt="${dog.name}">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h2 class="card-title">${dog.name}</h2>
                                <p class="card-text">${dog.description}</p>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"><strong>Breed:</strong> ${dog.breed.name}</li>
                                    <li class="list-group-item"><strong>Age:</strong> ${dog.age} years</li>
                                    <li class="list-group-item"><strong>Gender:</strong> ${dog.gender}</li>
                                    <li class="list-group-item"><strong>Buy Price:</strong> $<fmt:formatNumber value="${dog.buyPrice}" pattern="#,##0.00"/></li>
                                    <li class="list-group-item"><strong>Vaccinated:</strong> ${dog.vaccinated ? 'Yes' : 'No'}</li>
                                    <li class="list-group-item"><strong>Owner:</strong> ${dog.owner.name}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-3 text-center">
                    <a href="/dog/create/${dog.id}" class="btn btn-primary">Edit</a>
                    <a href="/dog/list" class="btn btn-secondary">Back to List</a>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp" />
