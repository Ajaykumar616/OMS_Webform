<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="ViewOrderDetails.aspx.cs"
    Inherits="OMS_WebForm.Pages.ViewOrderDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Order Details - OMS</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/OrderDetails.css" rel="stylesheet" />
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>

<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="Dashboard.aspx">OMS Dashboard</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Dashboard.aspx">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="Orders.aspx">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Login.aspx">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container order-details-container">
            <div class="mb-3">
                <a href="Orders.aspx" class="btn-back">
                    <i class="fas fa-arrow-left"></i> Back to Orders
                </a>
            </div>

            <div class="card invoice-card">
                <div class="card-header invoice-header">
                    <h2 class="invoice-title">
                        Order Details
                        <span class="d-block small text-muted font-weight-normal fs-6 mt-1">
                            #<asp:Label ID="lblOrderId" runat="server"></asp:Label>
                        </span>
                    </h2>
                    <div class="d-none d-md-block">
                        <button type="button" class="btn btn-outline-primary btn-sm" onclick="window.print()">
                            <i class="fas fa-print me-1"></i> Print
                        </button>
                    </div>
                </div>

                <div class="card-body invoice-body">
                    <asp:Label ID="lblError" runat="server" CssClass="alert alert-danger d-block mb-3"
                        Visible="false"></asp:Label>

                    <!-- Order Items -->
                    <div class="table-responsive mb-4">
                        <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="false"
                            CssClass="table table-hover" GridLines="None"
                            EmptyDataText="No items found for this order.">
                            <Columns>
                                <asp:BoundField DataField="ProductName" HeaderText="Product" HeaderStyle-Width="40%" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity"
                                    ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price"
                                    DataFormatString="{0:C}" ItemStyle-CssClass="text-end"
                                    HeaderStyle-CssClass="text-end" />
                                <asp:BoundField DataField="TotalPrice" HeaderText="Total" DataFormatString="{0:C}"
                                    ItemStyle-CssClass="text-end" HeaderStyle-CssClass="text-end fw-bold" />
                            </Columns>
                            <HeaderStyle CssClass="table-light" />
                        </asp:GridView>
                    </div>

                    <!-- Total Amount -->
                    <div class="total-section mb-4">
                        <span class="total-label">Total Amount:</span>
                        <span class="total-amount">
                            <asp:Label ID="lblGrandTotal" runat="server" Text="$0.00"></asp:Label>
                        </span>
                    </div>

                    <!-- Status History -->
                    <h4 class="section-title">Status History</h4>
                    <asp:GridView ID="gvStatusHistory" runat="server" AutoGenerateColumns="false"
                        CssClass="table table-sm table-bordered mb-4" GridLines="None"
                        EmptyDataText="No status history found.">
                        <Columns>
                            <asp:BoundField DataField="NewStatus" HeaderText="Status" />
                            <asp:BoundField DataField="ChangedBy" HeaderText="Changed By" />
                            <asp:BoundField DataField="ChangedAt" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
                            <asp:BoundField DataField="Reason" HeaderText="Reason" />
                        </Columns>
                    </asp:GridView>

                    <!-- Payment Details -->
                    <h4 class="section-title">Payment Details</h4>
                    <asp:GridView ID="gvPayments" runat="server" AutoGenerateColumns="false"
                        CssClass="table table-sm table-bordered mb-4" GridLines="None"
                        EmptyDataText="No payment records found.">
                        <Columns>
                            <asp:BoundField DataField="PaymentMode" HeaderText="Method" />
                            <asp:BoundField DataField="TransactionRef" HeaderText="Transaction ID" />
                            <asp:BoundField DataField="PaymentStatus" HeaderText="Status" />
                            <asp:BoundField DataField="PaidAt" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                        </Columns>
                    </asp:GridView>

                    <!-- Shipping Details -->
                    <h4 class="section-title">Shipping Details</h4>
                    <asp:GridView ID="gvShipping" runat="server" AutoGenerateColumns="false"
                        CssClass="table table-sm table-bordered" GridLines="None"
                        EmptyDataText="No shipping records found.">
                        <Columns>
                            <asp:BoundField DataField="Carrier" HeaderText="Carrier" />
                            <asp:BoundField DataField="TrackingNumber" HeaderText="Tracking #" />
                            <asp:BoundField DataField="ShippingStatus" HeaderText="Status" />
                            <asp:BoundField DataField="ShippedDate" HeaderText="Shipped On" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="DeliveredDate" HeaderText="Delivered On" DataFormatString="{0:dd-MMM-yyyy}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
