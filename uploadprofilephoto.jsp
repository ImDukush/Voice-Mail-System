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
	<style type="text/css">.thumb-image{float:center;width:150px;height:150px;position:relative;padding:5px;}</style>
	<link rel="stylesheet" href="css_lib/w3.css">
	<script src="js/ajex_js.js"></script> 	
<head>
<body background="themes/white.jpg">
<header class="w3-container w3-teal" style="width:100%;">
		<h3><b>HI <%=session.getAttribute("name")%></b></h3>
</header>
<div class="w3-card-4" style="width:100%;height:86.5%;">
	<div class="w3-container">
	<div class="w3-card-4" style="width:80%;height:75%;margin-left:10%;margin-top:5%;">
		<div class="w3-container">
		<center><br>
		<center><br>
				<b style="color:red;font-size:20pt;">UPLOAD YOUR PROFILE PHOTO HERE...</b>
				<br>
				<form name="upload" method="post" enctype="multipart/form-data" action="uploadprofile.jsp"> 
					<br>
					<b>UPLOAD PROFILE PHOTO</b>
					<br>
					<div id="wrapper" style="margin-top: 20px;">
						<input id="fileUpload" name="profile" class="w3-btn w3-round w3-orange" multiple="multiple" type="file"/> 
						<br>
						<br>
						<div id="image-holder"></div>
					</div>
					<br>
					<br>
					<input type="submit" class="w3-btn w3-round-large w3-blue" name="upload_profile" value="UPLOAD" />	
					<a href="uploadcoverphoto.jsp" class="w3-btn w3-round-large w3-blue">SKIP</a>
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