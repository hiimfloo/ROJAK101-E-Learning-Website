<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/User.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">
        <h1>Edit Profile</h1>

        <div class="form-row">
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-field" placeholder="First Name" />
            <asp:TextBox ID="txtLastName" runat="server" CssClass="input-field" placeholder="Last Name" />
        </div>

        <asp:DropDownList ID="ddlNationality" runat="server" CssClass="input-field"></asp:DropDownList>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="Email" />
        <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="New Password" />
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Confirm New Password" />

        <div class="button-row">
            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="update-btn" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnDeactivate" runat="server" Text="Deactivate Account" CssClass="deactivate-btn" OnClick="btnDeactivate_Click" />
        </div>
    </div>
</asp:Content>

