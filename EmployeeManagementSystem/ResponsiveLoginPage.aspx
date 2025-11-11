<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResponsiveLoginPage.aspx.cs" Inherits="EmployeeManagementSystem.ResponsiveLoginPage" %>

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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Sidebar */
        #sidebar {
            background-color: #002d72;
            color: #fff;
            min-height: 100vh;
        }

            #sidebar .nav-link {
                color: #fff;
                font-weight: 600;
                font-size: 1.1rem;
                padding: 0.75rem 1.5rem;
            }

                #sidebar .nav-link:hover,
                #sidebar .nav-link.active {
                    background-color: #003a82;
                    color: #fff;
                }

            #sidebar h5 {
                padding: 1rem;
                font-size: 1.125rem;
                text-align: center;
                border-bottom: 1px solid rgba(255, 255, 255, 0.15);
                margin-bottom: 1rem;
                user-select: none;
            }

            #sidebar .bi {
                margin-right: 0.5rem;
            }

        .main-section {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        /* Header */
        .header {
            background-color: #004aad;
            color: #fff;
            padding: 0.5rem 1rem;
            font-size: 1.875rem;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
            user-select: none;
        }

        .toggle-btn {
            background: none;
            border: none;
            color: #fff;
            font-size: 1.5rem;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
            cursor: pointer;
            padding: 0;
        }

        /* Navbar */
        .navbar-custom {
            background-color: #002d72;
            padding-top: 0.25rem;
            padding-bottom: 0.25rem;
        }

            .navbar-custom .nav-link {
                color: #fff;
                font-weight: 600;
                font-size: 1rem;
                padding: 0.5rem 1rem;
                white-space: nowrap;
            }

                .navbar-custom .nav-link:hover {
                    background-color: #003a82;
                    color: #fff;
                    border-radius: 0.25rem;
                }

        main.flex-main {
            flex: 1 1 auto;
            overflow-y: auto;
            padding: 2rem 1rem;
            background: transparent;
        }

        .panel-custom {
            background: #fff;
            border: 1px solid #ddd;
            padding: 1.5rem 2rem;
            margin-bottom: 1.5rem;
            border-radius: 0.25rem;
            box-shadow: 0 0 6px #e3e3e3;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

            .panel-custom h3,
            .panel-custom h4,
            .panel-custom h5 {
                font-weight: 700;
                margin-top: 0;
                margin-bottom: 1rem;
            }

        .btn-primary {
            background-color: #004aad;
            border-color: #004aad;
            font-size: 1.1rem;
            font-weight: 600;
            padding: 0.5rem 1.5rem;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

            .btn-primary:hover, .btn-primary:focus {
                background-color: #003a82;
                border-color: #003a82;
            }

        .btn-outline-primary {
            font-size: 1.1rem;
            border: 2px solid #004aad;
            font-weight: 600;
            padding: 0.4rem 1.5rem;
            transition: background-color 0.3s ease, border-color 0.3s ease;
            color: #004aad;
        }

            .btn-outline-primary:hover, .btn-outline-primary:focus {
                background-color: #003a82;
                border-color: #003a82;
                color: #fff;
            }

        .forgot-link {
            display: block;
            text-align: right;
            margin-top: 0.35rem;
            font-size: 0.9rem;
            font-weight: 600;
            user-select: none;
        }

        .form-help a {
            font-size: 1rem;
            font-weight: 600;
            color: #004aad;
            text-decoration: underline;
            user-select: none;
        }

            .form-help a:hover {
                color: #003a82;
            }

        /* Footer styles */
        .govt-footer {
            background-color: #bbb;
            color: #111;
            text-align: center;
            font-size: 0.85rem;
            padding: 0.75rem 1rem;
            user-select: none;
        }

            .govt-footer a {
                color: #111;
                text-decoration: none;
                margin: 0 0.5rem;
            }

                .govt-footer a:hover {
                    text-decoration: underline;
                }

        #main-footer {
            background-color: #111;
            color: #fff;
            padding: 1rem 1rem 2rem;
            border-top: 1px solid #B6C7E1;
        }

        .return-to-top {
            text-align: right;
            margin-bottom: 0.75rem;
            user-select: none;
        }

            .return-to-top a {
                color: #fff;
                text-decoration: none;
                font-size: 0.875rem;
                user-select: none;
            }

                .return-to-top a:hover,
                .return-to-top a:focus {
                    text-decoration: underline;
                }

        .footer-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            max-width: 1600px;
            margin-left: auto;
            margin-right: auto;
            gap: 2rem;
            user-select: none;
        }

        .footer-column {
            flex: 1 1 250px;
            text-align: justify;
            min-width: 200px;
        }

            .footer-column h4 {
                font-size: 1rem;
                margin-bottom: 0.5rem;
                color: #fff;
                font-weight: 700;
                user-select: none;
            }

            .footer-column p,
            .footer-column ul {
                font-size: 0.9rem;
                line-height: 1.5;
                color: #ddd;
                user-select: none;
            }

            .footer-column ul {
                list-style: none;
                padding-left: 0;
            }

                .footer-column ul li {
                    margin-bottom: 0.3rem;
                }

            .footer-column a {
                color: #ddd;
                text-decoration: none;
                user-select: none;
            }

                .footer-column a:hover,
                .footer-column a:focus {
                    text-decoration: underline;
                }

        .footer-header {
            color: #fff;
            font-size: 2.5rem;
            font-weight: 800;
            user-select: none;
        }

        /* Responsive behavior */

        /* On small devices, sidebar is hidden, toggle is hidden */
        @media (max-width: 767.98px) {
            #sidebar {
                display: none !important;
                min-height: auto;
            }

            .toggle-btn {
                display: none;
            }

            main.flex-main {
                padding: 1rem 1rem 2rem;
            }
        }

        /* On medium and up: sidebar visible */
        @media (min-width: 768px) {
            .page-wrapper {
                flex-direction: row;
            }

            #sidebar {
                width: 220px;
                flex-shrink: 0;
            }

            .main-section {
                flex-grow: 1;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            main.flex-main {
                padding: 2rem 2rem;
            }
        }

        /* Collapsed sidebar on medium and up */
        #sidebar.collapsed {
            width: 0 !important;
            min-width: 0;
            overflow: hidden;
            transition: width 0.3s ease;
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
