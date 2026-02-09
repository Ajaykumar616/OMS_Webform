<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OMS_WebForm.Pages.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Dashboard</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Dashboard.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="Dashboard.aspx">OMS Dashboard</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="Dashboard.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Orders.aspx">Orders</a>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="btnLogout" runat="server" CssClass="nav-link"
                                OnClick="Logout_Click">Logout</asp:LinkButton>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <!-- Dashboard Content -->
        <div class="container">
            <!-- Hero Section -->
            <div
                class="dashboard-hero text-center text-md-start d-md-flex justify-content-between align-items-center">
                <div>
                    <h2>Welcome Back!</h2>
                    <p class="mb-0">Here's what's happening with your orders today.</p>
                </div>
                <div class="mt-3 mt-md-0">
                    <a href="Orders.aspx" class="btn btn-light text-primary fw-bold">View Recent Orders</a>
                </div>
            </div>

            <!-- Stats Row -->
            <div class="row g-4 mb-5">
                <div class="col-md-3">
                    <div class="card stat-card border-left-primary">
                        <div class="card-body">
                            <div class="stat-title text-primary">Total Orders</div>
                            <div class="stat-value">124</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card border-left-success">
                        <div class="card-body">
                            <div class="stat-title text-success">Completed</div>
                            <div class="stat-value">86</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card border-left-warning">
                        <div class="card-body">
                            <div class="stat-title text-warning">Pending</div>
                            <div class="stat-value">18</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card border-left-danger">
                        <div class="card-body">
                            <div class="stat-title text-danger">Issues</div>
                            <div class="stat-value">2</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Activity / Getting Started -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="feature-card">
                        <h4 class="mb-3">Quick Actions</h4>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                            <a href="Orders.aspx" class="btn btn-primary">Manage Orders</a>
                            <button type="button" class="btn btn-outline-secondary">Generate Report</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="feature-card">
                        <h4 class="mb-3">System Status</h4>
                        <div class="text-success"><small>● All systems operational</small></div>
                        <div class="text-muted mt-2"><small>Last updated: Just now</small></div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS (optional for navbar toggle) -->
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>

</html>
