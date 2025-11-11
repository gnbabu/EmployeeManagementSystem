$(document).ready(function () {
    const employeesData = [
        { id: 1, firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com', position: 'Software Engineer', hireDate: '2019-07-15', salary: 85000 },
        { id: 2, firstName: 'Mary', lastName: 'Smith', email: 'mary.smith@example.com', position: 'Project Manager', hireDate: '2017-05-22', salary: 95000 },
        { id: 3, firstName: 'Robert', lastName: 'Johnson', email: 'robert.johnson@example.com', position: 'QA Analyst', hireDate: '2020-11-01', salary: 65000 },
        { id: 4, firstName: 'Lisa', lastName: 'Brown', email: 'lisa.brown@example.com', position: 'UI/UX Designer', hireDate: '2018-03-10', salary: 70000 },
        { id: 5, firstName: 'James', lastName: 'Williams', email: 'james.williams@example.com', position: 'DevOps Engineer', hireDate: '2016-12-05', salary: 90000 }
    ];

    $('#employeeGrid').dataGrid({
        gridTitle: "Employees",
        data: employeesData,
        columns: [
            { key: "id", title: "ID", width: "50px", type: "number", sortable: true },
            { key: "firstName", title: "First Name", type:'text',  width: "120px", sortable: true },
            { key: "lastName", title: "Last Name", type: 'text', width: "120px", sortable: true },
            { key: "email", title: "Email", width: "200px", type: 'text', sortable: true },
            { key: "position", title: "Position", width: "150px", sortable: true },
            {
                key: "hireDate", title: "Hire Date", width: "110px", type: "date", sortable: true,
                cellTemplate: function (row) {
                    return moment(row.hireDate).format('MM-DD-YYYY');
                }
            },
            {
                key: "salary", title: "Salary", width: "100px", type: "number", sortable: true,
                cellTemplate: (row) => `$${row.salary.toLocaleString()}`
            }
        ],
        initialPageSize: 10,
        pageSizeOptions: [5, 10, 20, 50],
        enableAllColumnSearch: true,
        enableColumnFilters: true,
        enableColumnVisibility: true,
        enableSorting: true,
        dateFormat: 'MM-DD-YYYY',
        exportOptions: {
            enable: true,
            copy: true,
            excel: true,
            pdf: true
        }
    });
});
