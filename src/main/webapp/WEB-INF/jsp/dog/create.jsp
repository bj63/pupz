<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="../include/header.jsp" />

<section class="bg-secondary">
    <div class="container">
        <div class="row py-5">
            <h1 class="text-center text-white">${form.id == null ? 'Create' : 'Edit'} Dog</h1>
        </div>
    </div>
</section>

<div class="container">
    <div class="row pt-5 pb-5">
        <form action="/dog/createSubmit" method="post">
            <spring:hasBindErrors name="form">
                <div class="alert alert-danger" role="alert">
                    <form:errors path="*" />
                </div>
            </spring:hasBindErrors>

            <input type="hidden" name="id" value="${form.id}">

            <!-- Name Input Field -->
            <div class="row align-items-center justify-content-center">
                <div class="col-2">
                    <label for="nameId" class="col-form-label">Name</label>
                </div>
                <div class="col-4">
                    <input type="text" id="nameId" name="name" class="form-control <c:if test="${bindingResult.hasFieldErrors('name')}">is-invalid</c:if>"
                           value="${form.name}">
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

            <!-- Description Input Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <label for="descriptionId" class="col-form-label">Description</label>
                </div>
                <div class="col-4">
                    <textarea id="descriptionId" name="description" class="form-control <c:if test="${bindingResult.hasFieldErrors('description')}">is-invalid</c:if>"
                              rows="3">${form.description}</textarea>
                </div>
            </div>
            <c:if test="${bindingResult.hasFieldErrors('description')}">
                <div class="row align-items-center justify-content-center">
                    <div class="offset-2 col-4">
                        <div class="text-danger">
                            <c:forEach items="${bindingResult.getFieldErrors('description')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Image URL Input Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <label for="imageUrlId" class="col-form-label">Image URL</label>
                </div>
                <div class="col-4">
                    <input type="text" id="imageUrlId" name="imageUrl" class="form-control <c:if test="${bindingResult.hasFieldErrors('imageUrl')}">is-invalid</c:if>"
                           value="${form.imageUrl}">
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

            <!-- Vaccinated Checkbox -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <label for="vaccinatedId" class="col-form-label">Vaccinated</label>
                </div>
                <div class="col-4">
                    <input type="checkbox" id="vaccinatedId" name="vaccinated" class="form-check-input"
                           <c:if test="${form.vaccinated}">checked</c:if>>
                </div>
            </div>

            <!-- Price Input Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <label for="priceId" class="col-form-label">Price</label>
                </div>
                <div class="col-4">
                    <input type="number" id="priceId" name="price" step="0.01" class="form-control <c:if test="${bindingResult.hasFieldErrors('price')}">is-invalid</c:if>"
                           value="${form.price}">
                </div>
            </div>
            <c:if test="${bindingResult.hasFieldErrors('price')}">
                <div class="row align-items-center justify-content-center">
                    <div class="offset-2 col-4">
                        <div class="text-danger">
                            <c:forEach items="${bindingResult.getFieldErrors('price')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Gender Select Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <label for="genderId" class="col-form-label">Gender</label>
                </div>
                <div class="col-4">
                    <select id="genderId" name="gender" class="form-select <c:if test="${bindingResult.hasFieldErrors('gender')}">is-invalid</c:if>">
                        <option value="">Select Gender</option>
                        <option value="MALE" <c:if test="${form.gender == 'MALE'}">selected</c:if>>Male</option>
                        <option value="FEMALE" <c:if test="${form.gender == 'FEMALE'}">selected</c:if>>Female</option>
                    </select>
                </div>
            </div>
            <c:if test="${bindingResult.hasFieldErrors('gender')}">
                <div class="row align-items-center justify-content-center">
                    <div class="offset-2 col-4">
                        <div class="text-danger">
                            <c:forEach items="${bindingResult.getFieldErrors('gender')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>

            <div class="row justify-content-center pt-4">
                <div class="col-6 text-center">
                    <button type="submit" class="btn btn-primary">${form.id == null ? 'Create' : 'Update'} Dog</button>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../include/footer.jsp" />