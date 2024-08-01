<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pupz Profiles</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="/pub/css/global.css" rel="stylesheet">
</head>
<body>
<jsp:include page="include/header.jsp" />
<section>
    <div class="container">
        <div class="row pt-5 justify-content-center">
            <div class="col-auto justify-content-center">
                <form class="card" style="width: 500px;" action="/dog/createSubmit">
                    <div class="card-body p-3">
                        <input type="hidden" name="id" value="${form.id}"/>

                        <div>
                            <label for="nameId" class="col-form-label">Name</label>
                            <input type="text" id="nameId" name="name"
                                   class="form-control <c:if test="${bindingResult.hasFieldErrors('name')}">is-invalid</c:if>"
                                   value="${form.name}">
                            <c:if test="${bindingResult.hasFieldErrors('name')}">
                                <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
                                    <div class="text-danger">${error.defaultMessage}</div>
                                </c:forEach>
                            </c:if>
                        </div>

                        <div>
                            <label for="breedId" class="col-form-label">Breed</label>
                            <input type="text" id="breedId" name="breed"
                                   class="form-control <c:if test="${bindingResult.hasFieldErrors('breed')}">is-invalid</c:if>"
                                   value="${form.breed}">
                            <c:if test="${bindingResult.hasFieldErrors('breed')}">
                                <c:forEach items="${bindingResult.getFieldErrors('breed')}" var="error">
                                    <div class="text-danger">${error.defaultMessage}</div>
                                </c:forEach>
                            </c:if>
                        </div>

                        <div>
                            <label for="ageId" class="col-form-label">Age</label>
                            <input type="number" id="ageId" name="age" value="${form.age}"
                                   class="form-control <c:if test="${bindingResult.hasFieldErrors('age')}">is-invalid</c:if>">
                            <c:if test="${bindingResult.hasFieldErrors('age')}">
                                <c:forEach items="${bindingResult.getFieldErrors('age')}" var="error">
                                    <div class="text-danger">${error.defaultMessage}</div>
                                </c:forEach>
                            </c:if>
                        </div>

                        <div>
                            <label for="descriptionId" class="col-form-label">Description</label>
                            <input type="text" id="descriptionId" name="description" value="${form.description}"
                                   class="form-control <c:if test="${bindingResult.hasFieldErrors('description')}">is-invalid</c:if>">
                            <c:if test="${bindingResult.hasFieldErrors('description')}">
                                <c:forEach items="${bindingResult.getFieldErrors('description')}" var="error">
                                    <div class="text-danger">${error.defaultMessage}</div>
                                </c:forEach>
                            </c:if>
                        </div>

                        <div>
                            <label for="imageUrlId" class="col-form-label">Image URL</label>
                            <input type="text" id="imageUrlId" name="imageUrl" value="${form.imageUrl}"
                                   class="form-control <c:if test="${bindingResult.hasFieldErrors('imageUrl')}">is-invalid</c:if>">
                            <c:if test="${bindingResult.hasFieldErrors('imageUrl')}">
                                <c:forEach items="${bindingResult.getFieldErrors('imageUrl')}" var="error">
                                    <div class="text-danger">${error.defaultMessage}</div>
                                </c:forEach>
                            </c:if>
                        </div>

                        <div>
                            <label for="userId" class="col-form-label">Owner</label>
                            <select id="userId" name="userId"
                                    class="form-control <c:if test="${bindingResult.hasFieldErrors('userId')}">is-invalid</c:if>">
                                <option value="0">- Select Owner -</option>
                                <c:forEach items="${users}" var="user">
                                    <option value="${user.id}"
                                            <c:if test="${user.id == form.userId}">selected</c:if>
                                    >${user.username}</option>
                                </c:forEach>
                            </select>
                            <c:if test="${bindingResult.hasFieldErrors('userId')}">
                                <c:forEach items="${bindingResult.getFieldErrors('userId')}" var="error">
                                    <div class="text-danger">${error.defaultMessage}</div>
                                </c:forEach>
                            </c:if>
                        </div>

                        <div class="mt-5">
                            <button type="submit" class="btn btn-success w-100">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp"/>
