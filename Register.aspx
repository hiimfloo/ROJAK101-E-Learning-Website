<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Register.css" rel="stylesheet" />

    <!-- Import Baloo Font -->
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Baloo+2:wght@400..800&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap');
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div class="register-outer">
            <div class="register-wrapper">
                <!-- LEFT SIDE: Rojak Message + Image -->
            <div class="register-left">
                <div class="overlay-text">
                    <h1>Start your Rojak journey today</h1>
                    <p>Learn the rich history and diverse culture of Malaysia through interactive lessons and fun quizzes.</p>
                </div>
            </div>


                <!-- RIGHT SIDE: Registration Form -->
                <div class="register-right">
                    <h2>Create an account</h2>

              <div class="name-row">
                <div class="input-group">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtFirstName"
                        ErrorMessage="*First name Required!"
                        Font-Size="Small"
                        ForeColor="Red"
                        CssClass="validation-msg" />
                    <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" CssClass="input-field half" />
                </div>

                <div class="input-group">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtLastName"
                        ErrorMessage="*Last Name Required!" 
                        Font-Size="Small"
                         ForeColor="Red"
                        CssClass="validation-msg"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" CssClass="input-field half" />
                </div>
            </div>
                        <%-- 
                    <asp:TextBox ID="txtNationality" runat="server" placeholder="Nationality" CssClass="input-field" />
    --%>
                       
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlNationality" ErrorMessage="*Nationality Required!" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                       
                       <asp:DropDownList ID="ddlNationality" runat="server" CssClass="input-field" AppendDataBoundItems="true">
                            <asp:ListItem Text="Select Nationality" Value="" />
                        </asp:DropDownList>

                 


                    &nbsp;&nbsp;&nbsp;

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Email Required!" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="*Invalid email format!" Font-Size="Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*Email already exists!" Font-Size="Small" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>

                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="input-field" />
                    &nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Password Required!" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="*Password doesn't match!" Font-Size="Small" ForeColor="Red"></asp:CompareValidator>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" CssClass="input-field" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="*Password Required!" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="*Password doesn't match!" Font-Size="Small" ForeColor="Red"></asp:CompareValidator>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm Password" TextMode="Password" CssClass="input-field" />

                    <div class="terms-checkbox">
                        <asp:CheckBox ID="chkTerms" runat="server" />
                        <label for="chkTerms">I agree to the Terms & Conditions
                        </label>
                        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [FirstName] = @FirstName" InsertCommand="INSERT INTO [Users] ([FirstName], [LastName], [Nationality], [Email], [Password], [UserType]) VALUES (@FirstName, @LastName, @Nationality, @Email, @Password, @UserType)" SelectCommand="SELECT * FROM [Users] WHERE [Email] = @Email" UpdateCommand="UPDATE [Users] SET [LastName] = @LastName, [Nationality] = @Nationality, [Email] = @Email, [Password] = @Password, [UserType] = @UserType WHERE [FirstName] = @FirstName">
                            <DeleteParameters>
                                <asp:Parameter Name="FirstName" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtFirstName" Name="FirstName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtLastName" Name="LastName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="ddlNationality" Name="Nationality" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtPassword" Name="Password" PropertyName="Text" Type="String" />
                                <asp:Parameter DefaultValue="user" Name="UserType" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="LastName" Type="String" />
                                <asp:Parameter Name="Nationality" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="UserType" Type="String" />
                                <asp:Parameter Name="FirstName" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>

                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="register-button" OnClick="btnRegister_Click" />

                    <p class="login-link">Already have an account? <a href="Login.aspx">Login</a></p>
                </div>
            </div>
</div>

        <div>
        </div>
    </form>
</body>
</html>
