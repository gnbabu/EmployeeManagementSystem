<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="EmployeeManagementSystem.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">
        <h2 class="text-center">Employee Management</h2>

        <div class="row">
            <!-- Employee Form -->
            <div class="col-md-4">
                <h4>Add/Edit Employee</h4>
                <form id="employeeForm">
                    <input type="hidden" id="empId">
                    <div class="mb-3">
                        <label class="form-label">Name:</label>
                        <input type="text" id="empName" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Role:</label>
                        <input type="text" id="empRole" class="form-control">
                    </div>
                    <button id="saveButton" type="button" class="btn btn-primary" onclick="saveEmployee()">Save</button>
                    <button type="button" class="btn btn-secondary" onclick="resetForm()">Clear</button>
                </form>
            </div>

            <!-- Employee Table -->
            <div class="col-md-8">
                <h4>Employee List</h4>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="employeeTableBody">
                        <!-- Employees will be dynamically inserted here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>    
</asp:Content>
