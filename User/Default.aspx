<%@ Page Title="User Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/User.css" />

    <style>
        .slang-card a {
             text-decoration: none;
             font-size: 22px;
             color: inherit;
        }
    </style>
</asp:Content>



<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">
        <h1>Welcome back, <%= Session["FirstName"] %>!</h1>

        <!-- Progress Section -->
        <div class="progress-section">
            <div class="left-card">
                <h3>Continue where you left off :</h3>
                <p>Everyday Phrases / Slang</p>
                <a href="Modules.aspx" class="continue-btn">Continue</a>
            </div>
            <div class="right-card">
                <img src="../images/trophy.png" alt="Progress Badge" />
                <p>Finish all the lessons to earn your completion badge!</p>
            </div>
        </div>

       <!-- Slang of the Day -->
<div class="slang-section">
    <h2>Slang of the Day</h2>
    <div class="slang-card">
        <h3>
            "LAH"
            <a href="#" onclick="document.getElementById('lahAudio').play(); return false;">🔊</a>
        </h3>
        <p>
            <strong>Meaning:</strong> Expression for emphasis.<br />
            <strong>Example:</strong> "Easy lah, no problem"
        </p>

        <!-- Hidden audio player -->
        <audio id="lahAudio" src="../Audio/lah.m4a" preload="auto"></audio>
    </div>
</div>

        <!-- Module Cards -->
        <div class="modules-section">
    <h2>What do you want to learn today?</h2>

        <div class="module-cards">
            <!-- Module 1: Slang -->
            <div class="module-card">
                <img src="../images/module-slang.png" alt="Slang Module" />
                <h4>Everyday Phrases / Slang</h4>
                <p>Learn common Malaysian expressions and how to use them in daily conversation.</p>
                <a class="card-link" href="Slang.aspx">Start Module</a>
            </div>

            <!-- Module 2: Etiquette -->
            <div class="module-card">
                <img src="../images/module-etiquette.png" alt="Etiquette Module" />
                <h4>Cultural Etiquette</h4>
                <p>Discover Malaysian body language, greetings, and respectful behavior.</p>
                <a class="card-link" href="Etiquette.aspx">Start Module</a>
            </div>

            <!-- Module 3: Social -->
            <div class="module-card">
                <img src="../images/module-social.png" alt="Social Practices Module" />
                <h4>Common Social Practices</h4>
                <p>Understand customs, taboos, and community habits across Malaysian cultures.</p>
                <a class="card-link" href="Social.aspx">Start Module</a>
            </div>
        </div>
    </div>

        <!-- Quiz Preview -->
            <div class="quiz-section">
                <h2>Test what you’ve learned!</h2>
                <div class="quiz-card">
                    <img src="../images/quiz-preview.png" alt="Quiz Preview" />
                    <div class="quiz-info">
                        <h3>Rojak 101 Quiz</h3>
                        <p>Ready for a challenge? Answer real-life situations about Malaysian culture and see how much you remember!</p>
                        <a href="Quiz.aspx" class="take-quiz-btn">Take Quiz</a>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
