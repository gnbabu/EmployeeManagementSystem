<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attachments.aspx.cs" Inherits="EmployeeManagementSystem.Attachments" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Attachment Upload</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="Scripts/Attachments.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
    <div class="form-horizontal">

        <!-- File Upload -->
        <div class="form-group">
            <label class="col-sm-2 control-label">Select File</label>
            <div class="col-sm-6">
                <asp:FileUpload ID="fuAttachment" runat="server" CssClass="form-control" ClientIDMode="Static" />
            </div>
        </div>

        <!-- File Type Dropdown -->
        <div class="form-group">
            <label class="col-sm-2 control-label">File Type</label>
            <div class="col-sm-6">
                <%--<asp:DropDownList ID="ddlFileType" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:DropDownList>--%>
                <select id="ddlFileType" class="form-control"></select>
            </div>
        </div>

        <!-- Notes Textbox -->
        <div class="form-group">
            <label class="col-sm-2 control-label">Notes</label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" placeholder="Notes" ClientIDMode="Static" />
            </div>
        </div>

        <!-- Upload Button -->
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <asp:Button ID="btnUpload" runat="server" Text="Upload"
                    CssClass="btn btn-primary"
                    ClientIDMode="Static"
                    OnClientClick="uploadFile(); return false;" />
            </div>
        </div>

        <!-- Progress Bar -->
        <div class="form-group" id="uploadProgressContainer" style="display: none;">
            <div class="col-sm-offset-2 col-sm-6">
                <div class="progress">
                    <div id="uploadProgress" class="progress-bar progress-bar-striped active"
                         role="progressbar" style="width: 0%;">0%
                    </div>
                </div>
            </div>
        </div>

        <!-- Hidden Field for Attachments JSON -->
        <asp:HiddenField ID="hfAttachmentsJson" runat="server" ClientIDMode="Static" />

        <!-- Attachment Table -->
        <div class="form-group">
            <div class="col-sm-12">
                <table id="tblAttachments" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>File Name</th>
                            <th>Type</th>
                            <th>Notes</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>

        <!-- Save Button -->
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-6">
                <asp:Button ID="btnSave" runat="server" Text="Save All"
                    CssClass="btn btn-success"
                    OnClick="btnSave_Click" />
            </div>
        </div>

    </div>
</div>

    </form>
</body>
</html>
