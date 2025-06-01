<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="css/FAQ.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="faq-wrapper">
    <h2>Frequently Asked Questions</h2>
    <p>Have questions? We've got answers. Below are some of the most common questions about using Rojak 101 from getting started to navigating modules and quizzes. If you’re new here, this is a great place to begin!</p>

    <div class="accordion">

      <div class="accordion-item">
        <button type="button" class="accordion-btn">
          <span class="arrow">&#9654;</span>
         What is Rojak 101?
        </button>
        <div class="accordion-content">
          <p>Rojak 101 is an interactive learning platform that introduces users to Malaysian slang, social customs, and etiquette. It’s designed for locals, tourists, and newcomers who want to better understand everyday cultural practices in Malaysia.</p>
        </div>
      </div>

      <div class="accordion-item">
        <button type="button" class="accordion-btn">
          <span class="arrow">&#9654;</span>
         Who is this platform for?
        </button>
        <div class="accordion-content">
          <p>This platform is ideal for students, expats, tourists, or anyone curious about Malaysian culture. Whether you’re preparing for a visit or simply want to understand your Malaysian friends better, Rojak 101 is for you!</p>
        </div>
      </div>

      <div class="accordion-item">
        <button type="button" class="accordion-btn">
          <span class="arrow">&#9654;</span>
          Do I need an account to use Rojak 101?
        </button>
        <div class="accordion-content">
          <p>Yes, you’ll need to register for an account to track your progress, access all learning modules, and take quizzes. It’s quick and free!</p>
        </div>
      </div>

      <div class="accordion-item">
        <button type="button" class="accordion-btn">
          <span class="arrow">&#9654;</span>
          How do the learning modules work?
        </button>
        <div class="accordion-content">
          <p>Each module focuses on a theme — like slang, etiquette, or social norms. You’ll be guided through bite-sized lessons with examples, followed by a quiz to test your knowledge.</p>
        </div>
      </div>

      <div class="accordion-item">
        <button type="button" class="accordion-btn">
          <span class="arrow">&#9654;</span>
         Can I revisit completed modules and quizzes?
        </button>
        <div class="accordion-content">
          <p>Absolutely! You can return to any module as often as you like. The platform encourages review and reinforcement of what you’ve learned.</p>
        </div>
      </div>

    </div>
  </div>
    <script src="FAQ.js"></script>
    
</asp:Content>

