<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Perfection_Institute._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@700&display=swap');

        /* Animated Gradient Background Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            color: white;
            background: linear-gradient(45deg, #FF5F6D, #FFC371, #36D1DC, #5B86E5, #8E44AD);
            background-size: 500% 500%;
            animation: gradientShift 15s ease infinite;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            25% { background-position: 50% 100%; }
            50% { background-position: 100% 50%; }
            75% { background-position: 50% 0%; }
            100% { background-position: 0% 50%; }
        }

        /* Title Animation */
        .dark-red-underline {
            font-family: 'Cinzel', serif;
            color: #8B0000;
            text-decoration: underline;
            font-weight: bold;
            animation: titleAnimation 3s ease-in-out infinite alternate;
        }

        @keyframes titleAnimation {
            0% { letter-spacing: 1px; }
            100% { letter-spacing: 5px; }
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            height: 650px;
            position: relative;
            margin: auto;
            overflow: hidden;
            background-image: url('http://pieacademy.in.net/comp_eng_of_flex-6&4-only%20comp.jpg');
            background-size: cover;
            background-position: center;
        }

        /* Slideshow images */
        .mySlides img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* Caption text */
        .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
        }

        /* Dots */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active, .dot:hover {
            background-color: #717171;
        }

        .fade {
            animation: slideIn 4.0s ease-in-out;
        }

        @keyframes slideIn {
            0% { transform: translateX(100%); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }

        h2 {
            color: #0044cc;
            font-size: 1.8em;
            font-weight: bold;
            border-bottom: 2px solid #0044cc;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }

        p {
            margin: 10px 0;
            font-size: 1.1em;
        }

        .btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #0044cc;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #002a80;
        }
    </style>

    <!-- Slideshow Container -->
    <div class="slideshow-container">
        <div class="mySlides fade">
            <img src="http://pieacademy.in.net/all%20subjects.jpg" alt="Admission Support">
            <div class="text">Admission Support</div>
        </div>

        <div class="mySlides fade">
            <img src="http://pieacademy.in.net/coreldraw.jpg" alt="Coreldraw">
            <div class="text">Coreldraw</div>
        </div>

        <div class="mySlides fade">
            <img src="http://pieacademy.in.net/adv.excel.jpg" alt="Advance Excel">
            <div class="text">Advance Excel</div>
        </div>

        <div class="mySlides fade">
            <img src="http://pieacademy.in.net/advanced-web-development.jpg" alt="Advance Web Development">
            <div class="text">Advance Web Development</div>
        </div>

        <div class="mySlides fade">
            <img src="http://pieacademy.in.net/digital%20accounting.jpg" alt="Advance Digital Accounting">
            <div class="text">Advance Digital Accounting</div>
        </div>

        <div class="mySlides fade">
            <img src="http://pieacademy.in.net/basic1.jpg" alt="Basic Computer Course">
            <div class="text">Basic Computer Course</div>
        </div>

        <!-- Next and Previous Buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>

    <!-- Dots for Navigation -->
    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
        <span class="dot" onclick="currentSlide(5)"></span>
        <span class="dot" onclick="currentSlide(6)"></span>
    </div>

    <!-- JavaScript for Slideshow -->
    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1; }
            for (let i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            setTimeout(showSlides, 5000);
        }

        function plusSlides(n) {
            slideIndex += n - 1;
            if (slideIndex < 0) slideIndex = document.getElementsByClassName("mySlides").length - 1;
            showSlides();
        }

        function currentSlide(n) {
            slideIndex = n - 1;
            showSlides();
        }
    </script>

    <!-- Page Content -->
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle" class="dark-red-underline">Perfection Institute of Education</h1>
            <p class="lead dark-blue-underline">Computer Institute</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 id="gettingStartedTitle">Computer Academy</h2>
                <p>
                    Our computer training programs are designed to equip students and professionals with essential digital and technical skills using state-of-the-art technology and advanced computer systems. We provide a variety of courses ranging from basic computer literacy to advanced certifications, including:
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                </p>
            </section>

            <section class="col-md-4" aria-labelledby="communityTitle">
                <h2 id="communityTitle">Coaching Services</h2>
                <p>
                    At Perfection Institute of Education, we understand that every student has unique learning needs and aspirations. Our coaching services are designed to cater to these diverse requirements, providing a supportive and enriching environment for students in 6th to 12th grades across all subjects.
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </section>

            <section class="col-md-4" aria-labelledby="newTitle">
                <h2 id="newTitle">Admission Support</h2>
                <p>
                   We also offer comprehensive admission support services for students seeking to pursue formal education through various recognized boards and universities. We guide students through the admission process for NIOS and CBSE (10th & 12th), and provide expert assistance for higher education courses such as:
                </p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkID=398604">Learn more &raquo;</a>
                </p>
            </section>
        </div>
    </main>
</asp:Content>
