<%@ Page Title="Guest Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Allura&family=Baloo+2:wght@400..800&family=Caveat+Brush&family=Chewy&family=Cinzel+Decorative:wght@400;700;900&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Neucha&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Reenie+Beanie&display=swap');
    </style>

    <style>
    @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@200;300;400;500;700;800;900&display=swap');
    </style>
    
  
    <link href="css/GuestHomePage.css" rel="stylesheet" />
    

    <!-- Carousel Section -->
<div class="carousel-container">
    <div class="carousel-slide fade">
        <img src="images/image%2010.png" />
        <div class="carousel-caption">
            <h1>Selamat Datang!<br />Learn Malaysian Slang & Culture</h1>
            <a href="Register.aspx" class="btn-get-started">Get Started</a>
        </div>
    </div>

    <div class="carousel-slide fade">
        <img src="images/image%20guest%202.png" />
        <div class="carousel-caption">
            <h1>Discover Local Life<br />Explore how Malaysians greet, joke, and interact</h1>
            <a href="Register.aspx" class="btn-get-started">Get Started</a>
        </div>
    </div>

    <div class="carousel-slide fade">
        <img src="images/image%20guest.png" />
        <div class="carousel-caption">
            <h1>Rojak 101<br />Language. Culture. Identity.</h1>
            <a href="Register.aspx" class="btn-get-started">Get Started</a>
        </div>
    </div>

    <!-- Navigation dots -->
    <div class="carousel-dots">
        <span class="dot" onclick="setSlide(1)"></span>
        <span class="dot" onclick="setSlide(2)"></span>
        <span class="dot" onclick="setSlide(3)"></span>
    </div>
</div>

 <!-- Why Learn Section -->
<div class="why-learn">
    <div class="why-learn-container">
        <div class="why-learn-image">
            <img src="images/guest%20image%203.png" alt="Malaysian Slang Graphic" />
        </div>
        <div class="why-learn-text">
            <h2>Why Learn Malaysian Slang & Customs?</h2>
            <p>
                Understanding Malaysian slang and customs goes beyond just language—it helps international students feel more connected, confident, and comfortable in daily life. It bridges the cultural gap, making it easier to understand locals, build friendships, and adapt quickly to Malaysia’s vibrant, multicultural environment.
            </p>
        </div>
    </div>
</div>

<!-- Features Overview -->
<div class="features-overview">
    <h2>Features Overview</h2>
    <div class="feature-container">
        <div class="feature-card">
            <img src="images/lesson%20features.png"  alt="Lesson Features" />
            <h3>Lesson Features</h3>
            <p>We strive to give our users interactive bite-sized lessons that cover common slang, cultural phrases, and social do’s and don’ts—complete with examples, visuals, and audio for easy learning.</p>
        </div>

        <div class="feature-card">
            <img src="images/quiz%20features.png" alt="Quiz Features" />
            <h3>Quiz Features</h3>
            <p>We strive to give our users fun, gamified quizzes after each lesson to help reinforce what you’ve learned with instant feedback and progress tracking to keep you motivated.</p>
        </div>

        <div class="feature-card">
            <img src="images/dashboard.png" alt="Dashboard" />
            <h3>Dashboard</h3>
            <p>We strive to give our users a personalized dashboard that shows your learning progress, completed lessons, quiz scores, and helpful suggestions on what to explore next.</p>
        </div>
    </div>
</div>

    <!-- Sample Buttons Section -->
<div class="sample-section">
    <div class="sample-box">
        <h3>Sample Module</h3>
        <p>Get a taste of our lesson! Explore a sneak peek—register or log in for the full experience!</p>
        <a href="GuestModule.aspx" class="btn-sample">Try Lesson</a>
    </div>
    <div class="sample-box">
        <h3>Quiz</h3>
        <p>Ready for a challenge? Sign up now and put your knowledge to the test with fun quizzes!</p>
        <a href="GuestQuiz.aspx" class="btn-sample">Try Quiz</a>
    </div>
</div>

<!-- Testimonials Section -->
<div class="testimonials">
    <h2>Testimonials</h2>

 <asp:Repeater ID="rptTestimonials" runat="server">
    <ItemTemplate>
        <%# Container.ItemIndex % 3 == 0 ? "<div class='testimonial-slide'>" : "" %>
            <div class="testimonial-card <%# GetCardColor(Container.ItemIndex) %>">
                <div class="quote-icon"></div>
                <p class="testimonial-text"><%# Eval("Message") %></p>
                <div class="testimonial-footer <%# GetFooterColor(Container.ItemIndex) %>">
                    <div class="avatar-circle"></div>
                    <span class="testimonial-name"><%# Eval("UserName") %></span>
                </div>
            </div>
        <%# (Container.ItemIndex + 1) % 3 == 0 || Container.ItemIndex + 1 == ((Repeater)Container.NamingContainer).Items.Count ? "</div>" : "" %>
    </ItemTemplate>
</asp:Repeater>
    </div>

    <!-- Navigation Arrows -->
    <div class="testimonial-nav">
   <div class="testimonial-nav-left">
    <button type="button" onclick="prevSlide()">❮</button>
</div>

<div class="testimonial-nav-right">
    <button type="button" onclick="nextSlide()">❯</button>
</div>  
    </div>

<script>
    let slideGroupIndex = 0;
    const slideGroups = document.querySelectorAll(".testimonial-slide");

    function showGroup(index) {
        slideGroups.forEach((group, i) => {
            group.classList.remove("active");
            if (i === index) group.classList.add("active");
        });
    }

    function nextSlide() {
        slideGroupIndex = (slideGroupIndex + 1) % slideGroups.length;
        showGroup(slideGroupIndex);
    }

    function prevSlide() {
        slideGroupIndex = (slideGroupIndex - 1 + slideGroups.length) % slideGroups.length;
        showGroup(slideGroupIndex);
    }

    window.addEventListener("load", () => {
        if (slideGroups.length > 0) {
            showGroup(0);
            setInterval(nextSlide, 6000); // Auto slide every 6 seconds
        }
    });
</script>

    <script src="GuestHomePage.js"></script>
</asp:Content>
