<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Login.css" rel="stylesheet" />
    <!-- Import Baloo Font -->
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Baloo+2:wght@400..800&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap');
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div style="position: absolute; top: 20px; left: 20px; z-index: 1000;">
        <a href="Default.aspx">
            <img src="images/homebtn.png" alt="Home" style="height: 40px; width: 40px;" />
        </a>
    </div>
<div class="login-outer">
            <div class="login-wrapper">
                <!-- LEFT SIDE: Rojak Message + Image -->
            <div class="login-left">
                <div class="overlay-text">
                    <h1>Welcome Back!</h1>
                    <p>We’re glad to see you again!<br /> Dive back in and continue exploring Malaysian culture.</p>
                </div>
            </div>


                <!-- RIGHT SIDE: Login Form -->
                <div class="login-right">
                    <h2>Sign In</h2>

                 


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Email Required!" ForeColor="Red"></asp:RequiredFieldValidator>

                 


                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="input-field" />
                    &nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="*Password Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" CssClass="input-field" />
                   
                    <div class="terms-checkbox">
                        <asp:CheckBox ID="chkTerms" runat="server" />
                        <label for="chkTerms">Remember Me</label>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-button" OnClick="btnLogin_Click" />

                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE [Email] = @Email AND [Password] = @Password">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtPassword" Name="Password" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <p class="login-link">New Here? <a href="Register.aspx">Create an Account</a></p>
                      <p class="login-link">Forgot Password? <a href="ForgotPassword.aspx">Click here to reset</a></p>
                </div>
            </div>
</div>

        <div>
        </div>
    </form>
</body>
</html>
