(function ($) {
    $.fn.reusableGrid = function (options) {
        const settings = $.extend(true, {
            columns: [],
            data: [],
            tableClass: 'table table-bordered table-striped',
            paging: {
                enabled: false,
                serverSide: false,
                pageSize: 10,
                onPageChange: null
            }
        }, options);

        const $container = $(this).empty();
        const $table = $(`<table class="${settings.tableClass}"></table>`);
        const $thead = $('<thead><tr></tr></thead>');
        const $tbody = $('<tbody></tbody>');
        const $pager = $('<div class="pagination-wrapper mt-2"></div>');

        let currentPage = 1;

        function renderTable(data, pageStartIndex) {
            $thead.find('tr').empty();
            settings.columns.forEach(col => {
                const widthAttr = col.width ? ` style="width:${col.width};"` : '';
                $thead.find('tr').append(`<th${widthAttr}>${col.header}</th>`);
            });

            $tbody.empty();
            data.forEach((row, i) => {
                const tr = $('<tr></tr>');
                settings.columns.forEach(col => {
                    const widthAttr = col.width ? ` style="width:${col.width};"` : '';
                    if (col.template && typeof col.template === 'function') {
                        tr.append(`<td${widthAttr}>${col.template(row, i)}</td>`);
                    } else {
                        tr.append(`<td${widthAttr}>${row[col.field] ?? ''}</td>`);
                    }
                });
                $tbody.append(tr);
            });

        }

        function renderPagination(total) {
            if (!settings.paging.enabled || settings.paging.serverSide) {
                $pager.empty();
                return;
            }

            const pageCount = Math.ceil(total / settings.paging.pageSize);
            const $ul = $('<ul class="pagination"></ul>');

            for (let i = 1; i <= pageCount; i++) {
                const $li = $(`<li class="page-item ${i === currentPage ? 'active' : ''}"><a class="page-link" href="#">${i}</a></li>`);
                $li.click(e => {
                    e.preventDefault();
                    changePage(i);
                });
                $ul.append($li);
            }

            $pager.empty().append($ul);
        }

        function changePage(page) {
            currentPage = page;

            if (!settings.paging.enabled) {
                // No paging: render all data
                renderTable(settings.data, 0);
                renderPagination(settings.data.length);
                return;
            }

            if (settings.paging.serverSide) {
                settings.paging.onPageChange && settings.paging.onPageChange(page);
                return;
            }

            const start = (page - 1) * settings.paging.pageSize;
            const end = start + settings.paging.pageSize;
            const pageData = settings.data.slice(start, end);

            renderTable(pageData, start);
            renderPagination(settings.data.length);
        }

        function init() {
            $table.empty().append($thead).append($tbody);
            $container.append($table).append($pager);
            changePage(currentPage);
        }

        init();

        // Expose refreshGrid for external update
        this.refreshGrid = function (newData) {
            if (Array.isArray(newData)) {
                settings.data = newData;
            }
            const totalPages = Math.ceil(settings.data.length / settings.paging.pageSize) || 1;
            if (currentPage > totalPages) {
                currentPage = totalPages;
            }
            changePage(currentPage);
        };

        return this;
    };
})(jQuery);
