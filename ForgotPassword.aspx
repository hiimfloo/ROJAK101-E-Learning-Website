<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

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
<div class="login-outer">
            <div class="login-wrapper">
                <!-- LEFT SIDE: Rojak Message + Image -->
            <div class="login-left">
                <div class="overlay-text">
                    <h1>Forgot Password</h1>
                    <p>Lupa password? Takpe, boleh settle!
                        Just fill in your details and we’ll send a link to reset your password.
                        Kalau masih ada masalah, contact je our support team</p>
                </div>
            </div>


                <!-- RIGHT SIDE: Login Form -->
                <div class="login-right">
                    <h2>Reset Password</h2>

                 


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Email Required!" ForeColor="Red"></asp:RequiredFieldValidator>

                 


                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="input-field" />
                    &nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="*Password Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" CssClass="input-field" />
                   
                    <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password" CssClass="input-field" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="*Confirm Password Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="*Passwords do not match!" ForeColor="Red"></asp:CompareValidator>

                    <div class="terms-checkbox">
                        <asp:CheckBox ID="chkTerms" runat="server" />
                        <label for="chkTerms">Remember Me</label>
                    </div>

                 <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="login-button" OnClick="btnReset_Click" />
                      <p class="login-link">Back to <a href="Login.aspx">Login Page</a></p>

                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE [Email] = @Email AND [Password] = @Password" UpdateCommand="UPDATE Users SET Password = @Password WHERE (Email = @Email)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtPassword" Name="Password" PropertyName="Text" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Password" />
                            <asp:Parameter Name="Email" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                  
                </div>
            </div>
</div>

        <div>
        </div>
    </form>
</body>
</html>
