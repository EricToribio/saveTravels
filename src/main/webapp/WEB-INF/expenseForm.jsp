<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
				<link rel="stylesheet" type="text/css" href="/css/style.css">
			</head>

			<body>
				<div class="p-3">
					<div class="col-3 mx-auto">
						<table class=" table table-border table-striped mx-auto">
							<thead>
								<tr>
									<th>Expense</th>
									<th>Vendor</th>
									<th>Amount</th>
									<th>Actions</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="expense" items="${expenses}">
									<tr class="">
										<td>
											<a href="/expense/${expense.id}"><c:out value="${expense.expenseName }" /></a>
										</td>
										<td>
											<c:out value="${expense.vendor}" />
										</td>
										<td >$
											<c:out value="${expense.price }" />
										</td>
										<td class="">
											<div class="d-flex gap-2" >
												<a href="/expense/edit/${expense.id}">edit</a>
												<form action="/expense/delete/${expense.id}" method="post">
													<input type="hidden" name="_method" value="delete">
													<input class="btn btn-danger btn-sm" type="submit" value="Delete">
												</form>
											</div>
										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="">
						<form:form action="/expense/data" method="post" modelAttribute="expense"
							class="card  p-3 mx-auto col-3">
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
								<button class="btn btn-success">Submit</button>
							</div>
						</form:form>
					</div>
				</div>

			</body>

			</html>