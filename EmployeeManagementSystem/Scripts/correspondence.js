



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

    $(document).on('click', '.open-popup', function () {
        const correspondenceId = $(this).data('id');

        // (Optional) load details by ID later
        $('#correspondenceModal').modal('show');
    });

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


