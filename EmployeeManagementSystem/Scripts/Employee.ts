interface Employee {
    id: number;
    name: string;
    role: string;
}

// Employee List (Stored in Local Storage)
let employees: Employee[] = JSON.parse(localStorage.getItem("employees") || "[]");

// Function to Render Employees in Table
function renderEmployees(): void {
    const tableBody = document.getElementById("employeeTableBody") as HTMLTableElement;
    tableBody.innerHTML = "";

    employees.forEach((employee) => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${employee.id}</td>
            <td>${employee.name}</td>
            <td>${employee.role}</td>
            <td>
                <button class="btn btn-warning btn-sm" onclick="editEmployee(${employee.id},event)">Edit</button>
                <button class="btn btn-danger btn-sm" onclick="deleteEmployee(${employee.id})">Delete</button>
            </td>
        `;
        tableBody.appendChild(row);
    });

    // Save employees to local storage
    localStorage.setItem("employees", JSON.stringify(employees));
}

// Function to Save Employee (Add or Update)
function saveEmployee(): void {
    const idInput = document.getElementById("empId") as HTMLInputElement;
    const nameInput = document.getElementById("empName") as HTMLInputElement;
    const roleInput = document.getElementById("empRole") as HTMLInputElement;

    const id = parseInt(idInput.value);
    const name = nameInput.value.trim();
    const role = roleInput.value.trim();

    if (!name || !role) {
        alert("Please enter all details.");
        return;
    }

    if (id) {
        // Update existing employee
        const index = employees.findIndex(emp => emp.id === id);
        if (index !== -1) {
            employees[index].name = name;
            employees[index].role = role;
        }
    } else {
        // Add new employee
        const newEmployee: Employee = {
            id: employees.length > 0 ? employees[employees.length - 1].id + 1 : 1,
            name,
            role
        };
        employees.push(newEmployee);
    }

    renderEmployees();
    resetForm(); // Reset form after save
}

// Function to Edit Employee
function editEmployee(id: number, event?: Event): void {
    console.log("Editing Employee ID:", id); // Debugging Step

    if (event) event.preventDefault(); // Prevent page reload

    const employee = employees.find(emp => emp.id === id);
    if (!employee) {
        console.log("Employee not found!");
        return;
    }

    // Populate the form fields
    (document.getElementById("empId") as HTMLInputElement).value = employee.id.toString();
    (document.getElementById("empName") as HTMLInputElement).value = employee.name;
    (document.getElementById("empRole") as HTMLInputElement).value = employee.role;

    // Change button text dynamically
    const saveButton = document.getElementById("saveButton") as HTMLButtonElement;
    if (saveButton) {
        saveButton.textContent = "Update Employee";
        saveButton.classList.remove("btn-primary");
        saveButton.classList.add("btn-success");
    } else {
        console.error("Save button not found!");
    }    
}


// Function to Delete Employee
function deleteEmployee(id: number): void {
    employees = employees.filter(emp => emp.id !== id);
    renderEmployees();
}

// Function to Reset Form
function resetForm(): void {
    (document.getElementById("empId") as HTMLInputElement).value = "";
    (document.getElementById("empName") as HTMLInputElement).value = "";
    (document.getElementById("empRole") as HTMLInputElement).value = "";

    // Reset the button text back to "Save"
    const saveButton = document.querySelector("button[onclick='saveEmployee()']") as HTMLButtonElement;
    saveButton.textContent = "Save";
    saveButton.classList.remove("btn-success");
    saveButton.classList.add("btn-primary");
}

// Load Employees when Page Loads
document.addEventListener("DOMContentLoaded", renderEmployees);
