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

    <!-- Include the external plugin JavaScript file -->
    <script src="Scripts/DataGrid.js"></script>


</head>
<body>


    <div id="employee-grid-container" class="container-fluid" style="min-height: 300px;"></div>

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
                            { key: 'name', title: 'Name', type: 'text', sortable: true },
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
                        gridTitle: 'Employee Data',
                        noDataMessage: 'No employees found.',
                        idProperty: 'name', // If your employee objects have an 'employeeId' property
                        enableAllColumnSearch: true,
                        enableColumnFilters: true,
                        enableColumnVisibility: true,
                        enableSorting: true,
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
                debugger;
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

