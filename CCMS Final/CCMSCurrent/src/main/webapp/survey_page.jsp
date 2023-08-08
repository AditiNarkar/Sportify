<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CCMS</title>
  
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <link href="assets/styles.css" rel="stylesheet">
  
</head>

<body>
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt=""></a> -->
      <!-- Uncomment below if you prefer to use a text logo -->
      <h1 class="logo mr-auto"><a href="index.html">SPORTIFY</a></h1>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="#centertext">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="clubs.html">Clubs</a></li>
          <li><a class="nav-link scrollto" href="#shop">Shop</a></li>
          <li><a class="nav-link scrollto" href="#team">Our Staff</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
          <!-- <li><a class="nav-link scrollto" href="#admin">Admin</a></li> -->

          <!-- <li class="nav-link scrollto"><a href="#"><span>Log In as</span> <i class="bi bi-chevron-down"></i></a> -->
            <ul>
              <li class="nav-link scrollto dropdown"><a href="#"><span>Log In as</span> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="#">Coach</a></li>
                  <li><a href="#">Member</a></li>
                  <li><a href="#">Team Member</a></li>
                  <li><a href="admin_login.html">Administrator</a></li>
                </ul>
              </li>
              
            </ul>
        </ul>        
      </nav>
    </div>  
  </header>

  <div class="survey-page-container">
    <div class="title1"><i class="bi bi-stopwatch"></i><br>Quick Survey - Security Questions</div>
    <div class="divider"></div>

    <div class="div1">
        
        <div class="contents">
        
            <form action="survey_page_operations.jsp" method="POST">
            
                <label for="inputPassword5" class="form-label">What is your favorite color ?</label>
                <input type="text" name="inputcolor" class="form-control" aria-describedby="passwordHelpBlock"><br>

                <label for="inputPassword5" class="form-label">What did you name your first pet ?</label>
                <input type="text" name="inputpet" class="form-control" aria-describedby="passwordHelpBlock"><br>

                <button type="submit">Submit</button>
            </form>

            <div class="survey-info">
              <i class="bi bi-info-circle"></i>  Remember your entries for further references.
            </div>

        </div>
        <!-- contents -->

        <div class="img"><img src="assets/images/logo1-removebg.png" alt=""></div>

    </div>
    <!-- div1 -->
  </div>
  <!-- forgotpwd -->
   <!-- ======= Footer ======= -->
   <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="copyright">
            &copy; Copyright <strong>Sportify Cricket Academy</strong>. All Rights Reserved
          </div>
          <div class="credits">
            
            
          </div>
        </div>
      </div>
    </div>
  </footer><!-- End Footer -->


  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/typed.js/typed.min.js"></script>
  <script src="assets/vendor/contact-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="./assets/scripts.js"></script>

</body>

</html>