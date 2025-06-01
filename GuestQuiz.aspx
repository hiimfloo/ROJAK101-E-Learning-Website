<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GuestQuiz.aspx.cs" Inherits="GuestQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/Quiz.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="startPanel" runat="server">
    <div class="start-panel-box">
        <h2>Welcome to the Malaysian Culture Quiz!</h2>
        <p>This quiz contains 10 random questions covering Slang, Etiquette, and Social Norms.</p>
        <p>Click the button below when you're ready to begin.</p>
        <asp:Button ID="btnStart" runat="server" Text="Start Quiz" CssClass="submit-btn" OnClick="btnStart_Click" />
    </div>
</asp:Panel>

    <asp:Panel ID="quizPanel" runat="server" Visible="false">
        <div class="quiz-box">
            <asp:Label ID="lblProgress" runat="server" CssClass="score" /><br />
            <asp:Label ID="lblQuestion" runat="server" CssClass="question-text" />

            <div class="options">
              <label><asp:RadioButton ID="optA" runat="server" GroupName="options" /> <asp:Literal ID="textA" runat="server" /></label>
<label><asp:RadioButton ID="optB" runat="server" GroupName="options" /> <asp:Literal ID="textB" runat="server" /></label>
<label><asp:RadioButton ID="optC" runat="server" GroupName="options" /> <asp:Literal ID="textC" runat="server" /></label>
<label><asp:RadioButton ID="optD" runat="server" GroupName="options" /> <asp:Literal ID="textD" runat="server" /></label>

            </div>

            <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="submit-btn" OnClick="btnNext_Click" />
        </div>
    </asp:Panel>
</asp:Content>