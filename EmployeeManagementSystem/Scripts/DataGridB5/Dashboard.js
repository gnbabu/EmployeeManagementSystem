$(document).ready(function () {

    function fetchOrders() {

        var orders = getOrders();

        $('#orders-grid-container')
            .removeClass('d-none')
            .dataGrid({
                data: orders,
                columns: [
                    { key: 'serviceTag', title: 'Service Tag', type: 'text', sortable: true },
                    { key: 'customerSalesOrderNo', title: 'Sales Order No', type: 'text', sortable: true },
                    { key: 'tenantId', title: 'Tenant ID', type: 'text', sortable: false, width: '350px' },
                    { key: 'tenantDomain', title: 'Tenant Domain', type: 'text', sortable: false },
                    { key: 'groupTag', title: 'Group Tag', type: 'text', sortable: false },
                    { key: 'skuNumber', title: 'SKU Number', type: 'text', sortable: false },
                    { key: 'statusComment', title: 'Status Comment', type: 'text', sortable: false },
                    { key: 'creationDate', title: 'Creation Date', type: 'date', sortable: true, width: '200px' },
                    { key: 'lastUpdateDate', title: 'Last Update Date', type: 'date', sortable: true, width: '200px' },
                    { key: 'buid', title: 'BUID', type: 'text', sortable: false }
                ],
                gridTitle: '',
                noDataMessage: 'No orders found.',
                idProperty: 'name',
                enableAllColumnSearch: true,
                enableColumnFilters: true,
                enableColumnVisibility: true,
                enableSorting: true,
                dateFormat: 'MM-DD-YYYY',
                includeTime: true,
                exportOptions: {
                    enable: true,
                    copy: true,
                    excel: true,
                    pdf: true
                }
            });

        //$.ajax({
        //    url: '/Home/GetOrders',
        //    method: 'GET',
        //    data: {
        //        startDate: startDate.format('YYYY-MM-DD'),
        //        endDate: endDate.format('YYYY-MM-DD')
        //    },
        //    success: function (response) {
        //        $('#orders-grid-container')
        //            .removeClass('d-none')
        //            .dataGrid({
        //                data: response,
        //                columns: [
        //                    { key: 'serviceTag', title: 'Service Tag', type: 'text', sortable: true },
        //                    { key: 'customerSalesOrderNo', title: 'Sales Order No', type: 'text', sortable: true },
        //                    { key: 'tenantId', title: 'Tenant ID', type: 'text', sortable: false, width: '350px' },
        //                    { key: 'tenantDomain', title: 'Tenant Domain', type: 'text', sortable: false },
        //                    { key: 'groupTag', title: 'Group Tag', type: 'text', sortable: false },
        //                    { key: 'skuNumber', title: 'SKU Number', type: 'text', sortable: false },
        //                    { key: 'statusComment', title: 'Status Comment', type: 'text', sortable: false },
        //                    { key: 'creationDate', title: 'Creation Date', type: 'date', sortable: true },
        //                    { key: 'lastUpdateDate', title: 'Last Update Date', type: 'date', sortable: true },
        //                    { key: 'buid', title: 'BUID', type: 'text', sortable: false }
        //                ],
        //                gridTitle: '',
        //                noDataMessage: 'No orders found.',
        //                idProperty: 'name',
        //                enableAllColumnSearch: true,
        //                enableColumnFilters: true,
        //                enableColumnVisibility: true,
        //                enableSorting: true,
        //                dateFormat: 'MM-DD-YYYY',
        //                includeTime: true,
        //                exportOptions: {
        //                    enable: true,
        //                    copy: true,
        //                    excel: true,
        //                    pdf: true
        //                }
        //            });
        //    },
        //    error: function (err) {
        //        alert("Error loading data.");
        //        console.error(err);
        //    },
        //    complete: function () {
        //        hideLoader();
        //    }
        //});
    }

    fetchOrders();

});


function getOrders() {
    var orders = [
        {
            "serviceTag": "G14W184",
            "customerSalesOrderNo": "1016371832",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOCZE",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:32",
            "lastUpdateDate": "2025-06-16T17:00:19",
            "buid": ""
        },
        {
            "serviceTag": "DY4XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:32",
            "lastUpdateDate": "2025-06-16T17:00:18",
            "buid": ""
        },
        {
            "serviceTag": "32ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:32",
            "lastUpdateDate": "2025-06-16T17:00:13",
            "buid": ""
        },
        {
            "serviceTag": "41ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:31",
            "lastUpdateDate": "2025-06-17T17:15:17",
            "buid": ""
        },
        {
            "serviceTag": "405XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-17T16:54:31",
            "lastUpdateDate": "2025-06-18T17:00:15",
            "buid": ""
        },
        {
            "serviceTag": "73ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-18T16:54:31",
            "lastUpdateDate": "2025-06-16T17:00:14",
            "buid": ""
        },
        {
            "serviceTag": "C2ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:30",
            "lastUpdateDate": "2025-06-16T17:00:13",
            "buid": ""
        },
        {
            "serviceTag": "166XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:30",
            "lastUpdateDate": "2025-06-16T17:00:12",
            "buid": ""
        },
        {
            "serviceTag": "HX4XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:29",
            "lastUpdateDate": "2025-06-16T17:00:12",
            "buid": ""
        },
        {
            "serviceTag": "6W6WT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:29",
            "lastUpdateDate": "2025-06-16T17:00:11",
            "buid": ""
        },
        {
            "serviceTag": "685XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:29",
            "lastUpdateDate": "2025-06-16T17:00:11",
            "buid": ""
        },
        {
            "serviceTag": "45ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:28",
            "lastUpdateDate": "2025-06-16T17:00:10",
            "buid": ""
        },
        {
            "serviceTag": "936XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-20T16:54:28",
            "lastUpdateDate": "2025-06-16T17:00:09",
            "buid": ""
        },
        {
            "serviceTag": "3Z4XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:28",
            "lastUpdateDate": "2025-06-16T17:00:09",
            "buid": ""
        },
        {
            "serviceTag": "F56XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-15T16:54:28",
            "lastUpdateDate": "2025-06-15T17:00:18",
            "buid": ""
        },
        {
            "serviceTag": "B75XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-14T16:54:27",
            "lastUpdateDate": "2025-06-14T17:00:08",
            "buid": ""
        },
        {
            "serviceTag": "7Z4XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-05-16T16:54:27",
            "lastUpdateDate": "2025-05-16T17:00:06",
            "buid": ""
        },
        {
            "serviceTag": "9ZJWT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:26",
            "lastUpdateDate": "2025-06-16T17:00:05",
            "buid": ""
        },
        {
            "serviceTag": "54ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED1",
            "creationDate": "2025-02-16T16:54:26",
            "lastUpdateDate": "2025-02-16T17:00:04",
            "buid": ""
        },
        {
            "serviceTag": "D6BWT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED2",
            "creationDate": "2025-06-16T16:54:26",
            "lastUpdateDate": "2025-06-16T17:00:03",
            "buid": ""
        },
        {
            "serviceTag": "G85XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:25",
            "lastUpdateDate": "2025-06-16T17:00:03",
            "buid": ""
        },
        {
            "serviceTag": "7H5XT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:25",
            "lastUpdateDate": "2025-06-16T17:15:12",
            "buid": ""
        },
        {
            "serviceTag": "H4ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:25",
            "lastUpdateDate": "2025-06-16T17:00:02",
            "buid": ""
        },
        {
            "serviceTag": "22ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-06-16T16:54:24",
            "lastUpdateDate": "2025-06-16T17:00:01",
            "buid": ""
        },
        {
            "serviceTag": "H1ZVT74",
            "customerSalesOrderNo": "1014752555",
            "tenantId": "e0793d39-0939-496d-b129-198edd916feb",
            "tenantDomain": "accenture.onmicrosoft.com",
            "groupTag": "CIOBEL",
            "skuNumber": "NA",
            "statusComment": "JACKED",
            "creationDate": "2025-01-25T16:54:24",
            "lastUpdateDate": "2025-01-25T17:00:01",
            "buid": ""
        }
    ];

    return orders;
}

//Custom cell templates Sample

//{
//    key: 'action',
//    title: '',
//    type: 'action',
//    sortable: false,
//    cellTemplate: function (row) {
//        return `<a href="#" class="data-link text-primary" data-id="${row.serviceTag}">Review</a>`;
//    }
//},
//{
//    key: 'creationDate', title: 'Creation Date', type: 'date', sortable: true,
//    cellTemplate: function (row) {
//        const rawDate = row.creationDate;
//        const formatted = moment(rawDate, moment.ISO_8601).isValid()
//            ? moment(rawDate).format('DD-MM-YYYY HH:mm:ss')
//            : '';

//        return `<span data-id="${rawDate}">${formatted}</span>`;
//    }
//}