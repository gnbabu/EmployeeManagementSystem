//function bindFileTypes() {
//    $.ajax({
//        url: "http://localhost:53393/api/attachments/filetypes",
//        method: "GET",
//        success: function (data) {
//            var ddl = $("#ddlFileType");
//            ddl.empty();
//            /*ddl.append($("<option disabled selected></option>").val("").text("-- Select File Type --"));*/
//            data.forEach(item => {
//                ddl.append($("<option></option>").val(item.value).text(item.text));
//            });
//        },
//        error: function () {
//            alert("Failed to load file types.");
//        }
//    });
//}

async function bindFileTypes() {
    try {
        debugger;
        const data = await CommonAjaxCall({
            url: "http://localhost:53393/api/attachments/filetypes",
            method: "GET"
        });

        const ddl = $("#ddlFileType");
        ddl.empty();
        /* ddl.append($("<option disabled selected></option>").val("").text("-- Select File Type --")); */
        data.forEach(item => {
            ddl.append($("<option></option>").val(item.value).text(item.text));
        });

    } catch (error) {
        alert("Failed to load file types.");
        console.error(error);
    }
}

function uploadFile() {
    const fileInput = document.getElementById("fuAttachment");
    const file = fileInput.files[0];
    const fileType = $("#ddlFileType").val();
    const notes = $("#txtNotes").val();

    if (!file) return alert("Please select a file.");
    if (!fileType) return alert("Please select file type.");

    // Show progress bar
    $("#uploadProgressContainer").show();
    $("#uploadProgress").val(0);

    addAttachmentRow({ fileName: file.name, fileType, notes });

    fileInput.value = "";
    $("#ddlFileType").val("");
    $("#txtNotes").val("");

    // Get pre-signed URL
    //$.ajax({
    //    url: "/api/upload/presign",
    //    type: "POST",
    //    data: JSON.stringify({ fileName: file.name }),
    //    contentType: "application/json",
    //    success: function (data) {
    //        // Upload to S3 using presigned URL
    //        $.ajax({
    //            url: data.url,
    //            type: "PUT",
    //            data: file,
    //            processData: false,
    //            contentType: file.type,
    //            xhr: function () {
    //                var xhr = new window.XMLHttpRequest();
    //                xhr.upload.addEventListener("progress", function (evt) {
    //                    if (evt.lengthComputable) {
    //                        var percent = evt.loaded / evt.total * 100;
    //                        $("#uploadProgress").val(percent);
    //                    }
    //                }, false);
    //                return xhr;
    //            },
    //            success: function () {
    //                addAttachmentRow({ fileName: file.name, fileType, notes, s3Url: data.url });
    //                $("#uploadProgressContainer").hide();
    //                fileInput.value = "";
    //                $("#ddlFileType").val("");
    //                $("#txtNotes").val("");
    //            },
    //            error: function () {
    //                alert("Upload failed.");
    //                $("#uploadProgressContainer").hide();
    //            }
    //        });
    //    },
    //    error: function () {
    //        alert("Could not get S3 URL.");
    //        $("#uploadProgressContainer").hide();
    //    }
    //});
}

function addAttachmentRow(attachment) {
    const attachments = JSON.parse($("#hfAttachmentsJson").val() || "[]");
    attachments.push(attachment);
    $("#hfAttachmentsJson").val(JSON.stringify(attachments));

    const row = `
        <tr>
            <td>${attachment.fileName}</td>
            <td>${attachment.fileType}</td>
            <td>${attachment.notes}</td>
            <td>
                <a href="${attachment.s3Url}" target="_blank">Download</a>
                <a href="#" onclick="deleteAttachment('${attachment.fileName}'); return false;">Delete</a>
            </td>
        </tr>`;
    $("#tblAttachments tbody").append(row);
}

function deleteAttachment(fileName) {
    let attachments = JSON.parse($("#hfAttachmentsJson").val() || "[]");
    attachments = attachments.filter(a => a.fileName !== fileName);
    $("#hfAttachmentsJson").val(JSON.stringify(attachments));
    $("#tblAttachments tbody").empty();
    attachments.forEach(addAttachmentRow);
}

$(document).ready(async function () {
    await bindFileTypes(); // Load file types asynchronously

    // Restore attachment table
    const existing = $("#hfAttachmentsJson").val();
    if (existing) {
        const attachments = JSON.parse(existing);
        attachments.forEach(addAttachmentRow);
    }
});

function CommonAjaxCall(options) {
    // Default AJAX settings
    var defaults = {
        url: '',
        method: 'GET',
        data: {},
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        timeout: 5000, // Request timeout in milliseconds
        useGlobalErrorHandler: true,
        success: function (response) {
            console.log("Request succeeded:", response);
        },
        error: function (xhr, status, error) {
            console.error("Request failed:", error);
        }
    };

    // Merge user-provided options with defaults
    var settings = $.extend({}, defaults, options);

    // Convert data to JSON string for non-GET requests
    if (settings.method.toUpperCase() !== 'GET' && typeof settings.data === 'object') {
        settings.data = JSON.stringify(settings.data);
    }

    // Create a Deferred object to manage asynchronous execution
    var dfd = $.Deferred();
    var jqXHRRequest = null;

    // Make AJAX request
    jqXHRRequest = $.ajax({
        url: settings.url,
        type: settings.method,
        data: settings.data,
        dataType: settings.dataType,
        contentType: settings.contentType,
        timeout: settings.timeout,
        success: function (response) {
            settings.success(response);
            dfd.resolve(response);
        },
        error: function (xhr, status, error) {
            if (settings.useGlobalErrorHandler && typeof window.globalAjaxErrorHandler === "function") {
                window.globalAjaxErrorHandler(xhr, status, error);
            }
            settings.error(xhr, status, error);
            dfd.reject(xhr, status, error);
        }
    });

    // Augment the promise with an abort method for cancellation
    var promise = dfd.promise();
    promise.abort = function () {
        if (jqXHRRequest) {
            jqXHRRequest.abort();
        }
    };

    return promise;
}
