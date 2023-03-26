<?php
	if (is_array($_POST) && !empty($_POST)) {

		if( !isset($_POST['name']) || !isset($_POST['birthday']) || !isset($_POST['age']) || !isset($_POST['email']) || !isset($_POST['phone']) || !isset($_POST['username']) || !isset($_POST['password'])) {

			$error = " Please fill out the first four fields before submitting ";
			}



	if( isset($error) )

	{

		echo '<p style="color: red">Error: ' . $error .'</p>';

	}

	else

	{

		// create the connection

		$con = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DATABASE);

		if(!$con)

		{

			exit("<p> Connection Error: " .  mysqli_connect_error() . "</p>");

		}

		//initialize the statement

		$stmt = mysqli_stmt_init($con);

		if(!$stmt)

		{

			exit("<pm> Failed to prepare statement bottom 1</p>");

		}


		foreach( $_POST as $key => $value )

		{

			$_POST[$key] = mysqli_real_escape_string($con, $value);

		}

		$query = "INSERT INTO Users ( name, birthday, age, email, phone, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";

		if( !mysqli_stmt_prepare($stmt, $query) )

		{

			exit("<p>Failed to prepare statement bottom</p>");

		}

		mysqli_stmt_bind_param($stmt, "sssssss", $_POST['name'], $_POST['birthday'], $_POST['age'], $_POST['email'], $_POST['phone'], $_POST['username'], $_POST['password']); //changed final

		if( !mysqli_stmt_execute($stmt) )

		{

			$error = "Failed to insert course.";

		}

		mysqli_stmt_close($stmt);

		mysqli_close($con);
	

	}

}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Freelancer - Start Bootstrap Theme</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>

<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="#page-top">Nomads Lands</a>
            <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="index.html">Home</a></li>
                </ul>
            </div>
        </div>
    </nav>
     <!-- Contact Section-->
     <section class="page-section mt-5">
        <div class="container">
            <!-- Contact Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Sign Up</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <!-- Contact Section Form-->
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <form id="form" action="signup.php" method="post">
                        <!-- Name input-->
                        <div class="form-floating mb-3">
                            <input name="name" class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                            <label for="name">Full name</label>
                            <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                        </div>
                        <!-- Birthday input -->
                        <div class="form-floating mb-3">
                            <input name="birthday" class="form-control" id="date" type="date" placeholder="Enter your birthday..." data-sb-validations="required" />
                            <label for="name">Birthday</label>
                            <div class="invalid-feedback" data-sb-feedback="birthday:required">A birthday is required.</div>
                        </div>
                        <!-- Age input-->
                        <div class="form-floating mb-3">
                            <input name="age" class="form-control" id="age" type="number" placeholder="18" data-sb-validations="required" min="16" />
                            <label for="Age">Age</label>
                            <div class="invalid-feedback" data-sb-feedback="age:required">A age is required.</div>
                        </div>
                        <!-- Email address input-->
                        <div class="form-floating mb-3">
                            <input name="email" class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                            <label for="email">Email address</label>
                            <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                            <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                        </div>
                        <!-- Phone number input-->
                        <div class="form-floating mb-3">
                            <input name="phone" class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                            <label for="phone">Phone number</label>
                            <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                        </div>
                        <!-- Username input-->
                        <div class="form-floating mb-3">
                            <input name="username" class="form-control" id="username" type="text" placeholder="Enter your username..." data-sb-validations="required" />
                            <label for="username">Username</label>
                            <div class="invalid-feedback" data-sb-feedback="username:required">A username is required.</div>
                        </div>
                        <!-- Password input -->
                        <div class="form-floating mb-3">
                            <input name="password" class="form-control" id="password" type="password" placeholder="Enter your password..." data-sb-validations="required" />
                            <label for="password">Password</label>
                            <div class="invalid-feedback" data-sb-feedback="password:required">A password is required.</div>
                        </div>
                        <!-- Submit Button-->
						<input class="btn btn-primary btn-xl" type="submit" value="Send">
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Copyright Section-->
    <div class="copyright py-4 text-center text-white">
        <div class="container"><small>Copyright &copy; Squatchers 2023</small></div>
    </div>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>

</html>