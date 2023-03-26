<?php

include_once ".env.php";

if (is_array($_POST) && !empty($_POST))

{

	if( !isset($_POST['nameU']) || !isset($_POST['dietary']) || !isset($_POST['temp']) || !isset($_POST['side']) || !isset($_POST['museum']) || !isset($_POST['skill']) || !isset($_POST['distance']) || !isset($_POST['price']) )

	{

		$error = " Please fill out the fields before submitting ";

	}



	if( isset($error) )

	{

		echo '<p style="color: red">Error: ' . $error .'</p>';

	}

	else  //NOT SURE IF THIS IS RIGHT

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

        //sanitize the data

		foreach( $_POST as $key => $value )

		{

			$_POST[$key] = mysqli_real_escape_string($con, $value);

		}
        //isset($_POST['name']) || !isset($_POST['dietReq']) || !isset($_POST['tempPref']) || !isset($_POST['InOrOut']) || !isset($_POST['Museum_YN']) || !isset($_POST['Skill_YN']) || !isset($_POST['Dist']) || !isset($_POST['PriceP'])
    $query = "INSERT INTO QuestionnaireResponses ( nameU, dietary, temp, side, museum, skill, distance, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		if( !mysqli_stmt_prepare($stmt, $query) )

		{

			exit("<p>Failed to prepare statement bottom</p>");

		}

		mysqli_stmt_bind_param($stmt, "ssssssss", $_POST['name'], $_POST['diettary'], $_POST['temp'], $_POST['side'], $_POST['museum'], $_POST['skill'], $_POST['distance'], $_POST['price']); //changed final

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
    <title>Questionarie</title>
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
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded"
                            href="index.html">Home</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <header class="masthead bg-primary text-white text-center">
        <div class="container d-flex align-items-center flex-column">
            <!-- Masthead Heading-->
            <h1 class="masthead-subheading font-weight-light mb-0">Please answer the following questions</h1>
        </div>
    </header>
    <section class="page-section " id="contact">
        <div class="container">
            <!-- Contact Section Form-->
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <!-- * * * * * * * * * * * * * * *-->
                    <!-- * * SB Forms Contact Form * *-->
                    <!-- * * * * * * * * * * * * * * *-->
                    <!-- This form is pre-integrated with SB Forms.-->
                    <!-- To make this form functional, sign up at-->
                    <!-- https://startbootstrap.com/solution/contact-forms-->
                    <!-- to get an API token!-->
                    <!-- data-sb-form-api-token="API_TOKEN" -->
                    <form action="questionaire.php" method="post" id="contactForm">
                        <!-- Name input-->
                        <div class="mb-4">
                            <label class="mb-2 h5" for="name">Full name</label><br>
                            <input class="form-control form-control-lg" id="nameU" type="text" />
                        </div>
                        <!-- Age input-->
                        <div class="mb-4">
                            <label class="mb-2 h5" for="Age">Age</label><br>
                            <input class="form-control form-control-lg" id="age" type="number" min="16" />
                        </div>
                        <!-- Dietary Restriction-->
                        <div class="mb-4">
                            <p class="h5">Dietary Restriction:</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="halal" name="dietary" value="halal">
                            <label for="halal">Halal</label> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="kosher" name="dietary" value="kosher">
                            <label for="kosher">Kosher</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="vegetarian" name="dietary" value="vegetarian">
                            <label for="vegetarian">Vegetarian</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="vegan" name="dietary" value="vegan">
                            <label for="vegan">Vegan</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="lactose" name="dietary" value="lactose">
                            <label for="lactose">Lactose Intolerant</label>
                        </div>
                        <!-- Temperature preference -->
                        <div class="mb-4">
                            <p class="h5">Temperature preference:</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="low" name="temp" value="low">
                            <label for="low">30 degrees - 50 degrees</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="mid" name="temp" value="mid">
                            <label for="mid">50 degrees - 70 degrees</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" id="high" name="temp" value="high">
                            <label for="high">70+ degrees</label>
                        </div>
                        <!-- Indoor or Outdoor -->
                        <div class="mb-4">
                            <p class="h5">Inside/Outside person</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="inside" name="side" value="inside">
                            <label for="inside">Inside</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="outside" name="side" value="outside">
                            <label for="outside">Outside</label>
                        </div>
                        <!-- Museum -->
                        <div class="mb-4">
                            <p class="h5">Do you want to visit a museum?</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="myes" name="museum" value="yes">
                            <label for="myes">Yes</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="mno" name="museum" value="no">
                            <label for="mno">No</label>
                        </div>
                        <!-- Skills -->
                        <div class="mb-4">
                            <p class="h5">Do you want to learn a new skill?</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="syes" name="skill" value="yes">
                            <label for="syes">Yes</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="sno" name="skill" value="no">
                            <label for="sno">No</label>
                        </div>
                        <!-- Distance -->
                        <div class="mb-4">
                            <p class="h5">Do you want to wallk a distance of over 2 miles?</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="dyes" name="distance" value="yes">
                            <label for="dyes">Yes</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="dno" name="distance" value="no">
                            <label for="dno">No</label>
                        </div>
                        <!-- Skills -->
                        <div class="mb-4">
                            <p class="h5">What is a good average price point (without airfare)?</p>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="low" name="price" value="low">
                            <label for="low">&lt; $200</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="mid" name="price" value="mid">
                            <label for="mid">$350</label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="high" name="price" value="high">
                            <label for="high">$500 &gt;</label>
                        </div>
                        <a href="itinerary.html" class="btn btn-success">Tell me where to go</a>
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