<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/AdminHomePage.css" rel="stylesheet" />
    <!-- Import Fredoka -->
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Baloo+2:wght@400..800&family=Fredoka:wght@300..700&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap');
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="admin-panel">
            <h2 style="color: #D2A358;">Hi, Admin&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
            </h2>
            <p>What are we doing today?</p>
            <div class="admin-buttons">
                <asp:Button ID="btnManageLesson" runat="server" Text="+ Manage Lesson" CssClass="btn" OnClick="btnManageLesson_Click" />
                <asp:Button ID="btnManageUsers" runat="server" Text="👤 Manage Users" CssClass="btn" OnClick="btnManageUsers_Click" />
                <asp:Button ID="btnManageQuiz" runat="server" Text="+ Manage Quiz" CssClass="btn" OnClick="btnManageQuiz_Click" />
                <asp:Button ID="btnViewFeedbacks" runat="server" Text="💬 View Feedbacks" CssClass="btn" OnClick="btnViewFeedbacks_Click" />
            </div>
        </div>

        <div class="activity-log">
            <h3>Recent Activities Log</h3>
            <div class="activity-item">
                <strong>Melissa completed "Driving Etiquette" Module</strong>
                <div class="activity-date">7 May, 2025</div>
            </div>
            <div class="activity-item">
                <strong>Lee Jing Yi scored 90% in Siung Quiz 1</strong>
                <div class="activity-date">7 May, 2025</div>
            </div>
            <div class="activity-item">
                <strong>New feedback: "Audio not working in Tapau module"</strong>
                <div class="activity-date">7 May, 2025</div>
            </div>
        </div>
    </div>

      <!-- Quick Overview Section -->
<div style="background-color: #fcd271; padding: 40px 20px;">
    <h2 style="color: #8b4c11; margin-bottom: 30px;">Quick Overview</h2>
    <div class="overview-grid">
        <div class="overview-card">
            <div class="overview-icon">👥</div>
            <div class="overview-label">Total Users</div>
            <div class="overview-value"><asp:Label ID="lblTotalUsers" runat="server" /></div>
        </div>
        <div class="overview-card">
            <div class="overview-icon">📖</div>
            <div class="overview-label">Lessons Published</div>
            <div class="overview-value"><asp:Label ID="lblLessonsPublished" runat="server" /></div>
        </div>
        <div class="overview-card">
            <div class="overview-icon">📝</div>
            <div class="overview-label">Quizzes Created</div>
            <div class="overview-value"><asp:Label ID="lblQuizzesCreated" runat="server" /></div>
            <div class="overview-value">1</div>
        </div>
        <div class="overview-card">
            <div class="overview-icon">📩</div>
            <div class="overview-label">Feedbacks Received</div>
            <div class="overview-value"><asp:Label ID="lblFeedbacksReceived" runat="server" /></div>
        </div>
        <div class="overview-card">
            <div class="overview-icon">📊</div>
            <div class="overview-label">Avg Quiz Score</div>
            <div class="overview-value"><asp:Label ID="lblAvgQuizScore" runat="server" /></div>
        </div>
        <div class="overview-card">
            <div class="overview-icon">🏅</div>
            <div class="overview-label">Most Earned Badge</div>
            <div class="overview-value"><asp:Label ID="lblMostEarnedBadge" runat="server" /></div>
            <div class="overview-value">“Slang Starter” (13)</div>
        </div>
    </div>
</div>

</asp:Content>

