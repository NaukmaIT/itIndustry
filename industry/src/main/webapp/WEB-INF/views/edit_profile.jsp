<%@include file="header.jsp"%>

	<nav>
		<a href="<c:url value="/welcome" />" id="hp-id"> Головна сторінка </a>
		<a href="<c:url value="/profile" />" id="hp-id" class = "active"> Кабінет користувача </a>
		<a href="<c:url value="/questionary" />" id="hp-id"> Анкети </a>
		<a href="<c:url value="/curriculum" />" id="hp-id"> Навчальні плани </a>
	</nav>
	
</header>

<main>
	<aside class = "left">
			<br />
			<a href="http://ua.korrespondent.net/tag/47991/" target="_blank"><img class="myImage" src="<c:url value="/resources/img/ukraine.png" />" alt="UZ"/> </a>
			<br />
			<canvas id="canvas" height="200" style="margin-left: 10%">
			</canvas>
	</aside>
	
	<section class = "right">
		<span class="pull-left" style="margin-top: 2%"> <a href="<c:url value="/profile" />"
			data-original-title="Back" data-toggle="tooltip" type="button"
			class="btn btn-sm btn-info"><font size="3"><i
					class="glyphicon glyphicon-arrow-left"></i> Назад</font></a>
		</span>
		
		<div class="container" style="width: 80%; margin: 10% auto;">
			<h1 align="center">Редагувати профіль</h1>
			<hr size="5" />
			
			<div class="row">
				<c:url var="saveUrl" value="/profile/edit/id/${user.id_user}" />
				
				<form:form class="form-horizontal" onsubmit="return checkForm();"
				acceptCharset="utf-8" modelAttribute="user" action="${saveUrl}"
				method='POST'>
					<div align="center">
					
					<form:input path="role" style="width: 50%;" type="hidden"
						class="form-control" required="true" />
					<form:input path="email" style="width: 50%;" type="hidden"
						class="form-control" required="true" />
					
						<form:label path="name">Ім'я:</form:label>
						<div>
							<form:input path="name" style="width: 50%;" type="text"
								class="form-control" maxlength="32" required="true" />
						</div>
						<br />
						
						<form:label path="surname">Прізвище:</form:label>
						<div>
							<form:input path="surname" style="width: 50%;" type="text"
								class="form-control" maxlength="32" required="true" />
						</div>
						<br />
						
						<c:if test="${empty notMatch}">
							<form:label path="password">Старий пароль:</form:label>
							<div id="divO">
								<form:input path="password" id="oldPass" style="width: 50%;"
									type="password" class="form-control" value="" />
							</div>
						</c:if>

						<c:if test="${not empty notMatch}">
							<form:label path="password">Старий пароль:</form:label>
							<div id="divO" class="form-group has-error has-feedback">
								<form:input path="password" id="oldPass" style="width: 50%;"
									type="password" class="form-control" value="" />
								<span class="glyphicon glyphicon-remove form-control-feedback"
									style="width: 50%;"></span>
								<p style="color: red;">${notMatch}</p>
							</div>
						</c:if>
						<br />
						
						<label>Новий пароль:</label>
						<div>
							<input type="password" style="width: 50%;" class="form-control"
								id="pass" name="pass" />
						</div>
						<br />
						<label>Підтвердження пароля:</label>
						<div id="divP">
							<input type="password" style="width: 50%;" class="form-control"
								id="confirmPassword" name="confirmPassword" />
						</div>
						
						<br />
						<form:label path="phone_number">Телефон:</form:label>
						<div>
							<form:input path="phone_number" style="width: 50%;" type="text"
								class="form-control" maxlength="32" required="true" />
						</div>
						<br />
						
						<br /> <input type="submit" class="btn btn-primary"
						value="Зберегти зміни">
					</div>
				</form:form>
			</div>
		</div>
	</section>
</main>

<script>
		function checkForm() {

			if (document.getElementById('oldPass').value == "") {
				var para = document.createElement("p");
				var message = document
						.createTextNode("Ви повинні вказати свій пароль для підтвердження змін");
				para.setAttribute("style", "color: red");
				para.appendChild(message);

				$('#divO p').remove();

				var element = document.getElementById("divO");
				element.appendChild(para);
				return false;
			}

			if (document.getElementById('pass').value != ""
					&& document.getElementById('pass').value != document
							.getElementById('confirmPassword').value) {

				var span = document.createElement("span");
				span.setAttribute("class",
						"glyphicon glyphicon-remove form-control-feedback");
				span.setAttribute("style", "width: 50%;");
				var para = document.createElement("p");
				var message = document
						.createTextNode("Паролі не співпадають!");
				para.setAttribute("style", "color: red");
				para.appendChild(message);

				$('#divP p').remove();

				var element = document.getElementById("divP");
				element.setAttribute("class",
						"form-group has-error has-feedback");
				element.appendChild(span);
				element.appendChild(para);
				return false;
			}
			return true;
		}
	</script>
<%@include file="footer.jsp"%>