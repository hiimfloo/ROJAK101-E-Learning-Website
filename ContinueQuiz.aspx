<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContinueQuiz.aspx.cs" Inherits="ContinueQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Quiz.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="quiz-box">
        <asp:Label ID="lblProgress" runat="server" CssClass="score" /><br />
        <asp:Label ID="lblQuestion" runat="server" CssClass="question-text" />

        <div class="options">
            <label><asp:RadioButton ID="optA" runat="server" GroupName="options" /> <asp:Literal ID="textA" runat="server" /></label><br />
            <label><asp:RadioButton ID="optB" runat="server" GroupName="options" /> <asp:Literal ID="textB" runat="server" /></label><br />
            <label><asp:RadioButton ID="optC" runat="server" GroupName="options" /> <asp:Literal ID="textC" runat="server" /></label><br />
            <label><asp:RadioButton ID="optD" runat="server" GroupName="options" /> <asp:Literal ID="textD" runat="server" /></label>
        </div>

        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="submit-btn" OnClick="btnNext_Click" />
    </div>
</asp:Content>
