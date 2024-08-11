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
        <form:form action="/dog/createSubmit" method="post" modelAttribute="form">
            <spring:hasBindErrors name="form">
                <div class="alert alert-danger" role="alert">
                    <form:errors path="*" />
                </div>
            </spring:hasBindErrors>

            <form:hidden path="id" />

            <!-- Name Input Field -->
            <div class="row align-items-center justify-content-center">
                <div class="col-2">
                    <form:label path="name" for="nameId" cssClass="col-form-label">Name</form:label>
                </div>
                <div class="col-4">
                    <form:input id="nameId" path="name" cssClass="form-control ${bindingResult.hasFieldErrors('name') ? 'is-invalid' : ''}" />
                    <form:errors path="name" cssClass="invalid-feedback" />
                </div>
            </div>

            <!-- Description Input Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <form:label path="description" for="descriptionId" cssClass="col-form-label">Description</form:label>
                </div>
                <div class="col-4">
                    <form:textarea id="descriptionId" path="description" cssClass="form-control ${bindingResult.hasFieldErrors('description') ? 'is-invalid' : ''}" rows="3" />
                    <form:errors path="description" cssClass="invalid-feedback" />
                </div>
            </div>

            <!-- Image URL Input Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <form:label path="imageUrl" for="imageUrlId" cssClass="col-form-label">Image URL</form:label>
                </div>
                <div class="col-4">
                    <form:input id="imageUrlId" path="imageUrl" cssClass="form-control ${bindingResult.hasFieldErrors('imageUrl') ? 'is-invalid' : ''}" />
                    <form:errors path="imageUrl" cssClass="invalid-feedback" />
                </div>
            </div>

            <!-- Vaccinated Checkbox -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <form:label path="vaccinated" for="vaccinatedId" cssClass="col-form-label">Vaccinated</form:label>
                </div>
                <div class="col-4">
                    <form:checkbox id="vaccinatedId" path="vaccinated" cssClass="form-check-input" />
                </div>
            </div>

            <!-- Price Input Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <form:label path="price" for="priceId" cssClass="col-form-label">Price</form:label>
                </div>
                <div class="col-4">
                    <form:input id="priceId" path="price" type="number" step="0.01" cssClass="form-control ${bindingResult.hasFieldErrors('price') ? 'is-invalid' : ''}" />
                    <form:errors path="price" cssClass="invalid-feedback" />
                </div>
            </div>

            <!-- Gender Select Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <form:label path="gender" for="genderId" cssClass="col-form-label">Gender</form:label>
                </div>
                <div class="col-4">
                    <form:select id="genderId" path="gender" cssClass="form-select ${bindingResult.hasFieldErrors('gender') ? 'is-invalid' : ''}">
                        <form:option value="" label="Select Gender" />
                        <form:option value="MALE" label="Male" />
                        <form:option value="FEMALE" label="Female" />
                    </form:select>
                    <form:errors path="gender" cssClass="invalid-feedback" />
                </div>
            </div>

            <!-- Breed Select Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <form:label path="breedId" for="breedId" cssClass="col-form-label">Breed</form:label>
                </div>
                <div class="col-4">
                    <form:select id="breedId" path="breedId" cssClass="form-select ${bindingResult.hasFieldErrors('breedId') ? 'is-invalid' : ''}">
                        <form:option value="" label="Select Breed" />
                        <form:options items="${breeds}" itemValue="id" itemLabel="name" />
                    </form:select>
                    <form:errors path="breedId" cssClass="invalid-feedback" />
                </div>
            </div>

            <!-- Owner Select Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <form:label path="ownerId" for="ownerId" cssClass="col-form-label">Owner</form:label>
                </div>
                <div class="col-4">
                    <form:select id="ownerId" path="ownerId" cssClass="form-select ${bindingResult.hasFieldErrors('ownerId') ? 'is-invalid' : ''}">
                        <form:option value="" label="Select Owner" />
                        <form:options items="${owners}" itemValue="id" itemLabel="username" />
                    </form:select>
                    <form:errors path="ownerId" cssClass="invalid-feedback" />
                </div>
            </div>

            <!-- Age Input Field -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-2">
                    <form:label path="age" for="ageId" cssClass="col-form-label">Age</form:label>
                </div>
                <div class="col-4">
                    <form:input id="ageId" path="age" type="number" min="0" cssClass="form-control ${bindingResult.hasFieldErrors('age') ? 'is-invalid' : ''}" />
                    <form:errors path="age" cssClass="invalid-feedback" />
                </div>
            </div>

            <!-- Submit Button -->
            <div class="row align-items-center justify-content-center pt-3">
                <div class="col-6 text-center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <a href="${pageContext.request.contextPath}/dog/list" class="btn btn-secondary">Cancel</a>
                </div>
            </div>
        </form:form>
    </div>
</div>

<jsp:include page="../include/footer.jsp" />