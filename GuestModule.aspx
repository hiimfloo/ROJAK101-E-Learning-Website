<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GuestModule.aspx.cs" Inherits="GuestModule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/Modules.css" rel="stylesheet" />
    <script>
        let currentIndex = 0;
        let viewedSlideCount = 0;

        let currentAudio = null;

        function generateDots(slideCount) {
            const container = document.getElementById('dotContainer');
            container.innerHTML = '';
            for (let i = 0; i < slideCount; i++) {
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

            currentIndex = index; // update the current index globally

            slides.forEach((slide, i) => {
                slide.style.display = i === currentIndex ? 'block' : 'none';
            });

            dots.forEach((dot, i) => {
                dot.classList.toggle('active-dot', i === currentIndex);
            });

            // ⛔ Only redirect if user tries to go to 3rd slide (index = 2)
            if (currentIndex === 2) {
                window.location.href = 'Login.aspx?continue=usermodule';
                return;
            }

            if (currentAudio && !currentAudio.paused) {
                currentAudio.pause();
                currentAudio.currentTime = 0;
            }
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
            showSlide(currentIndex);
        }

        function toggleAudio(btn) {
            const audio = btn.nextElementSibling;

            if (currentAudio && currentAudio !== audio) {
                currentAudio.pause();
                currentAudio.currentTime = 0;
            }

            if (audio.paused) {
                audio.play();
                currentAudio = audio;
            } else {
                audio.pause();
            }
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
        <h1>Malaysian Slang</h1>

        <asp:Repeater ID="rptLessonContent" runat="server" OnItemDataBound="rptLessonContent_ItemDataBound">
            <ItemTemplate>
                <div class="carousel-slide">
                    <div class="slide-card">
                        <button type="button" class="audio-button" onclick="toggleAudio(this)">🔊</button>
                        <audio id="audioPlayer" runat="server" controls="controls" style="display:none;">
                            <source id="audioSource" runat="server" type="audio/mpeg" />
                        </audio>

                        <h2>“<%# Eval("ContentTitle") %>”</h2>
                        <p><strong>Meaning:</strong> <%# Eval("PracticeText") %></p>
                        <p><strong>Example:</strong> <%# Eval("ImportanceText") %></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

        <div class="carousel-controls">
            <button type="button" onclick="prevSlide()" class="arrow-btn">❮</button>
            <div class="dot-container" id="dotContainer"></div>
            <button type="button" onclick="nextSlide()" class="arrow-btn">❯</button>
        </div>

<div class="back-button-container">
    <a href="Modules.aspx" class="back-button">← Back to Modules</a>
</div>
</asp:Content>