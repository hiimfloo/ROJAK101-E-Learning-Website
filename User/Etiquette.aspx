<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Etiquette.aspx.cs" Inherits="User_Etiquette" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fffdf8;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            font-family: 'Fredoka', sans-serif;
            color: #5c2e17;
            font-size: 36px;
            margin: 40px 0;
        }

        .carousel-container {
            max-width: 800px;
            margin: 80px auto 60px auto;
            text-align: center;
        }

        .carousel-slide {
            display: none;
        }

        .slide-card {
            background-color: #ffe7c4;
            border-radius: 20px;
            padding: 40px 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .slide-card img {
            max-width: 60%;
            height: 50%;
            border-radius: 12px;
            margin-bottom: 20px;
        }

        .slide-card h2 {
            font-family: 'Fredoka', sans-serif;
            font-size: 28px;
            color: #5c2e17;
            margin-bottom: 15px;
        }

        .slide-card p {
            font-size: 18px;
            color: #4e3629;
            margin: 10px 0;
        }

        .slide-card strong {
            color: #8b4c28;
        }

        .carousel-controls {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 40px;
            flex-wrap: wrap;
        }

        .arrow-btn {
            font-size: 22px;
            padding: 8px 16px;
            border: none;
            border-radius: 50%;
            background-color: #f6b840;
            color: #5c2e17;
            cursor: pointer;
            width: 42px;
            height: 42px;
        }

        .dot-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            flex: none;
        }

        .dot {
            height: 10px;
            width: 10px;
            background-color: #ddd;
            border-radius: 50%;
            display: inline-block;
            cursor: pointer;
        }

        .active-dot {
            background-color: #f6b840;
        }

        .back-button-container {
            max-width: 800px;
            margin: 50px auto;
            text-align: center;
        }

        .back-button {
            background-color: #f6b840;
            color: #5c2e17;
            font-weight: bold;
            padding: 10px 24px;
            border-radius: 999px;
            text-decoration: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .back-button:hover {
            background-color: #f3a826;
        }
    </style>

    <script>
        let currentIndex = 0;

        function generateDots(count) {
            const container = document.getElementById('dotContainer');
            container.innerHTML = '';
            for (let i = 0; i < count; i++) {
                const dot = document.createElement('span');
                dot.classList.add('dot');
                if (i === 0) dot.classList.add('active-dot');
                dot.onclick = () => goToSlide(i);
                container.appendChild(dot);
            }
        }

        function showSlide(index) {
            const slides = document.querySelectorAll('.carousel-slide');
            const dots = document.querySelectorAll('.dot');

            if (index >= slides.length) currentIndex = 0;
            if (index < 0) currentIndex = slides.length - 1;

            slides.forEach((slide, i) => {
                slide.style.display = i === currentIndex ? 'block' : 'none';
            });

            dots.forEach((dot, i) => {
                dot.classList.toggle('active-dot', i === currentIndex);
            });
        }

        function nextSlide() {
            currentIndex++;
            showSlide(currentIndex);
        }

        function prevSlide() {
            currentIndex--;
            showSlide(currentIndex);
        }

        function goToSlide(index) {
            currentIndex = index;
            showSlide(index);
        }

        window.onload = () => {
            const slides = document.querySelectorAll('.carousel-slide');
            generateDots(slides.length);
            showSlide(currentIndex);
        };
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="carousel-container">
        <h1>Malaysian Etiquette</h1>

        <asp:Repeater ID="rptLessonContent" runat="server">
            <ItemTemplate>
                <div class="carousel-slide">
                    <div class="slide-card">
                        <img src='<%# Eval("ImagePath") %>' alt="Etiquette Image" />
                        <h2><%# Eval("ContentTitle") %></h2>
                        <p><strong>Meaning:</strong> <%# Eval("PracticeText") %></p>
                        <p><strong>Example:</strong> <%# Eval("ImportanceText") %></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="carousel-controls">
            <button type="button" onclick="prevSlide()" class="arrow-btn">❮</button>
            <div class="dot-container" id="dotContainer"></div>
            <button type="button" onclick="nextSlide()" class="arrow-btn">❯</button>
        </div>
    </div>

    <div class="back-button-container">
        <a href="Modules.aspx" class="back-button">← Back to Modules</a>
    </div>
</asp:Content>


