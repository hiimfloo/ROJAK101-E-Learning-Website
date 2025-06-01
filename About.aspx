<%@ Page Title="About Us" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="css/About.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-wrapper">

    <!-- Title -->
    <h2>About Us</h2>

    <!-- Hero Image -->
    <div class="hero-img">
      <img src="images/about%20us%20hero.png" alt="Colorful Malaysian Street" />
    </div>

    <!-- What is Rojak 101 -->
    <div class="about-container">
      <section class="about-section">
        <h3>What is Rojak 101?</h3>
        <p>Rojak 101 is a fun and accessible web platform designed to help international students and
            newcomers explore and understand Malaysian slang and local customs. We believe that learning informal 
            language and cultural quirks is key to truly feeling at home in Malaysia.</p>
        <div class="section-divider"></div>
      </section>

      <!-- Our Mission -->
    <section class="about-section">
      <h3>Our Mission</h3>
      <p>To bridge cultural gaps by making Malaysian everyday language and social etiquette easy to learn, enjoyable, and relatable — especially for those newly arriving in Malaysia.</p>
      <div class="section-divider"></div>
    </section>

      <!-- Who We Are -->
      <section class="about-section who-we-are">
        <h3>Who We Are</h3>
        <div class="who-box">
          <img src="images/scammers%20pic.png" alt="Our Team">
          <div>
            <h4>SCAMMERS</h4>
            <p>We're a team of 4 students and culture enthusiasts passionate about showcasing Malaysia’s rich linguistic diversity. This project was developed to promote cultural understanding and support smoother integration for people experiencing Malaysia for the first time.</p>
          </div>
        </div>
        <div class="section-divider"></div>
      </section>

      <!-- Why Rojak -->
      <section class="about-section">
        <h3>Why ‘Rojak’?</h3>
        <p>Just like the popular local dish, Malaysia’s culture is a mix of<br /> many flavors — Malay, Chinese, Indian, and beyond.
            The name "Rojak" reflects<br /> our goal to blend these influences into one easy-to-digest guide.</p>
        <a href="Register.aspx" class="cta-btn">Sign Up Now</a>
      </section>
    </div>
  </div>
</asp:Content>
