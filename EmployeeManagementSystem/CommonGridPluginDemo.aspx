<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonGridPluginDemo.aspx.cs" Inherits="EmployeeManagementSystem.CommonGridPluginDemo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Data Grid</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <!-- Include jsPDF and AutoTable -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>

    <style>
        #column-visibility-dropdown.show {
            display: block;
        }

        .filter-icon {
            cursor: pointer;
        }

        .filter-toggle {
            padding: 2px 6px;
        }

        .dropdown-menu {
            min-width: 200px;
        }

        th {
            white-space: nowrap;
            position: relative;
        }

        .sortable .sort-label {
            cursor: pointer;
            display: inline-block;
            margin-right: 6px;
        }

        .sort-indicator {
            font-size: 0.8rem;
        }
    </style>
</head>
<body class="p-4">
    <div class="container-fluid" id="employee-grid">
        <h4>Employee Data with all types of filters</h4>

        <%--Tool Bar--%>

        <div class="mb-3 d-flex align-items-center gap-2">
            <label for="pageSize" class="form-label mb-0">Page Size:</label>
            <select id="pageSize" class="form-select form-select-sm w-auto">
                <option>5</option>
                <option selected>10</option>
                <option>20</option>
                <option>50</option>
                <option>100</option>
            </select>

            <button id="resetAllFilters" class="btn btn-sm btn-danger ms-2">
                Reset All Filters
            </button>

            <button class="btn btn-sm btn-outline-primary" id="copy-btn">Copy</button>
            <button class="btn btn-sm btn-outline-success" id="excel-btn">Excel</button>
            <button class="btn btn-sm btn-outline-danger" id="pdf-btn">PDF</button>

            <div class="dropdown">
                <button id="columnDropdownBtn" class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button">
                    Column Visibility
                </button>
                <div class="dropdown-menu p-2" id="column-visibility-dropdown" style="min-width: 200px;">
                    <!-- Dynamically filled -->
                </div>
            </div>
        </div>

        <%--Actual Data--%>
        <table class="table table-bordered table-sm align-middle table-striped">
            <thead>
                <tr id="table-head"></tr>
            </thead>
            <tbody id="table-body"></tbody>
        </table>

        <%--Pagination--%>
        <div class="d-flex justify-content-between align-items-center mt-2">
            <div id="page-info" class="small text-muted"></div>
            <nav>
                <ul class="pagination pagination-sm mb-0" id="pagination"></ul>
            </nav>
        </div>

    </div>

    <script>
        const columns = [
            { key: 'name', title: 'Name', type: 'text' },
            { key: 'age', title: 'Age', type: 'number' },
            { key: 'email', title: 'Email', type: 'text' },
            { key: 'salary', title: 'Salary', type: 'number' },
            { key: 'department', title: 'Department', type: 'text' },
            { key: 'city', title: 'City', type: 'text' },
            { key: 'country', title: 'Country', type: 'text' },
            { key: 'position', title: 'Position', type: 'text' },
            { key: 'experience', title: 'Experience (yrs)', type: 'number' },
            { key: 'joiningDate', title: 'Joining Date', type: 'date' }
        ];

        let data = [];
        let filters = {};
        let page = 1;
        let sortKey = null;
        let sortAsc = true;

        let visibleColumns = [...columns.map(c => c.key)];

        function fetchDataFromApi() {
            $.ajax({
                url: 'http://localhost:53393/api/employees/all', // Replace with correct port if needed
                method: 'GET',
                success: function (response) {
                    data = response;
                    page = 1;
                    buildColumnVisibilityDropdown();
                    buildTableHeader();
                    renderTable();
                },
                error: function (err) {
                    alert("Error loading data.");
                    console.error(err);
                }
            });
        }

        function buildTableHeader() {
            const $thead = $('#table-head').empty();
            columns.forEach(col => {

                if (!visibleColumns.includes(col.key)) return;

                $thead.append(`
                <th class="sortable" data-key="${col.key}">
                    <span class="sort-label">${col.title}</span>
                    <span class="sort-indicator"></span>
                    <div class="input-group input-group-sm mt-1">
                        <input type="${col.type === 'date' ? 'date' : col.type === 'number' ? 'number' : 'text'}"
                               class="form-control filter-input filter-input-val1"
                               data-key="${col.key}" placeholder="Filter..." />
                        <div class="dropdown">
                            <button class="btn btn-outline-secondary dropdown-toggle filter-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="bi bi-funnel-fill"></i>
                            </button>
                            <div class="dropdown-menu p-2 filter-menu" data-key="${col.key}">
                                <select class="form-select form-select-sm mb-2 filter-operator">
                                    <option value="eq">Equal</option>
                                    <option value="neq">Not Equal</option>
                                    ${col.type === 'number' || col.type === 'date'
                        ? `<option value="lt">Less Than</option>
                           <option value="gt">Greater Than</option>
                           <option value="lte">Less Than or Equal</option>
                           <option value="gte">Greater Than or Equal</option>
                           <option value="between">Between</option>`
                        : `<option value="contains">Contains</option>
                           <option value="startsWith">Starts With</option>
                           <option value="endsWith">Ends With</option>`}
                                </select>
                                <input type="${col.type === 'date' ? 'date' : col.type === 'number' ? 'number' : 'text'}"
                                       class="form-control filter-input filter-input-val2 mt-2 d-none"
                                       data-key="${col.key}" placeholder="Second Value..." />
                                <div class="d-flex justify-content-between mt-2">
                                    <button class="btn btn-sm btn-primary apply-filter">Apply</button>
                                    <button class="btn btn-sm btn-outline-secondary reset-filter">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </th>
            `);
            });
        }

        function applyFilters(data) {
            if (Object.keys(filters).length === 0) return data;

            return data.filter(row => {
                return Object.entries(filters).every(([key, filter]) => {
                    const col = columns.find(c => c.key === key);
                    const type = col.type;
                    const val = row[key];

                    if (type === 'number' || type === 'date') {
                        let rowVal = type === 'number' ? parseFloat(val) : new Date(val);
                        let val1 = type === 'number' ? parseFloat(filter.val1) : new Date(filter.val1);
                        let val2 = type === 'number' ? parseFloat(filter.val2) : new Date(filter.val2);

                        if (isNaN(rowVal) || isNaN(val1)) return false;

                        switch (filter.op) {
                            case 'between':
                                if (isNaN(val2)) return false;
                                return rowVal >= val1 && rowVal <= val2;
                            case 'eq': return rowVal === val1;
                            case 'neq': return rowVal !== val1;
                            case 'lt': return rowVal < val1;
                            case 'gt': return rowVal > val1;
                            case 'lte': return rowVal <= val1;
                            case 'gte': return rowVal >= val1;
                            default: return true;
                        }
                    }

                    const inputVal = filter.val1.toLowerCase();
                    const rowVal = (val || '').toString().toLowerCase();

                    switch (filter.op) {
                        case 'eq': return rowVal === inputVal;
                        case 'neq': return rowVal !== inputVal;
                        case 'contains': return rowVal.includes(inputVal);
                        case 'startsWith': return rowVal.startsWith(inputVal);
                        case 'endsWith': return rowVal.endsWith(inputVal);
                        default: return true;
                    }
                });
            });
        }

        function applySorting(data) {
            if (!sortKey) return data;
            return [...data].sort((a, b) => {
                let valA = a[sortKey];
                let valB = b[sortKey];
                if (typeof valA === 'string') valA = valA.toLowerCase();
                if (typeof valB === 'string') valB = valB.toLowerCase();
                if (valA < valB) return sortAsc ? -1 : 1;
                if (valA > valB) return sortAsc ? 1 : -1;
                return 0;
            });
        }

        function renderTable() {
            const pageSize = parseInt($('#pageSize').val());
            const filtered = applyFilters(data);
            const sorted = applySorting(filtered);
            const totalPages = Math.ceil(sorted.length / pageSize);
            const pageData = sorted.slice((page - 1) * pageSize, page * pageSize);

            const $tbody = $('#table-body').empty();
            pageData.forEach(row => {
                const tr = $('<tr>');
                columns.forEach(col => {

                    if (!visibleColumns.includes(col.key)) return;

                    let value = row[col.key];
                    if (col.type === 'date' && value) {
                        value = value && !isNaN(new Date(value))
                            ? new Date(value).toISOString().split('T')[0]
                            : '';
                    }
                    tr.append(`<td>${value}</td>`);
                });
                $tbody.append(tr);
            });

            const $pagination = $('#pagination').empty();
            for (let i = 1; i <= totalPages; i++) {
                $pagination.append(`<li class="page-item ${i === page ? 'active' : ''}"><a class="page-link" href="#">${i}</a></li>`);
            }

            $('#page-info').text(`Total: ${filtered.length} items | Page ${page} of ${totalPages}`);
        }

        function buildColumnVisibilityDropdown() {
            const $menu = $('#column-visibility-dropdown').empty();
            columns.forEach(col => {
                $menu.append(`
            <div class="form-check">
                <input class="form-check-input column-toggle" type="checkbox" value="${col.key}" id="col-toggle-${col.key}" checked>
                <label class="form-check-label" for="col-toggle-${col.key}">
                    ${col.title}
                </label>
            </div>
        `);
            });
        }

        $(document).ready(() => {
            fetchDataFromApi();

            $('#pageSize').change(() => {
                page = 1;
                renderTable();
            });

            $('#pagination').on('click', 'a', function (e) {
                e.preventDefault();
                page = parseInt($(this).text());
                renderTable();
            });

            $(document).on('change', '.filter-operator', function () {
                const operator = $(this).val();
                const menu = $(this).closest('.filter-menu');
                const secondInput = menu.find('.filter-input-val2');
                if (operator === 'between') {
                    secondInput.removeClass('d-none');
                } else {
                    secondInput.addClass('d-none').val('');
                }
            });

            $(document).on('click', '.apply-filter', function () {
                const menu = $(this).closest('.filter-menu');
                const key = menu.data('key');
                const operator = menu.find('.filter-operator').val();
                const val1 = $(`.filter-input-val1[data-key="${key}"]`).val()?.trim(); // ✅ FIXED: Access from header
                const val2 = menu.find('.filter-input-val2').val()?.trim();

                if (operator === 'between' && val1 && val2) {
                    filters[key] = { op: operator, val1, val2 };
                } else if (val1) {
                    filters[key] = { op: operator, val1, val2: null };
                } else {
                    delete filters[key];
                }

                page = 1;
                renderTable();
                bootstrap.Dropdown.getInstance(menu.closest('.dropdown').find('.filter-toggle')[0])?.hide();
            });

            $(document).on('click', '.reset-filter', function () {
                const menu = $(this).closest('.filter-menu');
                const key = menu.data('key');

                // Remove from filters object
                delete filters[key];

                // Reset dropdown elements
                menu.find('.filter-operator').val('eq');
                menu.find('.filter-input-val2').addClass('d-none').val('');
                menu.find('.filter-input[data-key="' + key + '"]').val('');

                // Also reset header filter input (val1)
                $('.filter-input-val1[data-key="' + key + '"]').val('');

                page = 1;
                renderTable();

                // Hide dropdown
                bootstrap.Dropdown.getInstance(menu.closest('.dropdown').find('.filter-toggle')[0])?.hide();
            });


            $(document).on('click', '.sort-label', function () {
                const key = $(this).closest('th').data('key');
                if (sortKey === key) {
                    sortAsc = !sortAsc;
                } else {
                    sortKey = key;
                    sortAsc = true;
                }
                renderTable();
            });

            $('#resetAllFilters').on('click', function () {
                // Clear all filters
                filters = {};

                // Reset sorting
                sortKey = null;
                sortAsc = true;

                // Reset pagination
                page = 1;

                // Reset filter inputs & dropdowns
                $('.filter-operator').val('eq');
                $('.filter-input').val('');
                $('.filter-input-val2').addClass('d-none').val('');

                // Reset visible columns
                visibleColumns = [...columns.map(c => c.key)];

                // Re-check all checkboxes
                $('.column-toggle').prop('checked', true)

                // Reset and re-fetch fresh data
                fetchDataFromApi();
            });



            $('#copy-btn').click(() => {
                const visibleCols = columns.filter(c => visibleColumns.includes(c.key));
                const filteredData = applyFilters(data); // get your filtered data

                let copyText = '';
                // Header row
                copyText += visibleCols.map(col => col.title).join('\t') + '\n';

                // Data rows
                filteredData.forEach(row => {
                    copyText += visibleCols.map(col => row[col.key] ?? '').join('\t') + '\n';
                });

                // Copy to clipboard via hidden textarea
                const $tempTextArea = $('<textarea>');
                $tempTextArea.val(copyText)
                    .css({ position: 'absolute', top: '-9999px', left: '-9999px', opacity: 0 })
                    .appendTo('body');

                $tempTextArea[0].focus();
                $tempTextArea[0].select();

                try {
                    const successful = document.execCommand('copy');
                    alert(successful ? 'Copied to clipboard!' : 'Copy failed.');
                } catch (err) {
                    alert('Copy failed.');
                }

                $tempTextArea.remove();
            });


            $('#excel-btn').click(() => {
                const visibleCols = columns.filter(c => visibleColumns.includes(c.key));
                const filteredData = applyFilters(data);

                let csvContent = '';
                csvContent += visibleCols.map(col => `"${col.title}"`).join(',') + '\n';

                filteredData.forEach(row => {
                    csvContent += visibleCols.map(col => `"${row[col.key] ?? ''}"`).join(',') + '\n';
                });

                const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
                const url = URL.createObjectURL(blob);

                const link = document.createElement("a");
                link.setAttribute("href", url);
                link.setAttribute("download", "export.csv"); // 👈 Fix here
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            });


            $('#pdf-btn').click(() => {
                const { jsPDF } = window.jspdf;
                const doc = new jsPDF();

                const visibleCols = columns.filter(c => visibleColumns.includes(c.key));
                const filteredData = applyFilters(data);

                const head = [visibleCols.map(col => col.title)];
                const body = filteredData.map(row => visibleCols.map(col => row[col.key] ?? ''));

                doc.autoTable({
                    head: head,
                    body: body,
                    startY: 10,
                    styles: { fontSize: 8 },
                });

                doc.save('export.pdf');
            });

        });

        $(document).on('change', '.column-toggle', function () {
            const key = $(this).val();
            if ($(this).is(':checked')) {
                if (!visibleColumns.includes(key)) visibleColumns.push(key);
            } else {
                visibleColumns = visibleColumns.filter(k => k !== key);
            }
            buildTableHeader();
            renderTable();
        });

        $(document).on('click', '#columnDropdownBtn', function (e) {
            e.stopPropagation(); // prevent document click from firing
            $('#column-visibility-dropdown').toggleClass('show');
        });

        // Prevent closing dropdown when clicking inside
        $(document).on('click', '#column-visibility-dropdown', function (e) {
            e.stopPropagation();
        });

        // Close dropdown on outside click
        $(document).on('click', function () {
            $('#column-visibility-dropdown').removeClass('show');
        });
    </script>
</body>
</html>

