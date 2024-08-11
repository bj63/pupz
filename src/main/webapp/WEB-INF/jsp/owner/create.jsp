<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<!-- Page Header -->
<section style="background-color:gray">
    <div class="container">
        <div class="row pt-5 pb-5">
            <c:if test="${empty form.ownerId}">
                <h1 class="text-center">Create Owner</h1>
            </c:if>
            <c:if test="${not empty form.ownerId}">
                <h1 class="text-center">Edit Owner</h1>
            </c:if>
        </div>
    </div>
</section>

<!-- Error Message Display -->
<c:if test="${not empty errorMessage}">
    <section>
        <div class="row">
            <div class="col-auto">
                <div class="alert alert-danger">
                        ${errorMessage}
                </div>
            </div>
        </div>
    </section>
</c:if>

<!-- Form Section -->
<section>
    <div class="container">
        <div class="row pt-5">
            <div class="col-12">
                <form action="/owner/createSubmit" method="post">
                    <input type="hidden" name="ownerId" value="${form.ownerId}">

                    <!-- Email Input -->
                    <div class="row align-items-center justify-content-center">
                        <div class="col-2">
                            <label for="emailId" class="col-form-label">Email</label>
                        </div>
                        <div class="col-4">
                            <input type="text" id="emailId" name="email" class="form-control <c:if test="${bindingResult.hasFieldErrors('email')}">is-invalid</c:if>" value="${form.email}">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('email')}">
                        <div class="row align-items-center justify-content-center">
                            <div class="offset-2 col-4">
                                <div class="text-danger">
                                    <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                                        ${error.defaultMessage}<br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Username Input -->
                    <div class="row align-items-center justify-content-center pt-3">
                        <div class="col-2">
                            <label for="usernameId" class="col-form-label">Username</label>
                        </div>
                        <div class="col-4">
                            <input type="text" id="usernameId" name="username" class="form-control <c:if test="${bindingResult.hasFieldErrors('username')}">is-invalid</c:if>" value="${form.username}">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('username')}">
                        <div class="row align-items-center justify-content-center">
                            <div class="offset-2 col-4">
                                <div class="text-danger">
                                    <c:forEach items="${bindingResult.getFieldErrors('username')}" var="error">
                                        ${error.defaultMessage}<br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Name Input -->
                    <div class="row align-items-center justify-content-center pt-3">
                        <div class="col-2">
                            <label for="nameId" class="col-form-label">Name</label>
                        </div>
                        <div class="col-4">
                            <input type="text" id="nameId" name="name" class="form-control <c:if test="${bindingResult.hasFieldErrors('name')}">is-invalid</c:if>" value="${form.name}">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('name')}">
                        <div class="row align-items-center justify-content-center">
                            <div class="offset-2 col-4">
                                <div class="text-danger">
                                    <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
                                        ${error.defaultMessage}<br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Age Input -->
                    <div class="row align-items-center justify-content-center pt-3">
                        <div class="col-2">
                            <label for="ageId" class="col-form-label">Age</label>
                        </div>
                        <div class="col-4">
                            <input type="number" id="ageId" name="age" class="form-control <c:if test="${bindingResult.hasFieldErrors('age')}">is-invalid</c:if>" value="${form.age}">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('age')}">
                        <div class="row align-items-center justify-content-center">
                            <div class="offset-2 col-4">
                                <div class="text-danger">
                                    <c:forEach items="${bindingResult.getFieldErrors('age')}" var="error">
                                        ${error.defaultMessage}<br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Country Input -->
                    <div class="row align-items-center justify-content-center pt-3">
                        <div class="col-2">
                            <label for="countryId" class="col-form-label">Country</label>
                        </div>
                        <div class="col-4">
                            <input type="text" id="countryId" name="country" class="form-control <c:if test="${bindingResult.hasFieldErrors('country')}">is-invalid</c:if>" value="${form.country}">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('country')}">
                        <div class="row align-items-center justify-content-center">
                            <div class="offset-2 col-4">
                                <div class="text-danger">
                                    <c:forEach items="${bindingResult.getFieldErrors('country')}" var="error">
                                        ${error.defaultMessage}<br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Image URL Input -->
                    <div class="row align-items-center justify-content-center pt-3">
                        <div class="col-2">
                            <label for="imageUrlId" class="col-form-label">Image URL</label>
                        </div>
                        <div class="col-4">
                            <input type="text" id="imageUrlId" name="imageUrl" class="form-control <c:if test="${bindingResult.hasFieldErrors('imageUrl')}">is-invalid</c:if>" value="${form.imageUrl}">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('imageUrl')}">
                        <div class="row align-items-center justify-content-center">
                            <div class="offset-2 col-4">
                                <div class="text-danger">
                                    <c:forEach items="${bindingResult.getFieldErrors('imageUrl')}" var="error">
                                        ${error.defaultMessage}<br>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Submit Button -->
                    <div class="row justify-content-center pt-3">
                        <div class="col-auto text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
