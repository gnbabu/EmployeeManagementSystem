<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MesLoginPageB5.aspx.cs" Inherits="EmployeeManagementSystem.MesLoginPageB5" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Maximus Sign In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap 5 + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        html, body {
            height: 100%;
            margin: 0;
            background-color: #f9f9f9;
        }

        .page-wrapper {
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        /* Sidebar */
        .sidebar {
            width: 300px;
            background-color: #002d72;
            color: #fff;
            flex-shrink: 0;
            transition: width 0.3s ease;
            overflow: hidden; /* hides content when collapsed */
            display: flex;
            flex-direction: column;
            padding-top: 50px;
        }

            /* Fully closed */
            .sidebar.collapsed {
                width: 0;
            }

            .sidebar h5 {
                padding: 15px;
                text-align: center;
                font-size: 18px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                margin: 0;
                white-space: nowrap;
            }

            .sidebar .nav-link {
                color: #fff;
                padding: 12px 30px;
                white-space: nowrap;
                font-weight: 600;
                font-size: 14pt;
            }

                .sidebar .nav-link:hover {
                    background-color: #003a82;
                }

            .sidebar .bi {
                margin-right: 8px;
            }

        /* Main Content */
        .main-section {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .header {
            background-color: #004aad;
            color: #fff;
            padding: 10px 20px;
            font-size: 30px;
            justify-content: space-between;
            align-items: center;
            font-weight: 600;
        }

        .toggle-btn {
            background: none;
            border: none;
            color: #fff;
            font-size: 25px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
        }

        .navbar-custom {
            background-color: #002d72;
        }

            .navbar-custom .nav-link {
                color: #fff;
                font-weight: 600;
                font-size: 14pt;
                margin-left: 12px;
            }

                .navbar-custom .nav-link:hover {
                    background-color: #003a82;
                }

        .flex-main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 15px;
            overflow-y: auto;
        }

        .main-container {
            width: 100%;
            max-width: 1100px;
        }

        .panel-custom {
            background: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
        }

            .panel-custom h3,
            .panel-custom h4 {
                font-weight: bold;
                margin-top: 0;
            }

        .btn-primary {
            background-color: #004aad;
            border-color: #004aad;
            font-size: 17px;
            font-weight: 600;
        }

            .btn-primary:hover {
                background-color: #003a82;
                border-color: #003a82;
            }

        .btn-outline-primary {
            font-size: 17px;
            border: 2px solid #004aad;
            font-weight: 600;
        }

            .btn-outline-primary:hover {
                background-color: #003a82;
                border-color: #003a82;
            }

        .govt-footer {
            background-color: #bbb;
            color: #111;
            text-align: center;
            font-size: 12px;
            padding: 10px 15px;
        }

            .govt-footer a {
                color: #111;
                text-decoration: none;
            }

        .forgot-link {
            float: right;
            margin-top: 5px;
        }

        @media (max-width: 767.98px) {
            .forgot-link {
                float: none;
                display: block;
                text-align: right;
            }
            /* Hide sidebar completely on mobile regardless of state */
            .sidebar {
                display: none !important;
            }
        }


        /* Footer styles */
        #main-footer {
            background-color: #111;
            color: #fff;
            padding-right: 2rem;
            padding-top: 0.5rem;
            border-top: 1px solid #B6C7E1;
        }

        footer a {
            color: #fff;
            display: inline-block;
            padding: 0.3rem 0;
        }

        .footer-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: auto;
            gap: 30px;
            max-width: 1600px;
        }

        .footer-column {
            flex: 1 1 250px;
            text-align: justify;
        }

            .footer-column h4 {
                font-size: 16px;
                margin-bottom: 10px;
                color: var(--white);
            }

            .footer-column p,
            .footer-column ul {
                font-size: 14px;
                line-height: 1.6;
            }

            .footer-column ul {
                list-style: none;
                padding: 0;
            }

                .footer-column ul li {
                    margin-bottom: 6px;
                }

            .footer-column a:hover {
                text-decoration: underline;
            }

        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            font-size: 13px;
            color: #cccccc;
        }

        .footer-logo {
            width: 120px;
            margin-bottom: 10px;
        }

        .footer-header {
            color: #fff;
            font-size: 40px;
            justify-content: space-between;
            align-items: center;
            font-weight: 800;
        }

        .return-to-top {
            text-align: right;
            margin-bottom: 10px;
        }

            .return-to-top a {
                color: #fff;
                text-decoration: none;
                font-size: 14px;
            }

                .return-to-top a:hover {
                    text-decoration: underline;
                }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <!-- Sidebar (starts collapsed via class below) -->
        <nav id="sidebar" class="sidebar collapsed">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Settings</a>
                </li>
            </ul>
        </nav>

        <!-- Main Area -->
        <div class="main-section">
            <!-- Header -->
            <div class="header">
                <button id="sidebarToggleBtn" class="toggle-btn" type="button" aria-expanded="false" aria-controls="sidebar">
                    <i class="bi bi-list" id="toggleIcon"></i>
                </button>
                <span>maximus</span>

            </div>

            <!-- Top Navbar -->
            <nav class="navbar navbar-expand-lg navbar-custom">
                <div class="container-fluid">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#">Provider Network Management</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Medicaid Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Learning</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Fee Schedule</a></li>
                    </ul>
                </div>
            </nav>

            <!-- Main Body -->


            <main class="flex-main">
                <div class="container">
                    <div class="row align-items-stretch">
                        <!-- Left Column: Sign In + SSO -->
                        <div class="col-md-6 d-flex flex-column">
                            <div class="panel-custom flex-fill mb-3">
                                <h3>Sign in</h3>
                                <h4>Access your account</h4>
                                <form>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email address</label>
                                        <input type="email" id="email" class="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" id="password" class="form-control" />
                                        <a href="#" class="forgot-link">Forgot password?</a>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Sign in</button>
                                </form>
                                <div class="form-help mt-2">
                                    <a href="#">Don't have an account?</a>
                                </div>
                            </div>
                            <div class="panel-custom">
                                <h5><strong>Need a different way to sign in?</strong></h5>
                                <p>Use our secure SSO option if you have been provided alternate access credentials.</p>
                                <button class="btn btn-outline-primary">Launch secondary SSO</button>
                            </div>
                        </div>

                        <!-- Right Column: News -->
                        <div class="col-md-6 d-flex">
                            <div class="panel-custom flex-fill">
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
                </div>
            </main>



            <!-- Footer -->
            <footer>
                <div class="govt-footer">
                    &copy; 2024 Maximus Provider Portal. &nbsp; An official website of &lt;Parent agency&gt; &nbsp; &nbsp;
    <a href="#">About &lt;Parent shortname&gt;</a> &nbsp; &nbsp;
    <a href="#">FOIA requests</a> &nbsp; &nbsp;
    <a href="#">Privacy policy</a>
                </div>
                <div id="main-footer">
                    <div class="return-to-top">
                        <a href="#">Return to top</a>
                    </div>
                    <div class="footer-grid">
                        <!-- Logo and Description -->
                        <div class="footer-column">
                            <div class="footer-header">

                                <span>MESE</span>

                            </div>
                        </div>

                        <!-- Contact Info -->
                        <div class="footer-column">
                            <h4>Contact</h4>
                            <p>
                                1600 Tysons Blvd<br />
                                Suite 1400<br />
                                McLean, VA 22102
                            </p>
                            <p>Phone: <a href="tel:18006861516">1-800-686-1516</a></p>
                        </div>

                        <!-- Links -->
                        <div class="footer-column">
                            <h4>Quick Links</h4>
                            <ul>
                                <li><a href="https://maximus.com/">Home</a></li>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="https://ohio.gov/wps/portal/gov/site/home/privacy-notice-and-policies" target="_blank">Privacy & Accessibility</a></li>
                                <li><a href="https://maximus.com/Terms">Terms of Use</a></li>
                            </ul>
                        </div>

                        <!-- System Info -->
                        <div class="footer-column">
                            <h4>System Info</h4>
                            <p>Version: v1.0.0</p>
                            <p>Updated: July 10, 2025</p>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        (function () {
            const sidebar = document.getElementById('sidebar');
            const btn = document.getElementById('sidebarToggleBtn');
            const icon = document.getElementById('toggleIcon');

            function toggleSidebar() {
                const isCollapsed = sidebar.classList.toggle('collapsed');
                btn.setAttribute('aria-expanded', (!isCollapsed).toString());
                icon.classList.toggle('bi-list', isCollapsed);
                icon.classList.toggle('bi-x', !isCollapsed);
            }

            btn.addEventListener('click', toggleSidebar);

            // Ensure collapsed on load and correct icon set
            sidebar.classList.add('collapsed');
            btn.setAttribute('aria-expanded', 'false');
            icon.classList.remove('bi-x');
            icon.classList.add('bi-list');
        })();
    </script>
</body>
</html>
