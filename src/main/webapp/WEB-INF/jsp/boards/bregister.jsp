<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/template/header.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/template/navbar.jsp"></jsp:include>
	<div class="panel-heading">Register Page</div>
	<div class="panel-body">
		<form action="./bregister" method="post">
			<div class="form-group">
				<label>Title</label> 
				<input class="form-control" name="title" value="${vo.title}" />
				<p class="help-block">Title text here.</p>
			</div>

			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" rows="3" name='content'>${vo.content}</textarea>
			</div>
			<sec:authentication var="principal" property="principal"/>
			<c:set var="member" value="${principal.member}"/>
			<div class="form-group">
				<label>Writer</label>
				<input class="form-control" name="writer" value="${member.uid}" readonly="readonly"/>
			</div>
			<button type="submit" class="btn btn-default">Submit Button</button>
			<button type="reset" class="btn btn-primary">Reset Button</button>
		</form>
	</div>	
	<jsp:include page="/WEB-INF/jsp/template/footer.jsp"></jsp:include>
</body>
</html>