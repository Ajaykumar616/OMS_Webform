<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="Orders.aspx.cs"
    Inherits="OMS_WebForm.Pages.Orders" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Orders - OMS</title>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
        <link href="../Content/Orders.css" rel="stylesheet" />
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

            <!-- Orders Content -->
            <div class="container">
                <div class="d-flex justify-content-between align-items-center page-header">
                    <h2>Order Management</h2>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger d-block mb-3" Visible="false">
                </asp:Label>

                <div class="card">
                    <div class="card-header">
                        Recent Orders
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvorders" runat="server" AutoGenerateColumns="false"
                                CssClass="table table-hover table-bordered" GridLines="None"
                                EmptyDataText="No orders found.">
                                <Columns>
                                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
                                    <asp:BoundField DataField="UserId" HeaderText="Customer ID" />
                                    <asp:BoundField DataField="OrderStatus" HeaderText="Status" />
                                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount"
                                        DataFormatString="{0:C}" />
                                    <asp:BoundField DataField="CreatedAt" HeaderText="Created Date"
                                        DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="UpdatedAt" HeaderText="Last Updated"
                                        DataFormatString="{0:d}" />
                                   <%-- <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <button type="button" class="btn btn-sm btn-outline-primary">View</button>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Actions">
    <ItemTemplate>
        <asp:HyperLink ID="lnkView" runat="server" 
            CssClass="btn btn-sm btn-outline-primary"
            NavigateUrl='<%# "ViewOrderDetails.aspx?orderId=" + Eval("OrderId") %>' 
            Text="View" />
    </ItemTemplate>
</asp:TemplateField>

                                </Columns>
                                <HeaderStyle CssClass="table-light" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- Bootstrap JS -->
        <script src="../Scripts/bootstrap.bundle.min.js"></script>
    </body>

    </html>