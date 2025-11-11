<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DellDashboard.aspx.cs" Inherits="EmployeeManagementSystem.DellDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>DELP Tracker Tool - Orders OnHold Report</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    .navbar-custom {
      background-color: #0067b8;
    }
    .navbar-custom a,
    .navbar-custom .navbar-brand,
    .navbar-custom .nav-link,
    .navbar-custom .dropdown-toggle {
      color: #fff;
    }
    .navbar-custom a:hover,
    .navbar-custom .nav-link:hover,
    .navbar-custom .dropdown-toggle:hover {
      color: #dbe9fc;
    }
    .breadcrumb-item + .breadcrumb-item::before {
      content: ">";
    }
    .table-wrapper {
      overflow-x: auto;
    }
    /* Smaller checkbox column */
    th.checkbox-col, td.checkbox-col {
      width: 40px;
      text-align: center;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid px-3">
      <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="https://cdn.worldvectorlogo.com/logos/dell-6.svg" alt="Dell" width="32" height="32" class="me-2" />
        <span class="fw-bold">DELP</span> Tracker Tool
      </a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="mainNavbar">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link d-flex align-items-center" href="#">
              <i class="bi bi-house-fill me-1"></i> Home
            </a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-people-fill me-1"></i> IDR
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Sub IDR 1</a></li>
              <li><a class="dropdown-item" href="#">Sub IDR 2</a></li>
            </ul>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-bell-fill me-1"></i> Alerts
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Alert 1</a></li>
              <li><a class="dropdown-item" href="#">Alert 2</a></li>
            </ul>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-git me-1"></i> GIT
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Git Option 1</a></li>
              <li><a class="dropdown-item" href="#">Git Option 2</a></li>
            </ul>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-balance-scale me-1"></i> Others
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Other 1</a></li>
              <li><a class="dropdown-item" href="#">Other 2</a></li>
            </ul>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-chat-left-text-fill me-1"></i> Feedback
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Feedback 1</a></li>
              <li><a class="dropdown-item" href="#">Feedback 2</a></li>
            </ul>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-life-preserver me-1"></i> Support
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Support 1</a></li>
              <li><a class="dropdown-item" href="#">Support 2</a></li>
            </ul>
          </li>
        </ul>

        <form class="d-flex" role="search">
          <select class="form-select form-select-sm w-auto">
            <option selected>PROD</option>
            <option>DEV</option>
            <option>STAGE</option>
          </select>
        </form>
      </div>
    </div>
  </nav>

  <!-- Breadcrumb -->
  <nav aria-label="breadcrumb" class="px-3 pt-3">
    <ol class="breadcrumb mb-0">
      <li class="breadcrumb-item"><a href="#"><i class="bi bi-house"></i></a></li>
      <li class="breadcrumb-item active" aria-current="page">Orders OnHold Report</li>
    </ol>
  </nav>

  <div class="container-fluid px-3 mt-3">
    <!-- Info alert -->
    <div class="alert alert-info" role="alert">
      Lists all the orders that are awaiting data collection and are on IDR Hold in OFS/GCMP/OMCS
    </div>

    <!-- Date range form -->
    <form class="row g-3 align-items-center mb-3">
      <div class="col-auto">
        <label for="startDate" class="col-form-label">Start Date</label>
      </div>
      <div class="col-auto">
        <input type="date" class="form-control" id="startDate" value="2025-06-04" />
      </div>

      <div class="col-auto">
        <label for="endDate" class="col-form-label">End Date</label>
      </div>
      <div class="col-auto">
        <input type="date" class="form-control" id="endDate" value="2025-06-18" />
      </div>

      <div class="col-auto">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>

      <div class="col-auto">
        <button type="button" class="btn btn-primary">Release Hold</button>
      </div>
    </form>

    <!-- Filters and Export -->
    <div class="d-flex justify-content-between align-items-center mb-1 border rounded p-2">
      <div class="d-flex align-items-center gap-2">
        <label class="mb-0 fw-semibold">Column Filters</label>
        <button type="button" class="btn btn-outline-primary btn-sm">Clear All</button>
      </div>
      <div>
        <span class="me-2 fw-semibold">Export to</span>
        <button type="button" class="btn btn-primary btn-sm me-2">Excel</button>
        <button type="button" class="btn btn-primary btn-sm">Csv</button>
      </div>
    </div>

    <!-- Table -->
    <div class="table-wrapper">
      <table class="table table-striped table-bordered align-middle">
        <thead class="table-light">
          <tr>
            <th class="checkbox-col"><input type="checkbox" /></th>
            <th>Action</th>
            <th>On-Hold Age (Days)</th>
            <th>OrderNumber</th>
            <th>DPID/IRN</th>
            <th>Quote</th>
            <th>BUID</th>
            <th>Region</th>
          </tr>
        </thead>
        <tbody>
          <!-- Sample rows -->
          <tr>
            <td class="checkbox-col"><input type="checkbox" /></td>
            <td><a href="#">CollectIDRData</a></td>
            <td>8</td>
            <td><a href="#">1020346784</a></td>
            <td><a href="#">2009696170769</a></td>
            <td>3000191099347</td>
            <td>11</td>
            <td>DAO</td>
          </tr>
          <tr>
            <td class="checkbox-col"><input type="checkbox" /></td>
            <td><a href="#">CollectIDRData</a></td>
            <td>8</td>
            <td><a href="#">1020348468</a></td>
            <td><a href="#">2009696265585</a></td>
            <td>3000190953244</td>
            <td>11</td>
            <td>DAO</td>
          </tr>
          <tr>
            <td class="checkbox-col"><input type="checkbox" /></td>
            <td><a href="#">CollectIDRData</a></td>
            <td>8</td>
            <td><a href="#">1020348851</a></td>
            <td><a href="#">2009696276566</a></td>
            <td>3000191096430</td>
            <td>11</td>
            <td>DAO</td>
          </tr>
          <!-- Add more rows as needed -->
        </tbody>
      </table>
    </div>
  </div>

  <!-- Bootstrap JS bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
</body>
</html>