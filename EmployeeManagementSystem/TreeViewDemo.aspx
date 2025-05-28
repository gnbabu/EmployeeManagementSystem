<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeViewDemo.aspx.cs" Inherits="EmployeeManagementSystem.TreeViewDemo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bootstrap 5 Tree View with Nested Children</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .tree-item {
            cursor: pointer;
            padding: 4px 8px;
            display: inline-block;
        }

            .tree-item:hover {
                background-color: #f0f0f0;
            }

            .tree-item.active {
                background-color: #0d6efd;
                color: white;
            }

        .tree ul {
            list-style: none;
            padding-left: 1rem;
        }

        .tree-toggle::before {
            content: "\25B6"; /* right triangle */
            display: inline-block;
            margin-right: 6px;
            transition: transform 0.2s;
        }

        .tree-toggle.expanded::before {
            transform: rotate(90deg);
        }

        .nested {
            display: none;
        }

            .nested.show {
                display: block;
            }
    </style>
</head>
<body>
    <div class="container-fluid mt-4">
        <div class="row">
            <!-- Left: Tree View -->
            <div class="col-md-3 border-end">
                <h5>Tree View</h5>
                <div class="tree">
                    <ul>
                        <li>
                            <span class="tree-toggle tree-item" data-content="Management section">Management</span>
                            <ul class="nested">
                                <li>
                                    <span class="tree-toggle tree-item" data-content="Users section">Users</span>
                                    <ul class="nested">
                                        <li><span class="tree-item" data-content="Admin user section">Admin</span></li>
                                        <li><span class="tree-item" data-content="Guest user section">Guest</span></li>
                                    </ul>
                                </li>
                                <li><span class="tree-item" data-content="Roles section">Roles</span></li>
                            </ul>
                        </li>
                        <li>
                            <span class="tree-toggle tree-item" data-content="Settings section">Settings</span>
                            <ul class="nested">
                                <li><span class="tree-item" data-content="Profile settings">Profile</span></li>
                                <li><span class="tree-item" data-content="Security settings">Security</span></li>
                            </ul>
                        </li>
                        <li><span class="tree-item" data-content="Reports section">Reports</span></li>
                        <li><span class="tree-item" data-content="Help section">Help</span></li>
                    </ul>
                </div>
            </div>

            <!-- Right: Content Display -->
            <div class="col-md-9">
                <h5>Content</h5>
                <div id="content-area" class="p-3 border bg-light">
                    Click any tree node to view its content here.
                </div>
            </div>
        </div>
    </div>

    <script>
        const treeItems = document.querySelectorAll(".tree-item");
        const contentArea = document.getElementById("content-area");

        treeItems.forEach(item => {
            item.addEventListener("click", function (e) {
                e.stopPropagation(); // Prevent bubbling

                // Set active state
                treeItems.forEach(i => i.classList.remove("active"));
                this.classList.add("active");

                // Display content
                const content = this.getAttribute("data-content");
                contentArea.textContent = content;

                // Toggle children if it's a parent node
                if (this.classList.contains("tree-toggle")) {
                    const nested = this.nextElementSibling;
                    if (nested && nested.classList.contains("nested")) {
                        nested.classList.toggle("show");
                        this.classList.toggle("expanded");
                    }
                }
            });
        });
    </script>
</body>
</html>
