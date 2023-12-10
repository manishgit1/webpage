<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
</head>
<body>

       <input type="hidden" id="status" value="<%= request.getAttribute("status")   %>">

	<div class="main">

		<!--  Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
					      <h3 id="msg"></h3>
						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Confirm your password" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button ">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
							
							
							
				
							
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/R.png" alt="sign up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->

   <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

	
	
	
	
	
	
	
	
	<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('register-form').addEventListener('submit', function (event) {
            event.preventDefault(); // Prevent the form from submitting by default

            // Get form input values
            var name = document.getElementById('name').value.trim();
            var email = document.getElementById('email').value.trim();
            var pass = document.getElementById('pass').value.trim();
            var rePass = document.getElementById('re_pass').value.trim();
            var contact = document.getElementById('contact').value.trim();
            var agreeTerm = document.getElementById('agree-term').checked;

            // Validation checks
            if (name === '') {
                alert('Please enter your name.');
                return false;
            }

            if (email === '') {
                alert('Please enter your email.');
                return false;
            } else if (!isValidEmail(email)) {
                alert('Please enter a valid email address.');
                return false;
            }

            if (pass === '') {
                alert('Please enter a password.');
                return false;
            } else if (pass.length < 6) {
                alert('Password should be at least 6 characters long.');
                return false;
            }

            if (rePass === '') {
                alert('Please confirm your password.');
                return false;
            } else if (pass !== rePass) {
                alert('Passwords do not match.');
                return false;
            }

            if (contact === '') {
                alert('Please enter your contact number.');
                return false;
            } else if (!isValidContact(contact)) {
                alert('Please enter a valid contact number.');
                return false;
            }

            if (!agreeTerm) {
                alert('Please agree to the terms of service.');
                return false;
            }

            // If all validations pass, submit the form
            
              swal("Account Created successfully!!");
                this.submit();
           
    	    
        });
    });

    // Email validation function
    function isValidEmail(email) {
        // Regular expression for email validation
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    // Contact number validation function (assumed to be 10-digit number)
    function isValidContact(contact) {
        var contactRegex = /^\d{10}$/;
        return contactRegex.test(contact);
    }
</script>

	
	
	    	
	   
	  
	</script> 
	
	<!-- <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	
	
	    <script>
	     $(document).ready(function(){
			 console.log("page is ready...")
			   
			 
			 $("#register-form").on('submit', function(event){
				  event.preventDefault();
				  
				 var f = $(this).serialize();
				 // let f = new FormData(this);
				 
				  console.log(f);
				  
				 // $(".loader").show();
				  //$(".form").hide();
				  
				  
		    $.ajax({
				 url: "register",
				 data: f,
				 type: 'POST',
				 success: function (data, textStatus, jqXHR){
					  console.log(data);
					  console.log("success");
					  //  $(".loader").hide();
				      //   $(".form").show();
				         
				      if(data.trim() === 'done'){
						  $('#msg').html("Successfully Registered!!")
						  $('#msg').addClass('green-text')
					  }
					   else{
						    $('#msg').html("Something went wrong on server...!!")
						    $('#msg').addClass('red-text')
					   }   
				 },
			
			 error: function(jqXHR,textStatus, errorThrown){
				     console.log(data);
				     console.log("error...")
				     
			 },
			 processData:false,
			 contentType:false
			 
				  
			 })
		 })
		 
		 })
	   
   </script>
   
    -->
	
	
	
	


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>