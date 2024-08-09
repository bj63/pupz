<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="for" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="../include/header.jsp" />

<section class="bg-secondary">
    <div class="container">
        <div class="row py-5">
            <h1 class="text-center text-white">Create Account</h1>
        </div>
    </div>
</section>
    <div class="container">
        <div class="row pt-5 pb-5">
                        <form action="/account/create-account" method="post">

                            <spring:hasBindErrors name="createAccountForm">
                                <div class="alert alert-danger" role="alert">
                                    <form:errors path="*" />
                                </div>
                            </spring:hasBindErrors>

                            <!-- Email Input Field -->
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-2">
                                        <label for="usernameId" class="col-form-label">Email</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text" id="usernameId" name="username" class="form-control <c:if test="${bindingResult.hasFieldErrors('email')}">is-invalid</c:if>"
                                               value="${form.email}">
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


                                <!-- password input field -->
                                <div class="row align-items-center justify-content-center pt-3">
                                    <div class="col-2">
                                        <label for="passwordId" class="col-form-label">Password</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text"
                                               id="passwordId"
                                               name="password"
                                               class="form-control <c:if test="${bindingResult.hasFieldErrors('password')}">is-invalid</c:if>"
                                               value="${form.password}">
                                    </div>
                                </div>
                                <c:if test="${bindingResult.hasFieldErrors('password')}">
                                <div class="row align-items-center justify-content-center">
                                    <div class="offset-2 col-4">
                                        <div style="color:red">
                                            <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                                                ${error.defaultMessage}<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                </c:if>

                                <div class="row align-items-center justify-content-center pt-3">
                                    <div class="col-2">
                                        <label for="username" class="col-form-label">Username</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text"
                                               id="username"
                                               name="username"
                                               class="form-control <c:if test="${bindingResult.hasFieldErrors('username')}">is-invalid</c:if>"
                                               value="${form.username}">
                                    </div>
                                </div>
                                <c:if test="${bindingResult.hasFieldErrors('username')}">
                                <div class="row align-items-center justify-content-center">
                                    <div class="offset-2 col-4">
                                        <div style="color:red">
                                            <c:forEach items="${bindingResult.getFieldErrors('username')}" var="error">
                                                ${error.defaultMessage}<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                </c:if>

                                <div class="row align-items-center justify-content-center pt-3">
                                    <div class="col-2">
                                        <label for="name" class="col-form-label">Name</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text"
                                               id="name"
                                               name="name"
                                               class="form-control <c:if test="${bindingResult.hasFieldErrors('name')}">is-invalid</c:if>"
                                               value="${form.name}">
                                    </div>
                                </div>
                                <c:if test="${bindingResult.hasFieldErrors('name')}">
                                <div class="row align-items-center justify-content-center">
                                    <div class="offset-2 col-4">
                                        <div style="color:red">
                                            <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
                                                ${error.defaultMessage}<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                </c:if>

                                <div class="row align-items-center justify-content-center pt-3">
                                    <div class="col-2">
                                        <label for="surname" class="col-form-label">Surname</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text"
                                               id="surname"
                                               name="surname"
                                               class="form-control <c:if test="${bindingResult.hasFieldErrors('surname')}">is-invalid</c:if>"
                                               value="${form.surname}">
                                    </div>
                                </div>
                                <c:if test="${bindingResult.hasFieldErrors('surname')}">
                                <div class="row align-items-center justify-content-center">
                                    <div class="offset-2 col-4">
                                        <div style="color:red">
                                            <c:forEach items="${bindingResult.getFieldErrors('surname')}" var="error">
                                                ${error.defaultMessage}<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                </c:if>

                                <div class="row align-items-center justify-content-center pt-3">
                                    <div class="col-2">
                                        <label for="age" class="col-form-label">Age</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="number"
                                               id="age"
                                               name="age"
                                               class="form-control <c:if test="${bindingResult.hasFieldErrors('age')}">is-invalid</c:if>"
                                               value="${form.age}">
                                    </div>
                                </div>
                                <c:if test="${bindingResult.hasFieldErrors('age')}">
                                <div class="row align-items-center justify-content-center">
                                    <div class="offset-2 col-4">
                                        <div style="color:red">
                                            <c:forEach items="${bindingResult.getFieldErrors('age')}" var="error">
                                                ${error.defaultMessage}<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                </c:if>

                                <div class="row align-items-center justify-content-center pt-3">
                                    <div class="col-2">
                                        <label for="country" class="col-form-label">Country</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text"
                                               id="country"
                                               name="country"
                                               class="form-control <c:if test="${bindingResult.hasFieldErrors('country')}">is-invalid</c:if>"
                                               value="${form.country}">
                                    </div>
                                </div>
                                <c:if test="${bindingResult.hasFieldErrors('country')}">
                                <div class="row align-items-center justify-content-center">
                                    <div class="offset-2 col-4">
                                        <div style="color:red">
                                            <c:forEach items="${bindingResult.getFieldErrors('country')}" var="error">
                                                ${error.defaultMessage}<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                                <div class="row align-items-center justify-content-center pt-3">
                                    <div class="col-2">
                                        <div class="mb-3">
                                            <label for="exampleInputImageURL" class="form-label">Image URL</label>
                                            <input type="text" name="imageUrl" class="form-control" id="exampleInputImageUrl" value="${form.imageUrl}">
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${bindingResult.hasFieldErrors('imageUrl')}">
                                <div class="row">
                                    <div class="col-6 mb-3">
                                        <div class="text-danger">
                                            <c:forEach items="${bindingResult.getFieldErrors('imageUrl')}" var="error">
                                                ${error.defaultMessage}<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                </c:if>



                                <div class="text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp" />


