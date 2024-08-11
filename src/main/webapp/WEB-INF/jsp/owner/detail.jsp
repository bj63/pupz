<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<h1 class="page-title">Owner Detail Page</h1>

<section>
    <div class="row pt-5">
        <div class="col-12">
            <h2 class="text-center">Owner ${owner.name}</h2>
        </div>
    </div>
    <div class="row justify-content-center">
        <table class="table table-success table-striped table-bordered table-responsive" style="width: 750pt">
            <tr>
                <td style="font-weight: bolder;">Owner ID:</td>
                <td>${owner.id}</td>
            </tr>
            <tr>
                <td style="font-weight: bolder;">Email:</td>
                <td>${owner.email}</td>
            </tr>
            <tr>
                <td style="font-weight: bolder;">Username:</td>
                <td>${owner.username}</td>
            </tr>
            <tr>
                <td style="font-weight: bolder;">Name:</td>
                <td>${owner.name}</td>
            </tr>
            <tr>
                <td style="font-weight: bolder;">Age:</td>
                <td>${owner.age}</td>
            </tr>
            <tr>
                <td style="font-weight: bolder;">Country:</td>
                <td>${owner.country}</td>
            </tr>
            <tr>
                <td>Profile Image</td>
                <!-- /pub/images/...jpg -->
                <td><img src="${owner.imageUrl}" alt="Owner Image" style="max-width: 200px; max-height: 200px;"/></td>
            </tr>
        </table>
    </div>

    <div class="row justify-content-center">
        <div class="col-auto">
            <a href="/owner/edit?ownerId=${owner.id}" class="btn btn-primary">Edit</a>
            <br/>
            <a href="/file-upload?ownerId=${owner.id}" class="btn btn-secondary">Upload Image</a>
        </div>
    </div>
</section>

<section>
    <div class="container">
        <div class="row pt-5">
            <div class="col-12">
                <h2 class="text-center">Dogs Owned (${dogs.size()})</h2>
            </div>
        </div>
        <div class="row pt-3">
            <div class="col-12">
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Breed</th>
                        <th>Age</th>
                        <th>Description</th>
                        <th>Image</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${dogs}" var="dog">
                        <tr>
                            <td>${dog.id}</td>
                            <td>${dog.name}</td>
                            <td>${dog.breed}</td>
                            <td>${dog.age}</td>
                            <td>${dog.description}</td>
                            <td><img src="${dog.imageUrl}" alt="Dog Image" style="max-width: 100px; max-height: 100px;"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
