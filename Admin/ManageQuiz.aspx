<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageQuiz.aspx.cs" Inherits="Admin_ManageQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
       body {
        background-color: #fdf7f3;
        font-family: 'Tajawal', sans-serif;
        color: #794E35;
    }

    .module-title {
        text-align: center;
        margin-top: 40px;
        margin-bottom:30px;
        font-size: 30px;
        font-weight: bold;
        color: #794E35;
    }

    .form-input {
        margin-bottom: 15px;
        display: block;
        width: 100%;
        padding: 12px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 8px;
        color: #794E35;
    }

    .form-input::placeholder {
        color: #999;
    }

    .btn-submit {
        background-color: #69866B;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-submit:hover {
        background-color: #567158;
    }

    .grid-section {
        width: 80%;
        margin: 20px auto 150px auto;
        padding: 0;
    }

    .grid-section table {
    width: 100%;
    border-collapse: separate;  
    border-spacing: 0;
    font-size: 14px;
    border-radius: 10px;        
    overflow: hidden;
    }

    .grid-section th {
        background-color: #69866B;
        color: white !important;
        padding: 12px;
        text-align: left; 
    }

    .grid-section td {
        background-color: #BCCBB5;
        padding: 10px;
        color: #794E35;
        transition: background-color 0.2s;
    }

    .grid-section tr:nth-child(even) td {
        background-color: #d1e4d5 

    }

    .grid-section tr:hover td {
        background-color: #e0edf8;
    }

     .gridview-button {
        padding: 6px 14px;
        margin: 4px 4px 4px 0; 
        font-size: 13px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        display: inline-block;
        white-space: nowrap;
    }

    .gridview-edit {
        background-color: #69866B;
        color: white;
    }

    .gridview-edit:hover {
         background-color: #5a755c;
    }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <h2 class="module-title">Manage Quiz Questions</h2>

    <asp:Panel ID="pnlGrid" runat="server" CssClass="grid-section">
        <asp:GridView ID="gvQuiz" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionID" DataSourceID="SqlQuizDataSource">
            <Columns>
                <asp:BoundField DataField="QuestionID" HeaderText="QuestionID" ReadOnly="True" SortExpression="QuestionID" />
                <asp:BoundField DataField="QuizID" HeaderText="QuizID" SortExpression="QuizID" />
                <asp:BoundField DataField="QuestionText" HeaderText="QuestionText" SortExpression="QuestionText" />
                <asp:BoundField DataField="OptionA" HeaderText="OptionA" SortExpression="OptionA" />
                <asp:BoundField DataField="OptionB" HeaderText="OptionB" SortExpression="OptionB" />
                <asp:BoundField DataField="OptionC" HeaderText="OptionC" SortExpression="OptionC" />
                <asp:BoundField DataField="OptionD" HeaderText="OptionD" SortExpression="OptionD" />
                <asp:BoundField DataField="CorrectAnswer" HeaderText="CorrectAnswer" SortExpression="CorrectAnswer" />
                <asp:TemplateField HeaderText="Actions">
    <ItemTemplate>
        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="gridview-button gridview-edit" />
    </ItemTemplate>
    <EditItemTemplate>
        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="gridview-button gridview-edit" />
        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="gridview-button gridview-edit" />
    </EditItemTemplate>
</asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>

     <asp:SqlDataSource ID="SqlQuizDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [Questions]"
        UpdateCommand="UPDATE [Questions] SET [QuizID] = @QuizID, [QuestionText] = @QuestionText, [OptionA] = @OptionA, [OptionB] = @OptionB, [OptionC] = @OptionC, [OptionD] = @OptionD, [CorrectAnswer] = @CorrectAnswer WHERE [QuestionID] = @QuestionID"
        DeleteCommand="DELETE FROM [Questions] WHERE [QuestionID] = @QuestionID" InsertCommand="INSERT INTO [Questions] ([QuestionID], [QuizID], [QuestionText], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectAnswer]) VALUES (@QuestionID, @QuizID, @QuestionText, @OptionA, @OptionB, @OptionC, @OptionD, @CorrectAnswer)">
         <InsertParameters>
             <asp:Parameter Name="QuestionID" Type="Int32" />
             <asp:Parameter Name="QuizID" Type="Int32" />
             <asp:Parameter Name="QuestionText" Type="String" />
             <asp:Parameter Name="OptionA" Type="String" />
             <asp:Parameter Name="OptionB" Type="String" />
             <asp:Parameter Name="OptionC" Type="String" />
             <asp:Parameter Name="OptionD" Type="String" />
             <asp:Parameter Name="CorrectAnswer" Type="String" />
         </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="QuizID" Type="Int32" />
            <asp:Parameter Name="QuestionText" Type="String" />
            <asp:Parameter Name="OptionA" Type="String" />
            <asp:Parameter Name="OptionB" Type="String" />
            <asp:Parameter Name="OptionC" Type="String" />
            <asp:Parameter Name="OptionD" Type="String" />
            <asp:Parameter Name="CorrectAnswer" Type="String" />
            <asp:Parameter Name="QuestionID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="QuestionID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>

