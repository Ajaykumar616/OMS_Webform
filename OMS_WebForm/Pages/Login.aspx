<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="Login.aspx.cs" Inherits="OMS_WebForm.Pages.Login"
    %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Login - OMS</title>
        <link href="../Content/bootstrap.min.css" rel="stylesheet" />
        <link href="../Content/Login.css" rel="stylesheet" />
    </head>

    <body>
        <form id="form1" runat="server">
            <div class="login-container">
                <!-- Left Side: Image & Branding -->
                <div class="login-image-side">
                    <div class="login-image-overlay"></div>
                    <div class="hero-text">
                        <h1>Order Management</h1>
                        <p>Streamline your logistics and supply chain efficiently.</p>
                    </div>
                </div>

                <!-- Right Side: Login Form -->
                <div class="login-form-side">
                    <div class="login-card">
                        <div class="card-header">
                            <h3>Welcome Back</h3>
                            <p>Please enter your details to sign in.</p>
                        </div>

                        <div class="card-body p-0">
                            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger d-block mb-4"
                                Visible="false" Font-Size="Small"></asp:Label>

                            <div class="mb-4">
                                <label class="form-label text-secondary small fw-bold">EMAIL ADDRESS</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                                    Placeholder="name@company.com"></asp:TextBox>
                            </div>

                            <div class="mb-4">
                                <label class="form-label text-secondary small fw-bold">PASSWORD</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"
                                    Placeholder="••••••••"></asp:TextBox>
                            </div>

                            <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click"
                                CssClass="btn btn-primary btn-block w-100" />
                           

                            <div class="login-footer">
                                &copy; 2026 OMS System
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <script src="../Scripts/bootstrap.bundle.min.js"></script>
    </body>

    </html>