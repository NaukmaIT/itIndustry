<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="false"%>
<html>
<head>
  <title>${title}</title>

  <!-- Bootstrap Core CSS -->
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">

</head>
<body>
<header id="top">
  <div class="text-vertical-center">
    <h1 style="text-align:center;"> ${head}</h1>
    <br/>
    <div style="text-align:center;">
    	 <img src="${img}" alt="IT"/>
    </div>
    <br>
    
    <div id="main-button" style="text-align:center;">
      <a href="<c:url value="/welcome"/>" class="btn btn-dark btn-lg" style="text-align:center;">Повернутися на головну сторінку</a>
    </div>
  </div>
</header>
</body>
</html>