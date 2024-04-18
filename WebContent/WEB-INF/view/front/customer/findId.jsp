<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<script>
		function findIdSubmit(form) {
			var cst_nm = form.cst_nm.value.trim();
			var cst_email = form.cst_email.value.trim();
	
			if (cst_nm.length == 0) {
				alert('이름을 입력해주세요');
				form.cst_nm.focus();
				return false;
			}
	
			if (cst_email.length == 0) {
				alert('이메일을 입력해주세요');
				form.cst_email.focus();
				return false;
			}
			form.submit();
		}
	</script>
</head>
<body>
	<div class="container">
		<form id="frmMain" action="/front/customer/findIdresult.web" method="POST" >
		<header>
			<%@ include file="/include/front/top.jsp" %>
		</header>
			<section class="content">
				<article style="margin-top:50px; text-align: center">
				<h1 style="display: block; width: 100%; text-align: center">아이디 찾기</h1><br/>
				<a href="/front/customer/findId.web">아이디찾기</a>	
				<a href="/front/customer/findPw.web">비밀번호찾기</a>
				<p>가입하신 이름과 이메일을 입력해주세요.</p>
			<table class="type_02" style="width: 300px; margin-left: auto; margin-right: auto; margin-top:30px;">
				<tr>
				<th>이름</th>	
					<td>
						<input type="text" name="cst_nm" id="cst_nm" placeholder="이름">	
					</td>
				</tr>
				<tr>
				<th>이메일</th>
					<td>
						<input type="email" name="cst_email" id="cst_email" placeholder="이메일">	
					</td>
				</tr>
			</table>
			<a href="/front/login/loginForm.web">뒤로가기</a>
			<button id="checkData" style="margin-bottom: 50px;" onclick="return findIdSubmit(this.form);">아이디 찾기</button>
		</article>
		<aside></aside>
	</section>
	</form>
</div>
	<footer>
		<%@ include file="/include/footer.jsp" %>
	</footer>
</body>
</html>