<%@include file="header.jsp"%>

	<nav>
		<a href="<c:url value="/welcome" />" id="hp-id" class = "active"> Головна сторінка </a>
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
		<h2>Вітаємо на нашому сайті!</h2>
		<p>
			IT! - система призначеня для покращення процесу навчання в університеті та спрощення подальшого пошуку роботи магістрами.<br />
			Система дозволить покращити компетентності студентів (досвід, уміння, навички, автономність, комунікації).<br />
			Також IT! дасть змогу покращити навчальні плани відповідно до вимог стейкхолдерів.<br />
			Щасливої дороги в світ ІТ-індустрії України!
		</p>
	</section>
</main>
<%@include file="footer.jsp"%>