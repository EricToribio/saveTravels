<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Title Here</title>
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
    <div class="card w-50 mx-auto p-4 ">
        <div class="d-flex justify-content-around pb-4">
            <h1>Expense Details</h1>
            <a href="/expense">Go Back</a>
        </div>
        <div class="col-7 mx-auto">
            <h2 class="pb-2">Expense Name: <c:out value = " ${expense.expenseName}"/></h2>
            <h3 class="pb-2"> Vendor :
                <c:out value = "${expense.vendor}"/>
            </h3>
            <h3 class="pb-2">Price : $
                <c:out value = "${expense.price}"/>
            </h3>
            <h3 class="pb-2">Description :
                <c:out value = "${expense.description}"/>
            </h3>
        </div>

    </div>  
   
</body>
</html>