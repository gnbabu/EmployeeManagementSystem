<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Correspondence.aspx.cs" Inherits="EmployeeManagementSystem.Correspondence" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Correspondence – Maximus</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- jQuery UI -->
    <link href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" rel="stylesheet">

    <style>
        body {
            background: #f4f5fa;
            font-size: 14px;
        }

        /* ===== HEADERS ===== */
        .brand-bar {
            background: linear-gradient(180deg, #6e42a3, #4a287a);
            color: #fff;
            padding: 10px 20px;
        }

        .menu-bar {
            background: #fff;
            border-bottom: 1px solid #ddd;
            padding: 8px 20px;
        }

            .menu-bar .nav-link {
                color: #6e42a3 !important;
                font-weight: 600;
            }

                .menu-bar .nav-link.active {
                    border-bottom: 2px solid #6e42a3;
                }

        /* ===== CARDS ===== */
        .page-card {
            background: #fff;
            border: 1px solid #ded9eb;
            border-radius: 8px;
        }

        .page-card-header {
            padding: 12px 16px;
            font-weight: 600;
            color: #6e42a3;
            border-bottom: 1px solid #e6e1f0;
            display: flex;
            justify-content: space-between;
        }

        /* ===== FORM ===== */
        label {
            font-size: 12px;
            font-weight: 600;
        }

        .form-control {
            border-radius: 6px;
        }

        /* Datepicker with icon */
        .date-wrapper {
            position: relative;
        }

            .date-wrapper .form-control {
                padding-right: 36px;
            }

            .date-wrapper i {
                position: absolute;
                right: 12px;
                top: 36px;
                color: #6e42a3;
                pointer-events: none;
            }

        /* ===== TABLE ===== */
        .table thead {
            background: #f5f2fb;
        }

        .table th {
            font-weight: 600;
            font-size: 13px;
        }

        .table tbody tr:nth-child(even) {
            background-color: #faf9fd;
        }

        .table tbody tr:nth-child(odd) {
            background-color: #ffffff;
        }

        .table td a {
            color: #6e42a3;
            font-weight: 500;
            text-decoration: none;
            cursor: pointer;
        }

        /* ===== BUTTONS ===== */
        .btn-purple {
            background: #6e42a3;
            color: #fff;
        }

            .btn-purple:hover {
                background: #593186;
            }


        .provider-box {
            font-size: 14px;
            line-height: 1.6;
            color: #333;
        }

            .provider-box p {
                margin-bottom: 10px;
            }

         .section-title {
            background: #f3f3f6;
            padding: 8px 12px;
            font-weight: 600;
            border-radius: 4px;
            margin-bottom: 12px;
        }

        .modal-header {
            border-bottom: 1px solid #e5e5e5;
        }

        .modal-footer {
            border-top: 1px solid #e5e5e5;
        }

        .btn-purple {
            background-color: #5b2d8b;
            color: #fff;
            border: none;
        }

            .btn-purple:hover {
                background-color: #4a2372;
                color: #fff;
            }




        /* =========================================================
   MAXIMUS – CORRESPONDENCE SEARCH RESULTS TABLE
   Scoped ONLY by tableClass
   ========================================================= */

        table.correspondence-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 13px;
            background: #fff;
        }

            /* ================= HEADER ================= */

            table.correspondence-table thead th {
                background-color: #ffffff;
                color: #333;
                font-weight: 600;
                font-size: 12.5px;
                padding: 10px 12px;
                border-bottom: 1px solid #e1e1e1;
                white-space: nowrap;
                vertical-align: middle;
            }

                /* Sort icon spacing (matches screenshot) */
                table.correspondence-table thead th .sort-icon {
                    margin-left: 6px;
                    font-size: 10px;
                    color: #666;
                }

            /* ================= FILTER ROW ================= */
            /* (input row under headers) */

            table.correspondence-table thead .filter-input {
                font-size: 12px;
                height: 28px;
                padding: 2px 6px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }

            /* ================= BODY ================= */

            table.correspondence-table tbody td {
                padding: 9px 12px;
                border-bottom: 1px solid #ededed;
                vertical-align: middle;
                color: #333;
            }

            /* ================= ZEBRA STRIPING ================= */

            table.correspondence-table tbody tr.dg-data-row:nth-child(odd) {
                background-color: #ffffff;
            }

            table.correspondence-table tbody tr.dg-data-row:nth-child(even) {
                background-color: #f7f5fb; /* light purple tint from image */
            }

            /* ================= HOVER ================= */

            table.correspondence-table tbody tr.dg-data-row:hover {
                background-color: #ece7f6;
            }

            /* ================= SUBJECT LINK ================= */

            table.correspondence-table tbody td a {
                color: #6e42a3;
                font-weight: 500;
                text-decoration: none;
            }

                table.correspondence-table tbody td a:hover {
                    text-decoration: underline;
                }

            /* ================= NO DATA ================= */

            table.correspondence-table tbody tr td.text-center {
                color: #777;
                font-style: italic;
            }

        /* ================= PAGINATION (VISUAL MATCH) ================= */

        .pagination .page-item.active .page-link {
            background-color: #6e42a3;
            border-color: #6e42a3;
            color: #fff;
        }

        .pagination .page-link {
            color: #6e42a3;
            font-size: 12px;
        }
    </style>
</head>

<body>

    <!-- TOP BRAND HEADER -->
    <div class="brand-bar d-flex justify-content-between">
        <div><strong>maximus</strong> <small>DEPARTMENT OF MEDICAID</small></div>
        <div>Resources &nbsp; FAQ &nbsp; Contact us <i class="bi bi-person-circle ms-2"></i></div>
    </div>

    <!-- WHITE MENU -->
    <div class="menu-bar d-flex justify-content-between align-items-center">
        <ul class="nav">
            <li class="nav-item"><a class="nav-link" href="#">My Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Provider Network Management</a></li>
            <li class="nav-item"><a class="nav-link active" href="#">Correspondence</a></li>
        </ul>
        <div class="text-end small">
            John Doe<br>
            Last Login: 05/31/2022 | 02:18 PM
        </div>
    </div>

    <div class="container my-4">

        <!-- SEARCH -->
        <div class="page-card mb-4">
            <div class="page-card-header">
                Search Correspondence <i class="bi bi-info-circle"></i>
            </div>
            <div class="p-3">
                <div class="row g-3">

                    <div class="col-md-6">
                        <label>Medicaid ID</label>
                        <input class="form-control" placeholder="Enter">
                    </div>

                    <div class="col-md-6">
                        <label>Reg ID</label>
                        <input class="form-control" placeholder="Enter">
                    </div>

                    <div class="col-md-6">
                        <label>Provider ID</label>
                        <input class="form-control" placeholder="Enter">
                    </div>

                    <div class="col-md-6">
                        <label>NPI</label>
                        <input class="form-control" placeholder="Enter">
                    </div>

                    <div class="col-md-6 date-wrapper">
                        <label>Date Available From</label>
                        <input class="form-control datepicker" placeholder="MM/DD/YYYY">
                        <i class="bi bi-calendar"></i>
                    </div>

                    <div class="col-md-6 date-wrapper">
                        <label>Date Available To</label>
                        <input class="form-control datepicker" placeholder="MM/DD/YYYY">
                        <i class="bi bi-calendar"></i>
                    </div>
                    <div id="validationMsg" class="alert alert-danger d-none"></div>

                </div>

                <div class="text-end mt-3">
                    <button class="btn btn-outline-secondary me-2" id="btnReset">
                        <i class="bi bi-arrow-counterclockwise"></i>Reset
                    </button>

                    <button class="btn btn-purple" id="btnSearch">
                        <i class="bi bi-search"></i>Search
                    </button>
                </div>
            </div>
        </div>

        <!-- RESULTS -->
        <div class="page-card">
            <div class="page-card-header">
                Correspondence Search Results <i class="bi bi-info-circle"></i>
            </div>
            <div class="p-3 table-responsive">
                <div id="correspondence-grid-container" class="d-none"></div>

                <%--<table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Correspondence Subject</th>
                            <th>Medicaid ID</th>
                            <th>Reg ID</th>
                            <th>Provider ID</th>
                            <th>NPI</th>
                            <th>Date From</th>
                            <th>Date To</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a class="open-popup">Provider Credentialing – Final Request</a></td>
                            <td>123456789</td>
                            <td>123456</td>
                            <td>987654</td>
                            <td>1184662058</td>
                            <td>01/05/2024</td>
                            <td>01/10/2024</td>
                        </tr>
                        <tr>
                            <td><a class="open-popup">Provider Credentialing – Second Request</a></td>
                            <td>123456780</td>
                            <td>123457</td>
                            <td>987655</td>
                            <td>1184662059</td>
                            <td>02/02/2024</td>
                            <td>02/07/2024</td>
                        </tr>
                        <tr>
                            <td><a class="open-popup">Provider Credentialing – Initial Request</a></td>
                            <td>123456781</td>
                            <td>123458</td>
                            <td>987656</td>
                            <td>1184662060</td>
                            <td>03/01/2024</td>
                            <td>03/06/2024</td>
                        </tr>
                    </tbody>
                </table>--%>
            </div>
        </div>

    </div>

    <!-- ===== POPUP ===== -->
    <!-- Modal -->
    <div class="modal fade" id="correspondenceModal" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">

                <!-- Header -->
                <div class="modal-header">
                    <h5 class="modal-title">Provider Communication</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Body -->
                <div class="modal-body provider-box" id="printArea">

                    <!-- Provider Details -->
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <strong>JEANINE PETERS DPM</strong><br>
                            6709 DEER HAVEN RD<br>
                            CONCORD TOWNSHIP, OH 44077-5938
                        </div>
                        <div class="col-md-6 text-md-end">
                            <strong>Provider Name:</strong> JEANINE A PETERS<br>
                            <strong>NPI:</strong> 1184662058<br>
                            <strong>Registration ID:</strong> 140505
                        </div>
                    </div>

                    <!-- Section -->
                    <div class="section-title">Initial Request</div>

                    <p>Dear Provider,</p>

                    <p>
                        Your Ohio Medicaid Provider Credentialing Application could not be processed as submitted.
                    Your provider credentialing application has been returned because Ohio Medicaid Credentialing
                    requires additional information to process the application.
                    </p>

                    <p>Please see the return reasons below:</p>

                    <p>
                        <strong>P068</strong> – CAQH Application Not Found. Please log into CAQH and complete CAQH application
                    or provide the CAQH Provider ID.
                    </p>

                    <p>
                        <strong>P050</strong> – Gap in work history greater than 6 months, please update work history on CAQH,
                    provide CV, or provide explanation for gap.
                    </p>

                    <p>
                        <strong>P052</strong> – No DEA for practice state. Please provide DEA#, information regarding the
                    practitioner prescribing on your behalf, or explanation of why DEA is not needed.
                    </p>

                    <p><strong>P066</strong> – Other.</p>

                    <p class="mt-3">
                        Within the next 3 business days, please log into the Provider Network Management system to complete
                    and resubmit your provider Credentialing application request.
                    </p>

                    <p class="fw-semibold mt-4">ENROLL</p>
                </div>

                <!-- Footer -->
                <div class="modal-footer justify-content-end gap-2">
                    <button type="button" class="btn btn-light px-4" data-bs-dismiss="modal">
                        Close
                    </button>

                    <button type="button" class="btn btn-purple px-4" id="btnPrint">
                        <i class="bi bi-printer me-1"></i>Print
                    </button>
                </div>

            </div>
        </div>
    </div>


    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Include jsPDF and AutoTable -->
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>


    <script src="Scripts/DataGridB5/datagrid.plugin.b5.js"></script>



    <script>

        $(document).on('click', '.open-popup', function () {
            const correspondenceId = $(this).data('id');

            // (Optional) load details by ID later
            $('#correspondenceModal').modal('show');
        });


        $(function () {

            // Datepicker
            $(".datepicker").datepicker({
                dateFormat: "mm/dd/yy"
            });

            // Search click
            $("#btnSearch").on("click", function () {

                $("#validationMsg").addClass("d-none").text("");

                const medicaidId = $("input[placeholder='Enter']").eq(0).val().trim();
                const regId = $("input[placeholder='Enter']").eq(1).val().trim();
                const providerId = $("input[placeholder='Enter']").eq(2).val().trim();
                const npi = $("input[placeholder='Enter']").eq(3).val().trim();
                const dateFrom = $(".datepicker").eq(0).val().trim();
                const dateTo = $(".datepicker").eq(1).val().trim();

                // Check at least one field
                if (!medicaidId && !regId && !providerId && !npi && !dateFrom && !dateTo) {
                    showError("Please enter at least one search criteria.");
                    return;
                }

                // Date validation
                if ((dateFrom && !dateTo) || (!dateFrom && dateTo)) {
                    showError("Please select both Date Available From and Date Available To.");
                    return;
                }

                if (dateFrom && dateTo) {
                    const from = new Date(dateFrom);
                    const to = new Date(dateTo);

                    if (from > to) {
                        showError("Date Available From cannot be greater than Date Available To.");
                        return;
                    }
                }

                // ✅ VALID SEARCH
                const request = {
                    medicaidId: medicaidId || null,
                    regId: regId,
                    providerId: providerId,
                    npi: npi,
                    dateFrom: dateFrom || null,
                    dateTo: dateTo || null
                };

                fetchCorrespondence(request);
            });

            // Reset click
            $("#btnReset").on("click", function () {

                // Clear input fields
                $("input.form-control").val("");

                // Clear datepickers
                $(".datepicker").datepicker("setDate", null);

                // Hide validation message
                $("#validationMsg").addClass("d-none").text("");

                // ✅ Clear grid
                clearCorrespondenceGrid();
            });


            // Popup open
            $(".open-popup").on("click", function () {
                $("#correspondenceModal").modal("show");
            });


            function showError(msg) {
                $("#validationMsg").removeClass("d-none").text(msg);
            }
        });


        function fetchCorrespondence(request) {

            debugger;

            $.ajax({
                url: 'http://localhost:53393//api/correspondence/search',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(request),

                success: function (response) {
                    debugger;
                    $('#correspondence-grid-container')
                        .removeClass('d-none')
                        .dataGrid({
                            data: response,

                            columns: [
                                {
                                    key: 'subject',
                                    title: 'Correspondence Subject',
                                    type: 'text',
                                    sortable: true,
                                    cellTemplate: function (row) {
                                        return `
                                    <a href="javascript:void(0)"
                                       class="open-popup"
                                       data-id="${row.correspondenceId}">
                                       ${row.subject}
                                    </a>`;
                                    }
                                },
                                { key: 'medicaidId', title: 'Medicaid ID', type: 'text', sortable: true },
                                { key: 'regId', title: 'Reg ID', type: 'text', sortable: true },
                                { key: 'providerId', title: 'Provider ID', type: 'text', sortable: true },
                                { key: 'npi', title: 'NPI', type: 'text', sortable: true },
                                { key: 'dateAvailableFrom', title: 'Date From', type: 'date', sortable: true },
                                { key: 'dateAvailableTo', title: 'Date To', type: 'date', sortable: true }
                            ],
                            /*tableClass: 'table table-bordered correspondence-table',*/
                            tableClass: 'table correspondence-table',
                            gridTitle: '',
                            noDataMessage: 'No correspondence found.',
                            idProperty: 'correspondenceId',

                            enableAllColumnSearch: false,
                            enableColumnFilters: true,
                            enableColumnVisibility: false,
                            enableSorting: true,

                            dateFormat: 'MM-DD-YYYY',
                            includeTime: false,

                            exportOptions: {
                                enable: false,
                                copy: false,
                                excel: false,
                                pdf: false
                            }
                        });
                },

                error: function (err) {
                    alert("Error loading correspondence data.");
                    console.error(err);
                },

                complete: function () {
                    //hideLoader();
                }
            });
        }

        function clearCorrespondenceGrid() {
            const $grid = $('#correspondence-grid-container');

            // Remove plugin-generated HTML
            $grid.empty();

            // Hide container again
            $grid.addClass('d-none');
        }


    </script>



</body>
</html>

