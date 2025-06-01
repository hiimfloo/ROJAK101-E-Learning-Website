<%@ Page Title="" Language="C#" MasterPageFile="../MasterPage.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Admin_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- Google Fonts -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Fredoka:wght@400;600&family=Tajawal:wght@300;500;700&display=swap');

        html, body {
            background-color: #fffaf2;
            font-family: 'Tajawal', sans-serif;
            margin: 0;
            padding: 0;
            color: #794E35;
        }

        h2 {
            text-align: center;
            font-size: 35px;
            margin-top: 30px;
            font-weight: bold;
            color: #794E35;
        }

        .user-controls {
            margin: 20px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            font-family: 'Fredoka', sans-serif;
        }

        .user-controls input[type="text"],
        .user-controls select {
            padding: 8px 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .user-controls label {
            font-weight: 600;
            font-size: 15px;
        }

        .aspNet-GridView {
            margin: 0 auto;
            margin-bottom: 80px;
            width: 85%;
            border-collapse: collapse;
            font-family: 'Tajawal', sans-serif;
             border-collapse: separate;  
             border-spacing: 0;
            font-size: 14px;
            border-radius: 10px;        
            overflow: hidden;
        }

        .aspNet-GridView a {
             color: white !important;
             text-decoration: none;
        }

        .aspNet-GridView th {
            background-color: #D2A358;
            color: white;
            padding: 10px;
            font-size: 16px;
            text-align: left;
        }

        .aspNet-GridView td {
            background-color: #F3E3C3;
            padding: 10px;
            color: #794E35;
        }

        .aspNet-GridView tr:nth-child(even) td {
            background-color: #f8f1e3;
        }

        .aspNet-GridView tr:hover td {
            background-color: #efe1c7;
        }

        .aspNet-GridView .btn {
            padding: 6px 12px;
            font-size: 13px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-edit {
            background-color: #69866B;
            color: white;
        }

        .btn-edit:hover {
            background-color: #5a755c;
        }

        .btn-delete {
            background-color: #B84343;
            color: white;
        }

        .btn-delete:hover {
            background-color: #9f2e2e;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Users]"
        InsertCommand="INSERT INTO [Users] ([FirstName], [LastName], [Nationality], [Email], [Password], [UserType]) VALUES (@FirstName, @LastName, @Nationality, @Email, @Password, @UserType)"
        UpdateCommand="UPDATE [Users] SET [FirstName] = @FirstName, [LastName] = @LastName, [Nationality] = @Nationality, [Email] = @Email, [UserType] = @UserType WHERE [UserID] = @UserID">
        <DeleteParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Nationality" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="UserType" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserID" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Nationality" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="UserType" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <h2>User Management</h2>

    <div class="user-controls">
        <label for="ddlSortBy">Sort By:</label>
        <asp:DropDownList ID="ddlSortBy" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged">
            <asp:ListItem Text="ALL" Value=""></asp:ListItem>
            <asp:ListItem Text="First Name" Value="FirstName"></asp:ListItem>
            <asp:ListItem Text="Nationality" Value="Nationality"></asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search..." />
        <asp:Button ID="btnSearch" runat="server" Text="🔍" OnClick="btnSearch_Click" />
    </div>

    <asp:GridView ID="GridView1" runat="server" CssClass="aspNet-GridView"
    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
    DataKeyNames="UserID" 
    OnRowDeleting="GridView1_RowDeleting"
    OnRowEditing="GridView1_RowEditing"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="Nationality" HeaderText="Nationality" SortExpression="Nationality" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />

            <asp:TemplateField HeaderText="User Type" SortExpression="UserType">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("UserType") %>'>
                        <asp:ListItem>admin</asp:ListItem>
                        <asp:ListItem>user</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-edit" />
                    <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-delete" OnClientClick="return confirm('Are you sure?');" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-edit" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-delete" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView> 
</asp:Content>
