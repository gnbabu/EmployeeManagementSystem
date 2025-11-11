<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Maximus Sign In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 3 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            background: #f9f9f9;
        }

        .page-wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            background-color: #004aad;
            color: white;
            font-size: 28px;
            font-weight: bold;
            padding: 10px 15px;
        }

        .navbar-custom {
            background-color: #002d72;
            border-radius: 0;
            margin-bottom: 0;

        }

        .navbar-custom .navbar-nav > li > a {
            color: white;
            font-size:16px;
            font-weight: 600;
        }

        .navbar-custom .navbar-nav > li > a:hover {
            background-color: #003a82;
            border-color: #003a82;
        }

        .flex-main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 15px;
        }

        .main-container {
            width: 100%;
            max-width: 1100px;
        }

        .panel-custom {
            background: white;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
        }

            .panel-custom h3,
            .panel-custom h4 {
                margin-top: 0;
                font-weight: bold;
            }

        .btn-primary {
            background-color: #004aad;
            border-color: #004aad;
        }

            .btn-primary:hover {
                background-color: #003a82;
                border-color: #003a82;
            }

        .footer {
            background-color: #111;
            color: #bbb;
            padding: 10px 15px;
            font-size: 12px;
            text-align: center;
        }

            .footer a {
                color: #bbb;
            }

        .forgot-link {
            float: right;
            margin-top: 5px;
        }

        .form-help {
            margin-top: 10px;
        }

        @media (max-width: 767px) {
            .forgot-link {
                float: none;
                display: block;
                text-align: right;
            }
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <!-- Header -->
        <header>
            <div class="header">maximus</div>
            <nav class="navbar navbar-custom">
                <div class="container-fluid">
                    <ul class="nav navbar-nav">
                        <li><a href="#">Provider Network Management</a></li>
                        <li><a href="#">Medicaid Home</a></li>
                        <li><a href="#">Learning</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Fee Schedule</a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Main Flex Content -->
        <main class="flex-main">
            <div class="main-container">
                <div class="row">
                    <!-- Sign In Panel -->
                    <div class="col-md-6">
                        <div class="panel-custom">
                            <h3>Sign in</h3>
                            <h4>Access your account</h4>
                            <form>
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" id="email" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" id="password" class="form-control">
                                    <a href="#" class="forgot-link">Forgot password?</a>
                                </div>
                                <button type="submit" class="btn btn-primary">Sign in</button>
                            </form>
                            <div class="form-help">
                                <a href="#">Don't have an account?</a>
                            </div>
                        </div>
                    </div>

                    <!-- News Panel -->
                    <div class="col-md-6">
                        <div class="panel-custom">
                            <h4>Latest News</h4>
                            <p>
                                <strong>New Tax Filing Portal</strong><br>
                                The IRS has launched a new mobile-friendly portal for tax filing.
                            </p>
                            <p>
                                <strong>Disaster Relief Resources</strong><br>
                                FEMA has updated its resources for communities affected by recent storms.
                            </p>
                            <p>
                                <strong>Veterans Affairs Expands Telehealth</strong><br>
                                VA announces expanded telehealth services for rural veterans.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- SSO Panel -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel-custom">
                            <h5><b>Need a different way to sign in?</b></h5>
                            <p>Use our secure SSO option if you have been provided alternate access credentials.</p>
                            <button class="btn btn-default">Launch secondary SSO</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer">
            &copy; 2024 Maximus Provider Portal. &nbsp; An official website of &lt;Parent agency&gt; &nbsp; &nbsp;
      <a href="#">About &lt;Parent shortname&gt;</a> &nbsp; &nbsp;
      <a href="#">FOIA requests</a> &nbsp; &nbsp;
      <a href="#">Privacy policy</a>
        </footer>
    </div>

    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
