<%@include file="header.jsp"%>

	<nav>
		<a href="<c:url value="/welcome" />" id="hp-id"> Головна сторінка </a>
		<a href="<c:url value="/profile" />" id="hp-id"> Кабінет користувача </a>
		<a href="<c:url value="/questionary" />" id="hp-id" class = "active"> Анкети </a>
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
		<sec:authorize access="hasRole('lecturer')">
			<span class="pull-left" style="margin-top: 2%"> <button style="font-size: 130%;"
						data-original-title="Questionary" data-toggle="modal" 
						class="btn btn-sm btn-warning" data-target=".bs-example-modal-lg"><i
							class="glyphicon glyphicon-registration-mark"> Додати</i></button>
			</span>
		</sec:authorize>
		
		<div class="container" style="width: 80%; margin: 10% auto;">
			<h2>Список анкет</h2>
			
			<ul>
				<c:forEach items="${questions}" var="question">
					<li>
						<a href="${question.questionary}" target="_blank" style="background-color: #6B8E23;
    color: white; margin:5px; text-align: center; text-decoration: none; display: inline-block;">${question.name}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</section>
</main>

<!-- Questionary form -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
        	<h4 class="modal-title" align="center">Додавання посилання на анкету</h4>
      	</div>
      	
      	<div class="modal-body" align="center">
      		<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="newQuestion">
						<div class="form-group">
							<label for="question" class="cols-sm-2 control-label">Анкета: </label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
									<input type="text" class="form-control" name="question" id="question"  placeholder="Введіть посилання" required/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Назва: </label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-bitcoin"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="Введіть назву" required/>
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
	
<%@include file="footer.jsp"%>