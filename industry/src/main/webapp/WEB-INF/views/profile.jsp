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
		<div class="container" style="width: 80%; margin: 10% auto;">
			<div class="panel panel-info">
				<div class="panel-heading">
					<label>${user.name} ${user.surname}</label>
					<span class="pull-right"> <a href="<c:url value="/profile/edit/id/${user.id_user}" />"
						data-original-title="Edit" data-toggle="tooltip"
						type="button" class="btn btn-sm btn-warning"><i
							class="glyphicon glyphicon-edit"></i></a>
					</span>
				</div>
				
				<div class="panel-body">
					<div>
						<table style="width: 100%;">
							<tbody>
								<tr>
									<td>Поштова скринька:</td>
									<td>${user.email}</td>
								</tr>
								<tr>
									<td>Роль:</td>
									<td>${user.role}</td>
								</tr>
								<tr>
									<td>Номер телефону:</td>
									<td>${user.phone_number}</td>
								</tr>
								
								<sec:authorize access="hasRole('student')">
									<tr>
										<td>Власне оцінювання за критеріями стейкхолдерів:</td>
										<td><button style="font-size: 130%;"
						data-original-title="Tickets" data-toggle="modal" 
						class="btn btn-sm btn-info" data-target=".bs-example-modal-lg""><i
							class="glyphicon glyphicon-qrcode">  Оцінити</i></button></td>
									</tr>
									</sec:authorize>
								
								<sec:authorize access="hasRole('lecturer')">
									<tr>
										<td>Оцінювання студентів:</td>
										<td><button style="font-size: 130%;"
						data-original-title="Tickets" data-toggle="modal" 
						class="btn btn-sm btn-info" data-target=".bs-example-modal-lg1"><i
							class="glyphicon glyphicon-qrcode">  Оцінити</i></button></td>
									</tr>
								</sec:authorize>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>

<!-- Оцінювання студентом -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
        	<h4 class="modal-title" align="center">Оцінювання</h4>
      	</div>
      	
      	<div class="modal-body" align="center">
      		<table id="myTable">
      			<tr>
      				<td>Java</td>
      				<td><input type="range" name="points" min="0" max="100" value="50" id="java" step="1" oninput="outputUpdate1(value)">
      				<output for="java" id="volume1">50</output>
					</td>
      			</tr>
      			<tr>
      				<td>PHP</td>
      				<td><input type="range" name="points" min="0" max="100" value="50" id="php" step="1" oninput="outputUpdate2(value)">
      				<output for="php" id="volume2">50</output>
					</td>
      			</tr>
      			<tr>
      				<td>QA</td>
      				<td><input type="range" name="points" min="0" max="100" value="50" id="qa" step="1" oninput="outputUpdate3(value)">
      				<output for="qa" id="volume3">50</output>
					</td>
      			</tr>
      			<tr>
      				<td>SQL</td>
      				<td><input type="range" name="points" min="0" max="100" value="50" id="sql" step="1" oninput="outputUpdate4(value)">
      				<output for="sql" id="volume4">50</output>
					</td>
      			</tr>
      		</table>
			<a href="#" id="hp-id" class="btn btn-sm btn-success"><i
							class="glyphicon glyphicon-flag"> Зберегти</i></a>
      	</div>
      
      	<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Назад</button>
        </div>
    </div>
  </div>
</div>

<!-- Оцінювання викладачем -->
<div class="modal fade bs-example-modal-lg1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    
    	<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal">&times;</button>
        	<h4 class="modal-title" align="center">Оцінювання</h4>
      	</div>
      	
      	<div class="modal-body" align="center">
      	
      		<button id="UPP" onclick="visibilityTrue1()"
			class="btn btn-sm btn-info"><i class="glyphicon glyphicon-plus"></i> УПП</button>
			<div id="UPP1" style="visibility: hidden;">
				<button onclick="visibilityFalse1()"
				class="btn btn-sm btn-info"><i class="glyphicon glyphicon-plus"></i> Приховати</button>
				<table>
					<thead>
						<tr>
							<th style="text-align:center;">Студент</th>
							<th style="text-align:center;">Оцінка</th>
						</tr>
					</thead>
					<c:forEach items="${users}" var="myUser">
						<tr>
							<td>
								${myUser.name} ${myUser.surname}
							</td>
							<td>
								<input type="number" name="quantity" min="1" max="100">
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br />
			
			<button id="lab" onclick="visibilityTrue2()"
			class="btn btn-sm btn-info"><i class="glyphicon glyphicon-plus"></i> Проект "Лабораторія"</button>
			<div id="lab1" style="visibility: hidden;">
				<button onclick="visibilityFalse2()"
				class="btn btn-sm btn-info"><i class="glyphicon glyphicon-plus"></i> Приховати</button>
				<table>
					<thead>
						<tr>
							<th style="text-align:center;">Студент</th>
							<th style="text-align:center;">Оцінка</th>
						</tr>
					</thead>
					<c:forEach items="${users}" var="myUser">
						<tr>
							<td>
								${myUser.name} ${myUser.surname}
							</td>
							<td>
								<input type="number" name="quantity" min="1" max="100">
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
      	</div>
      
      	<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Назад</button>
        </div>
    </div>
  </div>
</div>

<script>
	function outputUpdate1(vol) {
		document.querySelector('#volume1').value = vol;
	}
	function outputUpdate2(vol) {
		document.querySelector('#volume2').value = vol;
	}
	function outputUpdate3(vol) {
		document.querySelector('#volume3').value = vol;
	}
	function outputUpdate4(vol) {
		document.querySelector('#volume4').value = vol;
	}
	
	function visibilityTrue1(){
		document.getElementById("UPP").style.visibility = "hidden";
		document.getElementById("UPP1").style.visibility = "visible";
	}
	function visibilityFalse1(){
		document.getElementById("UPP").style.visibility = "visible";
		document.getElementById("UPP1").style.visibility = "hidden";
	}
	function visibilityTrue2(){
		document.getElementById("lab").style.visibility = "hidden";
		document.getElementById("lab1").style.visibility = "visible";
	}
	function visibilityFalse2(){
		document.getElementById("lab").style.visibility = "visible";
		document.getElementById("lab1").style.visibility = "hidden";
	}

</script>

<%@include file="footer.jsp"%>