<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Data Grid</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        .filter-icon {
            cursor: pointer;
        }

        .filter-toggle {
            padding: 0 6px;
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
    <div class="container-fluid">
        <h4>Employee Data Grid</h4>

        <div class="mb-2">
            Page Size:
        <select id="pageSize" class="form-select form-select-sm d-inline w-auto">
            <option>5</option>
            <option selected>10</option>
            <option>20</option>
            <option>50</option>
        </select>
        </div>

        <table class="table table-bordered table-sm align-middle table-striped">
            <thead>
                <tr id="table-head"></tr>
            </thead>
            <tbody id="table-body"></tbody>
        </table>

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
            { key: 'joiningDate', title: 'Joining Date', type: 'text' },
        ];

        const data = Array.from({ length: 50 }, (_, i) => ({
            name: `Employee ${i + 1}`,
            age: 22 + (i % 15),
            email: `emp${i + 1}@company.com`,
            salary: 40000 + (i % 10) * 5000,
            department: ['HR', 'Sales', 'IT', 'Marketing'][i % 4],
            city: ['New York', 'London', 'Berlin', 'Delhi', 'Tokyo'][i % 5],
            country: ['USA', 'UK', 'Germany', 'India', 'Japan'][i % 5],
            position: ['Manager', 'Developer', 'Analyst', 'Designer'][i % 4],
            experience: 1 + (i % 10),
            joiningDate: `202${i % 4}-0${(i % 9) + 1}-15`
        }));

        let filters = {};
        let page = 1;
        let sortKey = null;
        let sortAsc = true;

        function buildTableHeader() {
            const $thead = $('#table-head').empty();
            columns.forEach(col => {
                $thead.append(`
                <th class="sortable" data-key="${col.key}">
                    <span class="sort-label">${col.title}</span>
                    <span class="sort-indicator"></span>
                    <div class="input-group input-group-sm mt-1">
                        <input type="text" class="form-control filter-input" data-key="${col.key}" placeholder="Filter..." />
                        <div class="dropdown">
                            <button class="btn btn-outline-secondary dropdown-toggle filter-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="bi bi-funnel-fill"></i>
                            </button>
                            <div class="dropdown-menu p-2 filter-menu" data-key="${col.key}">
                                <select class="form-select form-select-sm mb-2 filter-operator">
                                    <option value="eq">Equal</option>
                                    <option value="neq">Not Equal</option>
                                    ${col.type === 'number'
                        ? `<option value="lt">Less Than</option>
                                    <option value="gt">Greater Than</option>
                                    <option value="lte">Less Than or Equal</option>
                                    <option value="gte">Greater Than or Equal</option>
                                    <option value="between">Between</option>`
                        : `<option value="contains">Contains</option>
                                    <option value="startsWith">Starts With</option>
                                    <option value="endsWith">Ends With</option>`}
                                </select>
                                <div class="d-flex justify-content-between">
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
            return data.filter(row => {
                return Object.entries(filters).every(([key, filter]) => {
                    const val = row[key];
                    const inputVal = isNaN(filter.val1) ? filter.val1.toLowerCase() : parseFloat(filter.val1);
                    const rowVal = typeof val === 'string' ? val.toLowerCase() : val;

                    switch (filter.op) {
                        case 'eq': return rowVal == inputVal;
                        case 'neq': return rowVal != inputVal;
                        case 'lt': return rowVal < inputVal;
                        case 'gt': return rowVal > inputVal;
                        case 'lte': return rowVal <= inputVal;
                        case 'gte': return rowVal >= inputVal;
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
            const totalPages = Math.ceil(filtered.length / pageSize);
            const pageData = filtered.slice((page - 1) * pageSize, page * pageSize);

            const $tbody = $('#table-body').empty();
            pageData.forEach(row => {
                const tr = $('<tr>');
                columns.forEach(col => {
                    tr.append(`<td>${row[col.key]}</td>`);
                });
                $tbody.append(tr);
            });

            const $pagination = $('#pagination').empty();
            for (let i = 1; i <= totalPages; i++) {
                $pagination.append(`
            <li class="page-item ${i === page ? 'active' : ''}">
                <a class="page-link" href="#">${i}</a>
            </li>
        `);
            }

            // 👉 Set page info on the left
            $('#page-info').text(`Total: ${filtered.length} items | Page ${page} of ${totalPages}`);
        }


        $(document).ready(() => {
            buildTableHeader();
            renderTable();


            $('#pageSize').change(() => {
                page = 1;
                renderTable();
            });

            $('#pagination').on('click', 'a', function (e) {
                e.preventDefault();
                page = parseInt($(this).text());
                renderTable();
            });

            $(document).on('click', '.apply-filter', function () {
                const menu = $(this).closest('.filter-menu');
                const key = menu.data('key');
                const operator = menu.find('.filter-operator').val();
                const inputVal = $(`.filter-input[data-key="${key}"]`).val();

                if (inputVal !== '') {
                    filters[key] = {
                        op: operator,
                        val1: inputVal,
                        val2: null
                    };
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
                delete filters[key];
                $(`.filter-input[data-key="${key}"]`).val('');
                page = 1;
                renderTable();
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

        });
    </script>
</body>
</html>
