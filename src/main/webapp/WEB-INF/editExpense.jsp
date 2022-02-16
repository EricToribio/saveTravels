<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- c:out ; c:forEach etc. -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!-- Formatting (dates) -->
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <meta charset="UTF-8">
                        <title>Edit Expense</title>
                        <!-- for Bootstrap CSS -->
                        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
                        <!-- YOUR own local CSS -->
                        <link rel="stylesheet" type="text/css" href="/css/style.css">
                        <!-- For any Bootstrap that uses JS or jQuery-->
                        <script src="/webjars/jquery/jquery.min.js"></script>
                        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                        <!-- YOUR own local JS -->
                        <script type="text/javascript" src="/js/app.js"></script>
                    </head>
                    <body>
                        <!-- Enter body here -->
                        <div class="">
                            <div class="d-flex justify-content-around align-items-center">
                                <h2 class="text-center mb-4 ">Edit Expense</h2>
                                
                                <div>
                                    <a href="/expense">Go Back</a>
                                </div>
                            </div>
                            <form:form action="/expense/update/${expense.id}" method="post" modelAttribute="expense"
                                class="card  p-3 mx-auto col-3">
                                <input type="hidden" name="_method" value="put">
                                <div class="form-group ">
                                    <form:label class="form-label" path="expenseName">Expense Name</form:label>
                                    <form:errors path="expenseName" />
                                    <form:input class="form-control " path="expenseName" />
                                </div>
                                <div class="form-group ">
                                    <form:label class="form-label" path="vendor">Vendor</form:label>
                                    <form:errors path="vendor" />
                                    <form:input class="form-control " path="vendor" />
                                </div>
                                <div class="form-group">
                                    <form:label class="form-label" path="price">Price $</form:label>
                                    <form:errors path="price" />
                                    <form:input type="number" min="1" step="any" class="form-control " path="price" />
                                </div>
                                <div class="form-group ">
                                    <form:label class="form-label" path="description">Description</form:label>
                                    <form:errors path="description" />
                                    <form:textarea class=" form-control" path="description" />
                                </div>
                                <div class="col-3">
                                    <button class="btn btn-success">Update</button>
                                </div>
                            </form:form>
                        </div>

                    </body>

                    </html>