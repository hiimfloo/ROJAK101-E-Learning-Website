<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewResult.aspx.cs" Inherits="Admin_ViewResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Fredoka:wght@400;600&family=Tajawal:wght@300;500;700&display=swap');

        html, body {
            background-color: #fffaf2;
            font-family: 'Tajawal', sans-serif;
            margin: 0;
            padding: 0;
            color: #794E35;
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .main-wrapper {
            flex: 1;
        }

        h2 {
            text-align: center;
            font-size: 35px;
            margin-top: 30px;
            font-weight: bold;
            color: #794E35;
        }

        .filter-controls {
            margin: 20px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            font-family: 'Tajawal', sans-serif;
        }

        .filter-controls label {
            font-weight: 600;
            font-size: 16px;
        }

        .filter-controls select {
            padding: 6px 10px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .aspNet-GridView {
            margin: 0 auto 80px;
            width: 75%;
            border-collapse: collapse;
            font-family: 'Tajawal', sans-serif;
            border-collapse: separate;  
            border-spacing: 0;
            font-size: 14px;
            border-radius: 10px;      
            overflow: hidden;
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quiz Results</h2>

    <div class="filter-controls">
        <label>Sort By:</label>
        <asp:DropDownList ID="ddlSortBy" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged">
            <asp:ListItem Text="None" Value="" />
            <asp:ListItem Text="Score" Value="Score" />
            <asp:ListItem Text="Date Attempted" Value="DateAttempted" />
        </asp:DropDownList>
    </div>

    <asp:GridView ID="gvResults" runat="server"
        CssClass="aspNet-GridView"
        AutoGenerateColumns="False"
        AllowSorting="True"
        DataKeyNames="ResultID">
        <Columns>
            <asp:BoundField DataField="ResultID" HeaderText="Result ID" />
            <asp:BoundField DataField="UserID" HeaderText="User ID" />
            <asp:BoundField DataField="QuizID" HeaderText="Quiz ID" />
            <asp:BoundField DataField="Score" HeaderText="Score" />
            <asp:BoundField DataField="DateAttempted" HeaderText="Date Attempted" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
        </Columns>
    </asp:GridView>
</asp:Content>
