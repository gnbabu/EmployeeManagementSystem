(function ($) {
    $.fn.smartGrid = function (options) {
        const settings = $.extend({
            columns: [],
            data: [],
            pageSize: 10,
            containerSelector: this,
        }, options);

        const $container = $(this);
        let page = 1;
        let sortKey = null;
        let sortAsc = true;
        let filters = {};
        let visibleColumns = {};
        let globalSearchText = '';

        // Initialize visible columns
        settings.columns.forEach(col => {
            visibleColumns[col.key] = true;
        });

        function buildColumnVisibilityDropdown() {
            const $dropdown = $container.find('.column-visibility-dropdown').empty();
            settings.columns.forEach(col => {
                const $li = $(`
                    <li>
                      <label style="font-weight: normal;">
                        <input type="checkbox" class="column-toggle" data-key="${col.key}" ${visibleColumns[col.key] ? 'checked' : ''}>
                        ${col.title}
                      </label>
                    </li>
                `);
                $dropdown.append($li);
            });

            // Bind column toggle checkboxes
            $dropdown.find('.column-toggle').change(function () {
                const key = $(this).data('key');
                visibleColumns[key] = this.checked;
                buildTableHeader();
                renderTable();
            });
        }

        function buildTableHeader() {
            const $thead = $container.find('.table-head').empty();
            settings.columns.forEach(col => {
                if (!visibleColumns[col.key]) return;

                const inputType = col.type === 'number' ? 'number' : col.type === 'date' ? 'date' : 'text';
                const filter = filters[col.key] || {};
                const sortIcon = sortKey === col.key ? (sortAsc ? ' ▲' : ' ▼') : '';

                const $th = $('<th></th>');

                const $label = $(`<strong style="cursor:pointer;">${col.title}${sortIcon}</strong>`);
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

                const $inputGroup = $(`
                    <div class="input-group input-group-sm" style="margin-top: 5px;">
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
                        ? `<option value="lt">Less Than</option>
                           <option value="gt">Greater Than</option>
                           <option value="lte">Less Than or Equal</option>
                           <option value="gte">Greater Than or Equal</option>
                           <option value="between">Between</option>`
                        : `<option value="contains">Contains</option>
                           <option value="startsWith">Starts With</option>
                           <option value="endsWith">Ends With</option>`}
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
                                        <div class="col-xs-6 text-right" style="padding-right: 0px;padding-top: 10px;">
                                            <button type="button" class="btn btn-xs btn-default clear-filter" data-key="${col.key}">Reset</button>
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
                    if ($(this).val() === 'between') {
                        $val2.show();
                    } else {
                        $val2.hide().val('');
                    }
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
                    }

                    if (!value1 && op !== 'between') {
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
                $thead.append($th);
            });
        }

        function parseDate(str) {
            const [dd, mm, yyyy] = str.split('-');
            if (!dd || !mm || !yyyy) return null;
            const date = new Date(`${yyyy}-${mm}-${dd}`);
            return isNaN(date.getTime()) ? null : date;
        }

        function formatValueForSearch(value, col) {
            if (value == null) return '';
            if (col.type === 'date') {
                const date = new Date(value);
                if (!isNaN(date.getTime())) {
                    const day = String(date.getDate()).padStart(2, '0');
                    const month = String(date.getMonth() + 1).padStart(2, '0');
                    const year = date.getFullYear();
                    return `${day}-${month}-${year}`.toLowerCase();
                }
            }
            return value.toString().toLowerCase();
        }

        function applyFilters(data) {
            return data.filter(row => {
                return Object.entries(settings.filters).every(([key, filter]) => {
                    const rawVal = row[key];
                    const val = rawVal !== null && rawVal !== undefined ? rawVal.toString().toLowerCase() : '';
                    const value1 = (filter.value1 || '').toLowerCase();
                    const value2 = (filter.value2 || '').toLowerCase();

                    switch (filter.op) {
                        case 'eq': return val === value1;
                        case 'neq': return val !== value1;
                        case 'lt': return val < value1;
                        case 'gt': return val > value1;
                        case 'lte': return val <= value1;
                        case 'gte': return val >= value1;
                        case 'between': {
                            if (!filter.value1 || !filter.value2) return false;

                            const numVal = parseFloat(val);
                            const numVal1 = parseFloat(filter.value1);
                            const numVal2 = parseFloat(filter.value2);

                            if (!isNaN(numVal) && !isNaN(numVal1) && !isNaN(numVal2)) {
                                return numVal >= numVal1 && numVal <= numVal2;
                            }

                            const dateVal = parseDate(val);
                            const dateVal1 = parseDate(filter.value1);
                            const dateVal2 = parseDate(filter.value2);

                            if (dateVal && dateVal1 && dateVal2) {
                                return dateVal >= dateVal1 && dateVal <= dateVal2;
                            }

                            return false;
                        }
                        case 'contains': return val.includes(value1);
                        case 'startsWith': return val.startsWith(value1);
                        case 'endsWith': return val.endsWith(value1);
                        default: return true;
                    }
                });
            });
        }

        function renderTable() {
            const $tbody = $container.find('tbody').empty();
            let filtered = applyFilters(settings.data);

            // 🔍 Global search
            if (settings.globalSearchText) {
                const search = settings.globalSearchText.toLowerCase().trim();
                if (search) {
                    filtered = filtered.filter(row =>
                        settings.columns.some(col =>
                            settings.visibleColumns[col.key] &&
                            formatValueForSearch(row[col.key], col).includes(search)
                        )
                    );
                }
            }

            // 🔃 Sorting
            if (settings.sortKey) {
                filtered.sort((a, b) => {
                    let valA = a[settings.sortKey], valB = b[settings.sortKey];
                    if (typeof valA === "string") valA = valA.toLowerCase();
                    if (typeof valB === "string") valB = valB.toLowerCase();
                    return settings.sortAsc ? (valA > valB ? 1 : -1) : (valA < valB ? 1 : -1);
                });
            }

            const start = (settings.page - 1) * settings.pageSize;
            const paged = filtered.slice(start, start + settings.pageSize);

            paged.forEach(row => {
                const $tr = $('<tr>');
                settings.columns.forEach(col => {
                    if (!settings.visibleColumns[col.key]) return;
                    let value = row[col.key] ?? '';
                    if (col.type === 'date' && value) {
                        const date = new Date(value);
                        if (!isNaN(date.getTime())) {
                            const day = String(date.getDate()).padStart(2, '0');
                            const month = String(date.getMonth() + 1).padStart(2, '0');
                            const year = date.getFullYear();
                            value = `${day}-${month}-${year}`;
                        }
                    }
                    $tr.append(`<td>${value}</td>`);
                });
                $tbody.append($tr);
            });

            const total = filtered.length;
            if (total > 0) {
                $container.find('.page-info').text(`Showing ${start + 1} to ${Math.min(start + settings.pageSize, total)} of ${total} entries`).show();
                $container.find('.pagination-container').show();
                renderPagination(Math.ceil(total / settings.pageSize));
            } else {
                $container.find('.page-info').hide();
                $container.find('.pagination-container').hide();
            }
        }

        function renderPagination(totalPages) {
            const $pagination = $container.find('.pagination').empty();
            for (let i = 1; i <= totalPages; i++) {
                const $li = $(`<li class="${i === settings.page ? 'active' : ''}"><a href="#">${i}</a></li>`);
                $li.click(function (e) {
                    e.preventDefault();
                    settings.page = i;
                    if (typeof settings.onPageChanged === 'function') {
                        settings.onPageChanged(i);
                    }
                    renderTable();
                });
                $pagination.append($li);
            }
        }

        // Initialization
        buildColumnVisibilityDropdown();
        buildTableHeader();
        renderTable();
    };
})(jQuery);
