(function ($) {
    $.fn.dataGrid = function (options) {
        // Default settings B3
        let settings = $.extend({
            apiUrl: null,
            data: [],
            columns: [],
            pageSizeOptions: [5, 10, 20, 50, 100],
            initialPageSize: 10,
            tableClass: 'table table-bordered table-striped', // default Bootstrap 3 styling
            gridTitle: 'Data Grid',
            noDataMessage: 'No data available.',
            idProperty: 'id',
            enableAllColumnSearch: false,
            enableColumnFilters: false,
            enableColumnVisibility: false,
            dateFormat: 'MM-DD-YYYY',
            includeTime: false,//  option for formatting dates with time
            enableSorting: false, // overall sorting, defaults to false
            exportOptions: {
                enable: false,    // Overall enable flag for export
                copy: false,      // Enable/disable the Copy button
                excel: false,     // Enable/disable the Excel button
                pdf: false        // Enable/disable the PDF button
            }
        }, options);

        let $element = $(this);
        let data = settings.data;
        let page = 1;
        let pageSize = settings.initialPageSize;
        let sortKey = null;
        let sortAsc = true;
        let filters = {};
        let visibleColumns = {};
        let globalSearchText = '';

        settings.columns.forEach(col => {
            visibleColumns[col.key] = true;
        });

        // Date parsing function
        function parseDate(str) {
            const date = moment(str, settings.dateFormat, true); // strict mode
            return date.isValid() ? date.toDate() : null;
        }

        function formatValueForSearch(value, col) {
            if (value == null) return '';

            if (col.type === 'date') {
                const date = moment(value);
                return date.isValid()
                    ? date.format(settings.dateFormat).toLowerCase()
                    : '';
            }
            return value.toString().toLowerCase();
        }

        function formatDateForDisplay(dateVal) {
            if (!dateVal) return '';

            const m = moment(dateVal, [settings.dateFormat, "YYYY-MM-DD", moment.ISO_8601], true);
            if (!m.isValid()) return '';

            const formatStr = settings.includeTime
                ? `${settings.dateFormat} HH:mm:ss`
                : settings.dateFormat;

            return m.format(formatStr);
        }

        // Helper to convert Moment-like format to jQuery UI format
        function convertToJqueryDateFormat(format) {
            return format
                .replace(/DD/g, 'dd')
                .replace(/MM/g, 'mm')
                .replace(/YYYY/g, 'yy')
                .replace(/YY/g, 'y');
        }

        function buildColumnVisibilityDropdown() {
            const $dropdown = $element.find('.column-visibility-dropdown').empty();
            settings.columns.forEach(col => {
                if (col.type) {
                    const $li = $(`
                    <li>
                        <label style="font-weight: normal;">
                            <input type="checkbox" class="column-toggle" data-key="${col.key}" ${visibleColumns[col.key] ? 'checked' : ''}> ${col.title}
                        </label>
                    </li>
                `);
                    $dropdown.append($li);
                }
            });

            $element.find('.column-toggle').off('change').on('change', function () {
                const key = $(this).data('key');
                visibleColumns[key] = $(this).is(':checked');
                buildTableHeader();
                renderTable();
            });
        }
        function buildTableHeader() {
            const $thead = $element.find('#table-head').empty();
            settings.columns.forEach(col => {
                if (!visibleColumns[col.key]) return;

                const inputType = col.type === 'number' ? 'number' : col.type === 'date' ? 'date' : 'text';
                const filter = filters[col.key] || {};
                const sortIcon = sortKey === col.key ? (sortAsc ? ' ▲' : ' ▼') : '';

                const $th = $('<th></th>');
                if (col.width) $th.css('width', col.width);

                const $label = $(`<strong>${col.title}${sortIcon}</strong>`);

                // Conditionally attach the click event based on column's sortable property and overall enableSorting
                if (settings.enableSorting !== false && col.sortable !== false) {

                    $label.css('cursor', 'pointer'); // Set pointer cursor only when sortable

                    $label.click(() => {
                        if (sortKey === col.key) {
                            sortAsc = !sortAsc;
                        } else {
                            sortKey = col.key;
                            sortAsc = true;
                        }
                        buildTableHeader();
                        renderTable();
                    });
                } else {
                    $label.css('cursor', 'default'); // Remove pointer cursor for non-sortable columns
                }

                if (col.type) {
                    const $inputGroup = $(`
                    <div class="input-group input-group-sm" style="margin-top: 5px; ${settings.enableColumnFilters ? '' : 'display: none;'}">
                        <input type="${inputType}" class="form-control filter-input filter-val1" placeholder="Filter..." data-key="${col.key}" value="${filter.value1 || ''}">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-filter"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-right p-2" style="padding: 10px;">
                                <li style="margin-bottom: 8px;">
                                    <select class="form-control input-sm filter-operator" data-key="${col.key}">
                                        <option value="eq">Equal</option>
                                        <option value="neq">Not Equal</option>
                                        ${col.type === 'number' || col.type === 'date'
                            ? `<option value="lt">Less Than</option> <option value="gt">Greater Than</option> <option value="lte">Less Than or Equal</option> <option value="gte">Greater Than or Equal</option> <option value="between">Between</option>`
                            : `<option value="contains">Contains</option> <option value="startsWith">Starts With</option> <option value="endsWith">Ends With</option>`}
                                    </select>
                                </li>
                                <li style="margin-top: 5px;">
                                    <input type="${inputType}" class="form-control input-sm filter-val2" placeholder="Second value (for between)" style="display: none;" value="${filter.value2 || ''}">
                                </li>
                                <li style="margin-top: 10px;">
                                    <div class="row" style="margin: 0;">
                                        <div class="col-xs-6 text-left" style="padding-left: 0px;padding-top: 10px;">
                                            <button type="button" class="btn btn-xs btn-primary apply-filter" data-key="${col.key}">Apply</button>
                                        </div>
                                        <div class="col-xs-6 text-right" style="padding-right: 0px;padding-top: 10px;">                                            <button type="button" class="btn btn-xs btn-default clear-filter" data-key="${col.key}">Reset</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                `);

                    const $dropdown = $inputGroup.find('.dropdown-menu');
                    const $operator = $dropdown.find('.filter-operator');
                    const $val1 = $inputGroup.find('.filter-val1');
                    const $val2 = $dropdown.find('.filter-val2');

                    $operator.on('change', function () {
                        $(this).val() === 'between' ? $val2.show() : $val2.hide().val('');
                    });

                    if (filter.op === 'between') {
                        $operator.val('between');
                        $val2.show();
                    } else if (filter.op) {
                        $operator.val(filter.op);
                    }

                    $dropdown.find('.apply-filter').click(function () {
                        const op = $operator.val();
                        const value1 = $val1.val().trim();
                        const value2 = op === 'between' ? $val2.val().trim() : '';

                        if (op === 'between' && (!value1 || !value2)) {
                            alert("Please enter both values for 'Between' filter.");
                            return;
                        } else if (!value1) {
                            delete filters[col.key];
                            $val1.val('');
                            $val2.val('').hide();
                            page = 1;
                            renderTable();
                            $dropdown.parent().removeClass('open');
                            return;
                        }

                        filters[col.key] = { op, value1, value2 };
                        page = 1;
                        renderTable();
                        $dropdown.parent().removeClass('open');
                    });

                    $dropdown.find('.clear-filter').click(function () {
                        delete filters[col.key];
                        $operator.val('eq');
                        $val1.val('');
                        $val2.val('').hide();
                        page = 1;
                        renderTable();
                        $dropdown.parent().removeClass('open');
                    });

                    $dropdown.on('click', function (e) {
                        e.stopPropagation();
                    });

                    const $wrapper = $('<div style="display: flex; flex-direction: column;"></div>');
                    $wrapper.append($label).append($inputGroup);
                    $th.append($wrapper);

                    //$thead.append($th);
                }
                $thead.append($th);
            });
        }

        function applyFilters(data) {
            return data.filter(row => {
                return Object.entries(filters).every(([key, filter]) => {
                    const col = settings.columns.find(c => c.key === key);
                    const colType = col?.type || 'text';

                    const rawVal = row[key];
                    const val = rawVal != null ? rawVal.toString().toLowerCase() : '';
                    const value1 = (filter.value1 || '').toLowerCase();
                    const value2 = (filter.value2 || '').toLowerCase();

                    if (colType === 'number') {
                        const numVal = parseFloat(val);
                        const numVal1 = parseFloat(value1);
                        const numVal2 = parseFloat(value2);

                        switch (filter.op) {
                            case 'eq': return numVal === numVal1;
                            case 'neq': return numVal !== numVal1;
                            case 'lt': return numVal < numVal1;
                            case 'gt': return numVal > numVal1;
                            case 'lte': return numVal <= numVal1;
                            case 'gte': return numVal >= numVal1;
                            case 'between': return !isNaN(numVal) && !isNaN(numVal1) && !isNaN(numVal2) && numVal >= numVal1 && numVal <= numVal2;
                            default: return true;
                        }

                    } else if (colType === 'date') {
                        const dateVal = moment(rawVal, [settings.dateFormat, "YYYY-MM-DD", moment.ISO_8601], true);
                        const dateVal1 = moment(filter.value1, [settings.dateFormat, "YYYY-MM-DD", moment.ISO_8601], true);
                        const dateVal2 = moment(filter.value2, [settings.dateFormat, "YYYY-MM-DD", moment.ISO_8601], true);

                        if (!dateVal.isValid()) return false;

                        switch (filter.op) {
                            case 'eq': return dateVal.isSame(dateVal1, 'day');
                            case 'neq': return !dateVal.isSame(dateVal1, 'day');
                            case 'lt': return dateVal.isBefore(dateVal1, 'day');
                            case 'gt': return dateVal.isAfter(dateVal1, 'day');
                            case 'lte': return dateVal.isSameOrBefore(dateVal1, 'day');
                            case 'gte': return dateVal.isSameOrAfter(dateVal1, 'day');
                            case 'between': return dateVal1.isValid() && dateVal2.isValid() && dateVal.isBetween(dateVal1, dateVal2, 'day', '[]');
                            default: return true;
                        }

                    } else {
                        // text/string comparisons
                        switch (filter.op) {
                            case 'eq': return val === value1;
                            case 'neq': return val !== value1;
                            case 'contains': return val.includes(value1);
                            case 'startsWith': return val.startsWith(value1);
                            case 'endsWith': return val.endsWith(value1);
                            default: return true;
                        }
                    }
                });
            });
        }

        function renderTable() {
            const $tbody = $element.find('#table-body').empty();
            let filtered = applyFilters(data);

            if (globalSearchText) {
                const search = globalSearchText?.toLowerCase().trim();
                if (search) {
                    filtered = filtered.filter(row =>
                        settings.columns.some(col =>
                            visibleColumns[col.key] &&
                            formatValueForSearch(row[col.key], col).includes(search)
                        )
                    );
                }
            }

            // Apply sorting if enabled and sortKey exists
            if (settings.enableSorting !== false && sortKey) {
                filtered.sort((a, b) => {
                    let valA = a[sortKey], valB = b[sortKey];
                    if (typeof valA === "string") valA = valA.toLowerCase();
                    if (typeof valB === "string") valB = valB.toLowerCase();
                    return sortAsc ? (valA > valB ? 1 : -1) : (valA < valB ? 1 : -1);
                });
            }

            const start = (page - 1) * pageSize;
            const paged = filtered.slice(start, start + pageSize);

            if (paged.length === 0) {
                const colspan = settings.columns.filter(col => visibleColumns[col.key]).length; // Get number of visible columns
                $tbody.append(`<tr><td colspan="${colspan}" style="text-align: center;">${settings.noDataMessage}</td></tr>`);
            } else {
                paged.forEach(row => {
                    const $tr = $('<tr>');
                    settings.columns.forEach(col => {
                        if (!visibleColumns[col.key]) return;


                        let value = row[col.key];
                        if (value === null || value === undefined || value === '') {
                            value = '';
                        }
                        if (col.cellTemplate !== null && col.cellTemplate !== undefined && col.cellTemplate !== '') {
                            if (typeof col.cellTemplate === 'function') {
                                value = col.cellTemplate(row);
                            } else if (typeof col.cellTemplate === 'string') {
                                value = col.cellTemplate.replace(/{([^}]+)}/g, (match, p1) => row[p1] || '');
                            }
                        }
                        else if (col.type === 'date' && value) {
                            // If date, format for display
                            value = formatDateForDisplay(value);
                        }
                        const widthAttr = col.width ? ` style="width: ${col.width};"` : '';
                        $tr.append(`<td${widthAttr}>${value}</td>`);
                    });
                    $tbody.append($tr);
                });
            }

            if (filtered.length > 0) {
                $element.find('#page-info').text(`Showing ${start + 1} to ${Math.min(start + pageSize, filtered.length)} of ${filtered.length} entries`).show();
                $element.find('#pagination').parent().show();
                renderPagination(Math.ceil(filtered.length / pageSize));
            } else {
                $element.find('#page-info').hide();
                $element.find('#pagination').parent().hide();
            }
        }

        function renderPagination(totalPages) {
            const $pagination = $element.find('#pagination').empty();
            for (let i = 1; i <= totalPages; i++) {
                const $li = $(`<li class="${i === page ? 'active' : ''}"><a href="#">${i}</a></li>`);
                $li.click(function (e) {
                    e.preventDefault();
                    page = i;
                    renderTable();
                });
                $pagination.append($li);
            }
        }

        function fetchDataFromApi() {            
            if (settings.apiUrl) {
                $.ajax({
                    url: settings.apiUrl,
                    method: 'GET',
                    success: function (response) {
                        data = response;
                        page = 1;
                        if (settings.enableColumnVisibility) {
                            buildColumnVisibilityDropdown();
                        }
                        buildTableHeader();
                        renderTable();
                    },
                    error: function (err) {
                        alert("Error loading data.");
                        console.error(err);
                    }
                });
            } else {
                //data = settings.data;
                page = 1;
                if (settings.enableColumnVisibility) {
                    buildColumnVisibilityDropdown();
                }
                buildTableHeader();
                renderTable();
            }
        }

        function initialize() {
            $element.html(`
                <h3>${settings.gridTitle}</h3>

                <div class="row" style="margin-bottom: 10px;">
                    <!-- Left Side Controls -->
                    <div class="col-xs-12 col-md-6">
                        <div class="form-inline">
                            <!-- Rows per page -->
                            <div class="form-group" style="margin-bottom: 10px; margin-right: 10px;">
                                <label class="control-label">Rows per page:</label>
                                <select id="page-size-dropdown" class="form-control input-sm" style="margin-left: 5px;"></select>
                            </div>

                            <!-- Reset Filters -->
                            ${settings.enableColumnFilters ? `
                            <div class="form-group" style="margin-bottom: 10px; margin-right: 10px;">
                                <button id="reset-all-filters" class="btn btn-danger btn-sm">Reset All Filters</button>
                            </div>` : ''}

                            <!-- Column Visibility -->
                            ${settings.enableColumnVisibility ? `
                            <div class="form-group" style="margin-bottom: 10px; margin-right: 10px;">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
                                        Columns <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu column-visibility-dropdown" style="padding: 10px;"></ul>
                                </div>
                            </div>` : ''}

                            <!-- Export Options -->
                            ${settings.exportOptions.enable ? `
                            <div class="form-group" style="margin-bottom: 10px;">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
                                        Export <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" style="padding: 10px;">
                                        ${settings.exportOptions.copy ? `
                                        <li style="margin-bottom: 5px;">
                                            <button class="btn btn-sm btn-primary" id="copy-btn" style="width: 100%;">Copy</button>
                                        </li>` : ''}
                                        ${settings.exportOptions.excel ? `
                                        <li style="margin-bottom: 5px;">
                                            <button class="btn btn-sm btn-success" id="excel-btn" style="width: 100%;">Excel</button>
                                        </li>` : ''}
                                        ${settings.exportOptions.pdf ? `
                                        <li>
                                            <button class="btn btn-sm btn-danger" id="pdf-btn" style="width: 100%;">PDF</button>
                                        </li>` : ''}
                                    </ul>
                                </div>
                            </div>` : ''}
                        </div>
                    </div>

                    <!-- Right Side Search Input -->
                    ${settings.enableAllColumnSearch ? `
                    <div class="col-xs-12 col-md-6 text-right">
                        <div class="form-inline">
                            <!-- Desktop label -->
                            <label for="common-search" class="control-label hidden-xs" style="margin-right: 10px;">Search:</label>

                            <!-- Mobile label -->
                            <label for="common-search" class="control-label visible-xs-block" style="text-align: left;">Search:</label>

                            <input type="text" id="common-search" class="form-control input-sm"
                                   placeholder="Search all columns..."
                                   style="width: 100%; max-width: 300px;">
                        </div>
                    </div>` : ''}
                </div>

                <!-- Table -->
                <div class="table-responsive">
                     <table class="${settings.tableClass}">
                        <thead><tr id="table-head"></tr></thead>
                        <tbody id="table-body"></tbody>
                    </table>
                </div>

                <!-- Pagination + Info -->
                <div class="row" style="margin-top: 10px;">
                    <div class="col-xs-12 col-sm-6">
                        <div id="page-info" class="text-muted small" style="padding-top: 6px;"></div>
                    </div>
                    <div class="col-xs-12 col-sm-6 text-right">
                        <ul class="pagination pagination-sm" id="pagination" style="margin: 0;"></ul>
                    </div>
                </div>
            `);


            let $pageSizeDropdown = $element.find('#page-size-dropdown');
            settings.pageSizeOptions.forEach(size => {
                $pageSizeDropdown.append(`<option value="${size}" ${size === settings.initialPageSize ? 'selected' : ''}>${size}</option>`);
            });

            $element.find('#page-size-dropdown').change(function () {
                pageSize = parseInt($(this).val());
                page = 1;
                renderTable();
            });

            // Event handlers for exporting functionality

            if (settings.exportOptions.copy) {
                $element.find('#copy-btn').click(() => {
                    const visibleCols = settings.columns.filter(c => visibleColumns[c.key]);
                    const filteredData = applyFilters(data);

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

                    $tempTextArea[0].select();

                    try {
                        const successful = document.execCommand('copy');
                        alert(successful ? 'Copied to clipboard!' : 'Copy failed.');
                    } catch (err) {
                        alert('Copy failed.');
                    }

                    $tempTextArea.remove();
                });
            }
            if (settings.exportOptions.excel) {
                $element.find('#excel-btn').click(() => {
                    const visibleCols = settings.columns.filter(c => visibleColumns[c.key]);
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
                    link.setAttribute("download", "export.csv");
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                });
            }

            if (settings.exportOptions.pdf) {
                $element.find('#pdf-btn').click(() => {
                    const { jsPDF } = window.jspdf;
                    const doc = new jsPDF({ orientation: 'landscape' });

                    const visibleCols = settings.columns.filter(c => visibleColumns[c.key]);
                    const filteredData = applyFilters(data);

                    const head = [visibleCols.map(col => col.title)];
                    const body = filteredData.map(row => visibleCols.map(col => row[col.key] ?? ''));

                    const columnStyles = {};
                    visibleCols.forEach((col, idx) => {
                        columnStyles[idx] = { cellWidth: 'wrap' };
                    });

                    doc.autoTable({
                        head: head,
                        body: body,
                        startY: 10,
                        styles: { fontSize: 8 },
                        columnStyles: columnStyles,
                        tableWidth: 'wrap',
                        horizontalPageBreak: true,
                        horizontalPageBreakRepeat: head,
                    });

                    doc.save('export.pdf');
                });
            }
            if (settings.enableColumnFilters) {
                $element.find('#reset-all-filters').click(function () {
                    filters = {};
                    $element.find('.filter-input').val('');
                    $element.find('.filter-operator').val('eq');
                    $element.find('.filter-val2').val('').hide();
                    $element.find('.dropdown').removeClass('open');
                    Object.keys(visibleColumns).forEach(key => {
                        visibleColumns[key] = true;
                    });
                    $element.find('#common-search').val('');
                    globalSearchText = '';
                    $element.find('#page-size-dropdown').val(settings.initialPageSize);
                    pageSize = settings.initialPageSize;
                    sortKey = null; // Reset the sorting key
                    sortAsc = true; // Reset sorting to ascending by default
                    page = 1;
                    if (settings.enableColumnVisibility) {
                        buildColumnVisibilityDropdown();
                    }
                    buildTableHeader();
                    renderTable();
                });
            }
            if (settings.enableAllColumnSearch) {
                $element.find('#common-search').on('input', function () {
                    globalSearchText = $(this).val().toLowerCase();
                    page = 1;
                    renderTable();
                });
            }

            fetchDataFromApi();
        }

        initialize();

        return this;
    };
})(jQuery);