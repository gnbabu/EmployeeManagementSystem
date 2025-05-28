$(document).ready(function () {
    var attachments = [];
    var attachmentId = 1;

    function renderAttachmentGrid() {
        $('#attachment-grid').reusableGrid({
            data: attachments,
            //tableClass: "my-custom-table",
            paging: {
                enabled: false,
                serverSide: false,
                pageSize: 5
            },
            columns: [
                {
                    header: '#   Download',
                    width: '100px',
                    template: function (row, i) {
                        return `<span>${i + 1}</span> 
                                        <a href="${row.url}" download="${row.name}">
                                            <img src="Scripts/Attachments/document.png" alt="Download" title="Download"  
                                            style="width: 100%; max-width: 16px; height: auto; vertical-align: middle; margin-left: 8px;" />
                                        </a>`;
                    }

                },
                { header: 'Name', field: 'name' },
                { header: 'Type', field: 'type' },
                { header: 'Notes', field: 'notes' },
                {
                    header: '',
                    template: function (row) {
                        return `<button class="btn btn-sm btn-danger delete-btn" data-id="${row.id}">Delete</button>`;
                    }
                }
            ]
        });
    }

    $('#addAttachment').click(function () {
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];
        var type = $('#docType').val();
        var notes = $('#notes').val();

        if (!file) {
            alert('Please select a file');
            return;
        }

        var reader = new FileReader();
        reader.onload = function (e) {
            attachments.push({
                id: attachmentId++,
                name: file.name,
                type: type,
                notes: notes,
                url: e.target.result
            });
            renderAttachmentGrid();
            $('#fileInput').val('');
            $('#notes').val('');
        };
        reader.readAsDataURL(file);
    });

    $('#attachment-grid').on('click', '.delete-btn', function () {
        var id = $(this).data('id');
        attachments = attachments.filter(function (att) {
            return att.id !== id;
        });
        renderAttachmentGrid();
    });
});