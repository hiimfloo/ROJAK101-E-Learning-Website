<%@ Page Title="Content Management" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageContent.aspx.cs" Inherits="Admin_ManageContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Fredoka:wght@300..700&display=swap');
        body {
            background-color: #fdf7f3;
            font-family: 'Tajawal', sans-serif;
        }

        .module-title {
            text-align: center;
            margin-top: 40px;
            font-size: 30px;
            font-weight: bold;
            color:#794E35
        }

        .lesson-btns {
            text-align: center;
            margin: 20px 0 30px;
        }

        .lesson-btns input {
            padding: 12px 28px;
            margin: 0 10px;
            border-radius: 10px;
            background-color: #b2734f;
            color: white;
            border: none;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s ease;
            font-family: 'Fredoka', sans-serif;
        }

        .lesson-btns input:hover {
            background-color: #a65a38;
        }

        .lesson-btns .active-lesson {
            background-color: #995a3a;
        }

        .form-section, .grid-section {
            width: 80%;
            margin: 20px auto;
            background: #fffce5;
            padding: 25px 30px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

        .form-section h3 {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
             color:#794E35
        }

        .form-input {
            margin-bottom: 5px;
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .form-input::placeholder {
            color: #999;
        }

        .text-danger {
            color: red;
            margin-bottom: 10px;
            display: block;
        }

        .btn-submit {
            background-color: #b2734f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-family: 'Fredoka', sans-serif;
            font-size:15px;
        }

        .btn-submit:hover {
            background-color: #995a3a;
        }

        .grid-section table {
           width: 100%;
            border-collapse: separate;   
            border-spacing: 0;
            margin-top: 20px;
            font-size: 14px;
            border-radius: 10px;  
            overflow: hidden;
        }

        .grid-section th {
            background-color: #a35f3e;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: 600;
        }

        .grid-section td {
             background-color: #f6ebc1;
             padding: 10px;
             border-bottom: 1px solid #e0d4c8;
             transition: background-color 0.2s;
         }

        .grid-section tr:hover td {
            background-color: #fcf4d6;
        }

        .gridview-button {
             padding: 6px 14px;
              margin: 2px;
              font-size: 13px;
              border: none;
             border-radius: 6px;
             cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .gridview-edit {
            background-color: #69866B;
            color: white;
        }

        .gridview-edit:hover {
            background-color: #5a755c;
        }

        .gridview-delete {
            background-color: #B84343;
            color: white;
        }

        .gridview-delete:hover {
             background-color: #9f2e2e;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="module-title">Content Management</h2>

    <div class="lesson-btns">
        <asp:Button ID="btnLesson1" runat="server" Text="Lesson 1" OnClick="LessonButton_Click" CommandArgument="1" />
        <asp:Button ID="btnLesson2" runat="server" Text="Lesson 2" OnClick="LessonButton_Click" CommandArgument="2" />
        <asp:Button ID="btnLesson3" runat="server" Text="Lesson 3" OnClick="LessonButton_Click" CommandArgument="3" />
    </div>

    <asp:Panel ID="pnlContentForm" runat="server" CssClass="form-section" Visible="false" EnableViewState="true">
        <h3>Add Content</h3>

        <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="false" />

        <asp:Label ID="lblTitleError" runat="server" CssClass="text-danger" AssociatedControlID="txtTitle"></asp:Label>
        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-input" Placeholder="Title"></asp:TextBox>
      

        <asp:Label ID="lblPracticeError" runat="server" CssClass="text-danger" AssociatedControlID="txtPractice"></asp:Label>
        <asp:TextBox ID="txtPractice" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="3" Placeholder="Practice Text"></asp:TextBox>


        <asp:Label ID="lblImportanceError" runat="server" CssClass="text-danger" AssociatedControlID="txtImportance"></asp:Label>
        <asp:TextBox ID="txtImportance" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="3" Placeholder="Importance Text"></asp:TextBox>
  
        <asp:FileUpload ID="fuAudio" runat="server" CssClass="form-input" />

        <asp:Button ID="btnSubmit" runat="server" Text="Add" CssClass="btn-submit" OnClick="btnSubmit_Click" />


    </asp:Panel>

    <asp:Panel ID="pnlGrid" runat="server" CssClass="grid-section" Visible="false">
        <asp:GridView ID="gvContent" runat="server" AutoGenerateColumns="False" DataKeyNames="ContentID" DataSourceID="SqlContentDataSource" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="ContentID" HeaderText="ContentID" ReadOnly="True" SortExpression="ContentID" InsertVisible="False" />
                <asp:BoundField DataField="LessonID" HeaderText="LessonID" SortExpression="LessonID" />
                <asp:BoundField DataField="ContentTitle" HeaderText="ContentTitle" SortExpression="ContentTitle" />
                <asp:BoundField DataField="PracticeText" HeaderText="PracticeText" SortExpression="PracticeText" />
                <asp:BoundField DataField="ImportanceText" HeaderText="ImportanceText" SortExpression="ImportanceText" />
                <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" SortExpression="OrderNo" />
                <asp:BoundField DataField="AudioPath" HeaderText="Path" SortExpression="AudioPath" />
                <asp:TemplateField HeaderText="Actions">
    <ItemTemplate>
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="gridview-button gridview-edit" />
        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="gridview-button gridview-delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
    </ItemTemplate>
    <EditItemTemplate>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="gridview-button gridview-edit" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="gridview-button gridview-delete" />
    </EditItemTemplate>
</asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </asp:Panel>
<asp:SqlDataSource ID="SqlContentDataSource" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT * FROM [Content] WHERE LessonID = @LessonID"
    DeleteCommand="DELETE FROM [Content] WHERE [ContentID] = @ContentID"
    InsertCommand="INSERT INTO [Content] ([LessonID], [ContentTitle], [PracticeText], [ImportanceText], [OrderNo], [AudioPath]) VALUES (@LessonID, @ContentTitle, @PracticeText, @ImportanceText, @OrderNo, @AudioPath)"
    UpdateCommand="UPDATE [Content] SET [LessonID] = @LessonID, [ContentTitle] = @ContentTitle, [PracticeText] = @PracticeText, [ImportanceText] = @ImportanceText, [OrderNo] = @OrderNo, [AudioPath] = @AudioPath WHERE [ContentID] = @ContentID">

    <SelectParameters>
        <asp:Parameter Name="LessonID" Type="Int32" />
    </SelectParameters>

    <DeleteParameters>
        <asp:Parameter Name="ContentID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="LessonID" Type="Int32" />
        <asp:Parameter Name="ContentTitle" Type="String" />
        <asp:Parameter Name="PracticeText" Type="String" />
        <asp:Parameter Name="ImportanceText" Type="String" />
        <asp:Parameter Name="OrderNo" Type="Int32" />
        <asp:Parameter Name="AudioPath" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="LessonID" Type="Int32" />
        <asp:Parameter Name="ContentTitle" Type="String" />
        <asp:Parameter Name="PracticeText" Type="String" />
        <asp:Parameter Name="ImportanceText" Type="String" />
        <asp:Parameter Name="OrderNo" Type="Int32" />
        <asp:Parameter Name="AudioPath" Type="String" />
        <asp:Parameter Name="ContentID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
