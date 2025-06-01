<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewFeedback.aspx.cs" Inherits="Admin_View_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@400;700&display=swap');

    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        color: #2f2f2f;
        font-family: 'Tajawal', sans-serif;
        background-color: #fff;
    }

    .main-content {
        min-height: calc(100vh - 200px);
        padding-bottom: 60px;
    }

    .page-title {
        text-align: center;
        margin-top: 40px;
        font-size: 35px;
        font-weight: bold;
         color: #794E35;
    }

    .feedback-table {
        margin: 0 auto;
        width: 85%;
        font-family: 'Tajawal', sans-serif;
        border-collapse: separate;  
        border-spacing: 0;
        font-size: 14px;
        border-radius: 10px;       
        overflow: hidden;
    }

    .feedback-table th {
        background-color: #54749B;
        color: white;
        padding: 12px;
        text-align: center;
        font-size: 16px;
    }

    .feedback-table td {
        background-color: #DBE6F3;
        padding: 10px;
        text-align: center;
        color: #2f2f2f;
    }

    .feedback-table tr:nth-child(even) td {
        background-color: #F1F5FA;
    }

    .feedback-table tr:hover td {
        background-color: #e0edf8;
    }

    .btn-edit, .btn-delete {
        padding: 6px 14px;
        border: none;
        border-radius: 6px;
        font-size: 14px;
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

    label {
        font-size: 15px;
        color: #794E35;
        font-family: 'Tajawal', sans-serif;
    }

    #ContentPlaceHolder1_ddlStatusFilter,
    #ContentPlaceHolder1_ddlSortBy {
        font-size: 14px;
        padding: 6px 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
    <h2 class="page-title">Student Feedback</h2>

    <div style="text-align: center; margin-bottom: 20px;">
        <label><strong>Filter by Status:</strong></label>
        <asp:DropDownList ID="ddlStatusFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ApplyFilterSort">
            <asp:ListItem Text="ALL" Value="ALL" />
            <asp:ListItem Text="Pending" Value="Pending" />
            <asp:ListItem Text="Reviewed" Value="Reviewed" />
            <asp:ListItem Text="Exported" Value="Exported" />
        </asp:DropDownList>

        &nbsp;&nbsp;

        <label><strong>Sort By:</strong></label>
        <asp:DropDownList ID="ddlSortBy" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ApplyFilterSort">
            <asp:ListItem Text="None" Value="" />
            <asp:ListItem Text="Status" Value="Status" />
            <asp:ListItem Text="Date Created" Value="DateCreated" />
        </asp:DropDownList>
    </div>

    <asp:GridView ID="GridView1" runat="server"
        AutoGenerateColumns="False"
        CssClass="feedback-table"
        DataKeyNames="FeedbackID"
        DataSourceID="SqlDataSource1"
        AllowPaging="True"
        AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="FeedbackID" HeaderText="FeedbackID" ReadOnly="True" SortExpression="FeedbackID" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
            <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" ReadOnly="True" SortExpression="DateCreated" />

            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                <ItemTemplate>
                    <%# Eval("Status") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Reviewed</asp:ListItem>
                        <asp:ListItem>Exported</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Message" HeaderText="Message" ReadOnly="True" SortExpression="Message" />

            <asp:TemplateField HeaderText="IsTestimonial" SortExpression="IsTestimonial">
                <ItemTemplate>
                    <asp:CheckBox ID="chkIsTestimonial" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsTestimonial")) %>' Enabled="false" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="chkIsTestimonialEdit" runat="server" Checked='<%# Bind("IsTestimonial") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn-edit" />
                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn-delete" OnClientClick="return confirm('Are you sure?');" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn-edit" />
                    <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-delete" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT FeedbackID, UserID, DateCreated, [Status], Message, IsTestimonial FROM Feedback"
    UpdateCommand="UPDATE Feedback SET [Status] = @Status, IsTestimonial = @IsTestimonial WHERE FeedbackID = @FeedbackID"
    DeleteCommand="DELETE FROM Feedback WHERE FeedbackID = @FeedbackID">
    
    <UpdateParameters>
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="IsTestimonial" Type="Boolean" />
        <asp:Parameter Name="FeedbackID" Type="Int32" />
    </UpdateParameters>

    <DeleteParameters>
        <asp:Parameter Name="FeedbackID" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>
</asp:Content>
