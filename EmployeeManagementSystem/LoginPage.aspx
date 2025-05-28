<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="EmployeeManagementSystem.LoginPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 400px;
        }

        .form-label {
            margin-bottom: 0.5rem;
        }

        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 60px;
            line-height: 60px;
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>
    <header class="text-center py-4">
        <h1>Welcome Back!</h1>
    </header>

    <div class="container my-5">
        <div class="card p-4">
            <h2 class="text-center">Login</h2>
            <form>
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" required>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="keepLoggedIn">
                    <label class="form-check-label" for="keepLoggedIn">Keep me logged in</label>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-dark">Log in</button>
                </div>
                <div class="text-center mt-3">
                    <a href="#">Forgot your password?</a>
                </div>
                <hr class="my-4">
                <div class="text-center">
                    <p>Don't have an account? <a href="#">Sign up here</a></p>
                </div>
            </form>
        </div>
    </div>

    <footer class="footer text-center">
        © 2024 Your Company Name
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
