<%@include file="header.jsp"%>

	<nav>
		<a href="<c:url value="/welcome" />" id="hp-id"> Головна сторінка </a>
		<a href="<c:url value="/profile" />" id="hp-id"> Кабінет користувача </a>
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
		
		<div id="login-style" style="width: 60%; margin-top: 2%; margin: 0 auto;">
			<div style="text-align: center;">
					<!--If login or password is incorrect-->
					<c:if test="${not empty msg}">
						<div class="alert alert-danger" role="alert">
							<span class="glyphicon glyphicon-exclamation-sign"
								aria-hidden="true"></span> <span class="sr-only">Помилка:</span>
							${msg}
						</div>
					</c:if>
					<c:if test="${not empty reg}">
						<div class="alert alert-success" role="alert">
							<span class="glyphicon glyphicon-ok"
								aria-hidden="true"></span> <span class="sr-only"></span>
							${reg}
						</div>
					</c:if>
					<form class="form-signin" role="form" name='myform'
						action="j_spring_security_check" method='POST'>
						<h2 class="form-signin-heading">Авторизація</h2>
						
						<input type="email" name="username" class="form-control"
							maxlength="320" placeholder="логін" required>
						<input type="password" name="password" class="form-control"
							placeholder="пароль" required><label class="checkbox">
							<c:if test="${empty msg}">
								<input id="remember_me" type="checkbox" name="_spring_security_remember_me" value="true"> Запам'ятати мене
	                        </c:if> <c:if test="${not empty msg}">
								<input id="remember_me" type="checkbox" name="_spring_security_remember_me" value="true" autofocus> Запам'ятати мене
	                        </c:if>
						</label>
						
						<button class="btn btn-lg btn-primary btn-block" name="Submit"
							value="Login" type="submit">Увійти</button>
					</form>
					<button style="font-size: 130%;"
					data-original-title="Registration" data-toggle="modal" 
					class="btn btn-sm btn-warning" data-target=".bs-example-modal-lg"><i
						class="glyphicon glyphicon-registration-mark">Реєстрація</i></button>
			</div>
		</div>
	
	</section>
</main>

<!-- Registration form -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
        	<h4 class="modal-title" align="center">Реєстрація</h4>
      	</div>
      	
      	<div class="modal-body" align="center">
      		<div class="main-login main-center">
					<form class="form-horizontal" onsubmit="return checkForm();" method="post" action="registration">
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Емейл</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="Введіть ваш емейл" required/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Пароль</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Введіть пароль" required/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Підтвердження пароля</label>
							<div class="cols-sm-10">
								<div class="input-group">
								<div id="divP">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Введіть пароль ще раз" required/>
								</div>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Ім'я</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="Введіть ваше ім'я" required/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Прізвище</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="surname" id="surname"  placeholder="Введіть ваше прізвище" required/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="phone" class="cols-sm-2 control-label">Телефон</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-phone" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="phone" id="phone"  placeholder="Введіть ваш телефон" required/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="role" class="cols-sm-2 control-label">Роль</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-time" aria-hidden="true"></i></span>
									<select name="role" id="role" required>
									  	<option value="student">Студент</option>
									  	<option value="stakeholder">Стейкхолдер</option>
									  	<option value="lecturer">Викладач</option>
									  	<option value="university">Співробітник університету</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="form-group ">
							<input type="submit" class="btn btn-primary btn-lg btn-block login-button"
						value="Підтвердити">
						</div>
					</form>
			</div>
      	</div>
      	
      	<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Відміна</button>
        </div>
      
    </div>
  </div>
</div>

<script>
		function checkForm() {
			if (document.getElementById('password').value != ""
				&& document.getElementById('password').value != document
						.getElementById('confirm').value) {

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
		}
<%@include file="footer.jsp"%>