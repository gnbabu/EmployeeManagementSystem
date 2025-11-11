<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestGridPlugIn.aspx.cs" Inherits="EmployeeManagementSystem.TestGridPlugIn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reusable Data Grid Plugin</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery and Bootstrap scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Include jsPDF and AutoTable -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

    <!-- Include the external plugin JavaScript file -->
    <%--<script src="Scripts/DataGrid.js"></script>--%>
    <script src="Scripts/DataGridB3/DataGridB3Latest.js"></script>

    <style>
        /* Grid wrapper with scroll for Bootstrap 3 */
        .app-grid {
            max-height: 70vh;
            overflow: auto;
            border-radius: 6px;
        }

            /* Table Styling */
            .app-grid table {
                width: 100%;
                border-collapse: collapse;
            }

                .app-grid table thead th {
                    background: #5c3c9e;
                    color: #fff;
                    font-weight: 600;
                    text-align: center;
                    vertical-align: middle;
                    position: sticky;
                    top: 0;
                    z-index: 10;
                }

                .app-grid table thead tr.filter-row th {
                    background: #f4f2fa;
                    font-weight: 500;
                    position: sticky;
                    top: 42px; /* equal to header height */
                    z-index: 9;
                }

                .app-grid table .filter-input {
                    width: 100%;
                    padding: 4px 6px;
                    border-radius: 4px;
                    border: 1px solid #ccc;
                    font-size: 12px;
                }

                /* Table Body */
                .app-grid table tbody tr:nth-child(odd) {
                    background: #f9fbfd;
                }

                .app-grid table tbody tr:nth-child(even) {
                    background: #eef3f9;
                }

                .app-grid table tbody tr:hover {
                    background: #e0e7f1 !important;
                }

                .app-grid table tbody td {
                    padding: 6px;
                    vertical-align: middle;
                    font-size: 14px;
                }

            /* Link */
            .app-grid .reg-link {
                color: #337ab7; /* Bootstrap 3 primary link color */
                text-decoration: underline;
                font-weight: 500;
            }

            /* Pagination (Bootstrap 3) */
            .app-grid .pagination > li > a,
            .app-grid .pagination > li > span {
                color: #5c3c9e;
                border: 1px solid #5c3c9e;
                background-color: #fff;
               
            }

                .app-grid .pagination > li > a:hover,
                .app-grid .pagination > li > span:hover {
                    background-color: #f0f0f0;
                    color: #5c3c9e;
                    
                }

            .app-grid .pagination > .active > a,
            .app-grid .pagination > .active > span,
            .app-grid .pagination > .active > a:hover,
            .app-grid .pagination > .active > span:hover {
                background-color: #5c3c9e;
                border-color: #5c3c9e;
                color: #fff;
            }

            /* Pagination Header Section */
            .app-grid .pagination-header {
                background-color: #f9f9fb;
                padding: 8px 12px;
                border-radius: 6px;
                font-size: 13px;
                color: #333;
                margin-bottom: 8px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

                /* Page Size Selector */
                .app-grid .pagination-header .page-size-selector {
                    font-weight: 500;
                    color: #444;
                    display: inline-block;
                }

                    .app-grid .pagination-header .page-size-selector .custom-page-size {
                        margin-left: 6px;
                        border: 1px solid #5c3c9e;
                        border-radius: 6px;
                        padding: 4px 8px;
                        font-size: 13px;
                        color: #5c3c9e;
                    }

                        .app-grid .pagination-header .page-size-selector .custom-page-size:focus {
                            outline: none;
                            border-color: #43297d;
                            box-shadow: 0 0 4px rgba(92, 60, 158, 0.5);
                        }

                /* Page Info */
                .app-grid .pagination-header .page-info {
                    font-style: italic;
                    color: #5c3c9e;
                }
    </style>
</head>
<body>


    <div id="employee-grid-container" class="container-fluid app-grid" style="min-height: 300px;"></div>

    <div id="customer-grid-container" class="container-fluid" style="min-height: 300px;"></div>

    <script>


        $(document).ready(function () {

            $.ajax({
                url: 'http://localhost:53393/api/employees/all',
                method: 'GET',
                success: function (response) {
                    // Example 1: Employee Data Grid
                    $('#employee-grid-container').dataGrid({
                        // apiUrl: 'http://localhost:53393/api/employees/all',
                        data: response,
                        columns: [
                            {
                                key: 'action',
                                title: '',
                                type: '',
                                sortable: false,
                                cellTemplate: function (row) {
                                    return '<a href="#" id="review-link" class="data-link" data-id="${row.id}">Review</a>';
                                    //`<button class="custom-action" data-id="${row.id}">Action</button>`;
                                }
                                //cellTemplate: '<a href="#" id="review-link" class="data-link" data-id="{id}">Review</a>' // HTML Link Cell Template
                            },
                            { key: 'name', title: 'Name', type: 'text', sortable: true, width: '150px' },
                            { key: 'age', title: 'Age', type: 'number', sortable: false },
                            { key: 'email', title: 'Email', type: 'text', sortable: true },
                            { key: 'salary', title: 'Salary', type: 'number', sortable: false },
                            { key: 'department', title: 'Department', type: 'text', sortable: false },
                            { key: 'city', title: 'City', type: 'text', sortable: false },
                            { key: 'country', title: 'Country', type: 'text', sortable: false },
                            { key: 'position', title: 'Position', type: 'text', sortable: false },
                            { key: 'experience', title: 'Experience (yrs)', type: 'number', sortable: false },
                            { key: 'joiningDate', title: 'Joining Date', type: 'date', sortable: false }
                        ],
                        tableClass: 'table table-bordered table-striped ',
                        gridTitle: 'Employee Data',
                        noDataMessage: 'No employees found.',
                        idProperty: 'name', // If your employee objects have an 'employeeId' property
                        enableAllColumnSearch: true,
                        enableColumnFilters: false,
                        enableColumnVisibility: true,
                        enableSorting: true,
                        dateFormat: 'MM-DD-YYYY',
                        includeTime: false,
                        exportOptions: {
                            enable: true,
                            copy: true,
                            excel: true,
                            pdf: true
                        }

                    });
                },
                error: function (err) {
                    alert("Error loading data.");
                    console.error(err);
                }
            });


            // Bind events externally
            $(document).on('click', '#review-link', function () {
                alert(`Clicked on item`);
            });


        });

        //$('#customer-grid-container').dataGrid({
        //    apiUrl: 'http://localhost:53393/api/customers/all',
        //    columns: [
        //        { key: 'id', title: 'ID', type: 'number' },
        //        { key: 'name', title: 'Name', type: 'text' },
        //        { key: 'email', title: 'Email', type: 'text' },
        //        { key: 'phone', title: 'Phone', type: 'text' },
        //        { key: 'website', title: 'Website', type: 'text' }
        //    ],
        //    gridTitle: 'Customer Data',
        //    noDataMessage: 'No customers found.',
        //    idProperty: 'id',
        //    enableAllColumnSearch: true,
        //    enableColumnFilters: true,
        //    enableColumnVisibility: true,
        //    enableSorting: true,
        //    exportOptions: {
        //        enable: true,
        //        copy: true,
        //        excel: true,
        //        pdf: true
        //    }
        //});

    </script>

</body>
</html>

