<%@ Page Title="Modules" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Modules.aspx.cs" Inherits="User_Modules" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/User.css?v=2" />
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modules-page">
        <h1>Explore Learning Modules</h1>

        <div class="module-cards">
            <!-- Module 1 --> 
            <div class="module-card">
                 <img src="../images/module-slang.png" alt="Etiquette Module" />
                <h4>Everyday Phrases / Slang</h4>
                <p>Learn common Malaysian expressions and how to use them in daily conversation.</p> 
                <a class="card-link" href="Slang.aspx">Start Module</a>
            </div> 
              
            <!-- Module 2 --> 
            <div class="module-card">
                <img src="../images/module-etiquette.png" alt="Etiquette Module" />
                <h4>Cultural Etiquette</h4>
                <p>Discover Malaysian body language, greetings, and respectful behavior.</p>
                <a class="card-link" href="Etiquette.aspx">Start Module</a>
            </div>

            <!-- Module 3 -->
            <div class="module-card">
                <img src="../images/module-social.png" alt="Social Practices Module" />
                <h4>Common Social Practices</h4>
                <p>Understand customs, taboos, and community habits across Malaysian cultures.</p>
                <a class="card-link" href="Social.aspx">Start Module</a>
            </div>
            <h2>Test what you’ve learned!</h2>
            <div class="quiz-card">
                <img src="../images/quiz-preview.png" alt="Quiz Preview" />
                <div class="quiz-info">
                    <h3>Rojak 101 Quiz</h3>
                    <p>Think you've got the hang of Malaysian slang, etiquette, and social norms? Put your knowledge to the test!</p>
                    <a href="Quiz.aspx" class="take-quiz-btn">Take Quiz</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
