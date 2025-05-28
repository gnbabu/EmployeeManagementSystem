<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttachmentsDemoPlugin.aspx.cs" Inherits="EmployeeManagementSystem.AttachmentsDemoPlugin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="Scripts/Attachments/jquery.reusableGrid.js"></script>
    <script src="Scripts/Attachments/AttachmentsGrid.js"></script>
    <style>
        .my-custom-table {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ccc;
            background-color: #fefefe;
        }

            .my-custom-table thead th {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: left;
                border: 1px solid #ccc;
            }

            .my-custom-table tbody td {
                padding: 8px;
                border: 1px solid #ccc;
                background-color: #fff;
            }

            .my-custom-table tbody tr:hover {
                background-color: #f5f5f5;
            }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <!-- Attachment Panel -->
        <div class="container">
            <h3>Attachment Manager</h3>

            <!-- Add Attachment Panel -->
            <div class="panel panel-default">
                <div class="panel-body form-inline">
                    <input type="file" id="fileInput" class="form-control" />
                    <select id="docType" class="form-control">
                        <option value="Prescription">Prescription</option>
                        <option value="LabReport">Lab Report</option>
                        <option value="XRay">X-Ray</option>
                    </select>
                    <input type="text" id="notes" class="form-control" placeholder="Notes" />
                    <input type="button" id="addAttachment" class="btn btn-primary" value="Add" />
                </div>
            </div>

            <!-- Attachment Grid -->
            <div id="attachment-grid"></div>
        </div>

    </form>
</body>
</html>
