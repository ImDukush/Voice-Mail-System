<%
	if(session.getAttribute("uname")==null)
	{
		response.sendRedirect("login.jsp");
	}
	else
	{
%>
<html>
<head>
<title>UPLOAD</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style type="text/css">.thumb-image{float:center;width:500px;height:200px;position:relative;padding:5px;}</style>
	<link rel="stylesheet" href="css_lib/w3.css">
	<script src="js/ajex_js.js"></script>
<head>
<body background="themes/lite.jpg">
<header class="w3-container w3-teal" style="width:100%;">
		<h3><b>HI <%=session.getAttribute("name")%></b></h3>
</header>
<div class="w3-card-4" style="width:100%;height:86.5%;">
	<div class="w3-container">
	<div class="w3-card-4" style="width:80%;height:80%;margin-left:10%;margin-top:4%;">
		<div class="w3-container">
		<center><br>
		<center><br>
				<b style="color:red;font-size:20pt;">UPLOAD YOUR COVER PHOTO HERE...</b>
				<br>
				<form name="upload" method="post" enctype="multipart/form-data" action="uploadcover.jsp"> 
					<br>
					<br>
					<b>UPLOAD COVER PHOTO</b>
					<br>
					<div id="wrapper" style="margin-top: 20px;">
						<input id="fileUpload" class="w3-btn w3-orange w3-round" multiple="multiple" type="file" name="cover"/> 
						<br>
						<br>
						<div id="image-holder"></div>
					</div>
					<br>
					<input type="submit" class="w3-btn w3-round-large w3-blue" name="update_cover" value="UPDATE" />
					<a href="settings.jsp" class="w3-btn w3-round-large w3-blue">SKIP</a>				
				</form> 
		</center>
		</div>
	</div>
	</div>
</div>
<footer class="w3-container w3-brown">
	<center>
		<nav class="w3-topnav w3-brown">
		  <a href="homepage.jsp">HOME</a>
		</nav>
	</center>
	</footer>
	
	<!-- For Image Preview -->


<script>
$(document).ready(function() {
        $("#fileUpload").on('change', function() {
          //Get count of selected files
          var countFiles = $(this)[0].files.length;
          var imgPath = $(this)[0].value;
          var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
          var image_holder = $("#image-holder");
          image_holder.empty();
          if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
            if (typeof(FileReader) != "undefined") {
              //loop for each file selected for uploaded.
              for (var i = 0; i < countFiles; i++) 
              {
                var reader = new FileReader();
                reader.onload = function(e) {
                  $("<img />", {
                    "src": e.target.result,
                    "class": "thumb-image"
                  }).appendTo(image_holder);
                }
                image_holder.show();
                reader.readAsDataURL($(this)[0].files[i]);
              }
            } else {
              alert("This browser does not support FileReader.");
            }
          } else {
            alert("Pls select only images");
          }
        });
      });
</script>
</body>
</html>		
<%
	}
%>