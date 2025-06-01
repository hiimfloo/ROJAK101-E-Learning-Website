<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GuestQuizResult.aspx.cs" Inherits="GuestQuizResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/Quiz.css" rel="stylesheet" />
    <style>
        .result-wrapper {
            max-width: 700px;
            margin: 100px auto;
            background-color: #fff1dc;
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .result-wrapper h1 {
            font-family: 'Fredoka', sans-serif;
            font-size: 36px;
            color: #5c2e17;
            margin-bottom: 20px;
        }

        .score {
            font-size: 24px;
            font-weight: bold;
            color: #4e3629;
            margin-top: 20px;
        }

        .back-button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 24px;
            background-color: #f6b840;
            color: #5c2e17;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            border-radius: 999px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.2s ease;
        }

        .back-button:hover {
            background-color: #f3a826;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="result-wrapper">
        <h1>Quiz Completed!</h1>
      <div class="score">
    <asp:Literal ID="ltFinalScore" runat="server"></asp:Literal>
</div>
        <p>Login or Register to access the full quiz!</p>
        <a href="Login.aspx" class="back-button">Go to Login</a>
    </div>
</asp:Content>
