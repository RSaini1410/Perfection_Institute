<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="Perfection_Institute.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    <style>
/* General styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeIn 2s ease-in;
            background: linear-gradient(120deg, #003366, #FFD700, #FFFFFF);
            background-size: 300% 300%;
            animation: gradientAnimation 15s ease infinite;
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        header {
            text-align: center;
            background-color: rgba(0, 0, 51, 0.8); /* Transparent header */
            padding: 15px 0;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: #FFD700;
        }

        .title img {
            width: 80px;
            vertical-align: middle;
        }

        .title {
            font-size: 2em;
            letter-spacing: 2px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.7);
        }

        nav a {
            color: #FFD700;
            text-decoration: none;
            font-size: 1em;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        section {
            background-color: rgba(255, 255, 255, 0.9);
            margin: 20px 0;
            padding: 20px;
            border-radius: 8px;
            text-align: left;
            width: 90%;
            max-width: 800px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #003366;
        }

        ul {
            list-style-type: disc;
            margin-left: 20px;
            padding-left: 20px;
        }

        form input, form textarea, form button {
            width: 90%;
            max-width: 600px;
            margin: 10px auto;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form button {
            background-color: #003366;
            color: #fff;
            font-size: 1.1em;
            cursor: pointer;
        }

        form button:hover {
            background-color: #002244;
        }

        footer {
            margin-top: 20px;
            color: #777;
            text-align: center;
            font-size: 0.9em;
        }

        .map-container iframe {
            width: 100%;
            height: 350px;
            border: 0;
            border-radius: 8px;
        }

        /* Particle background container */
        #particle-background {
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: -1;
        }


/*body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    color: #333;*/ /* Set dark text as default */
    /*background-color: #f7f7f7;*/ /* Set a light gray background for better contrast */
    /*min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
}

header {
    text-align: center;
    background-color: #003366;*/ /* Dark blue for header */
    /*padding: 15px 0;
    width: 100%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    color: #FFD700;*/ /* Gold text for visibility */
/*}*/

.title img {
    width: 80px;
    vertical-align: middle;
}

.title {
    font-size: 2em;
    letter-spacing: 2px;
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.7);
}

nav a {
    color: #FFD700; /* Gold links for contrast */
    text-decoration: none;
    font-size: 1em;
    padding: 10px 20px;
    margin: 5px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

/*nav a:hover {
    background-color: rgba(255, 255, 255, 0.2);
}

section {
    background-color: #ffffff;*/ /* White background for section */
    /*color: #333;*/ /* Dark text for readability */
    /*margin: 20px 0;
    padding: 20px;
    border-radius: 8px;
    text-align: left;
    width: 90%;
    max-width: 800px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}*/

h3 {
    color: #003366; /* Dark blue headings for visibility */
    margin-bottom: 15px;
}

p, ul li {
    color: #555; /* Medium-dark text for readability */
}

ul {
    list-style-type: disc;
    margin-left: 20px;
    padding-left: 20px;
}

form input, form textarea, form button {
    width: 90%;
    max-width: 600px;
    margin: 10px auto;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
    color: #333; /* Dark text inside input fields */
}

form button {
    background-color: #003366; /* Dark blue button */
    color: #fff; /* White text for contrast */
    font-size: 1.1em;
    cursor: pointer;
}

form button:hover {
    background-color: #002244; /* Slightly darker blue on hover */
}

footer {
    margin-top: 20px;
    color: #777;
    text-align: center;
    font-size: 0.9em;
}

.map-container iframe {
    width: 100%;
    height: 350px;
    border: 0;
    border-radius: 8px;
}

/* Styling for specific sections */
#coaching, #english-speaking, #computer-courses, #admission {
    background-color: #f9f9f9; /* Light gray for consistent readability */
    color: #333; /* Dark text */
    padding: 20px;
    border-radius: 8px;
    margin: 20px 0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

#coaching ul li, #english-speaking ul li, #computer-courses ul li, #admission ul li {
    color: #555; /* Medium-dark text for lists */
}

#coaching h3, #english-speaking h3, #computer-courses h3, #admission h3 {
    color: #003366; /* Ensure headings stand out */
}


    </style>

    <header>
        <div class="title">
            <img src="https://piegzb.bsite.net/pie%20logo1.png" alt="Logo">
            <br>Perfection Institute of Education
        </div>
        <nav>
            <a href="#about">About</a>
            <a href="#coaching">Coaching</a>
            <a href="#computer-courses">Computer Courses</a>
            <a href="#admission">Admission</a>
            <a href="#enquiry">Enquiry</a>
            <a href="#location">Location</a>
        </nav>
    </header>

    <section id="about">
        <div class="content">
            <h3>About Us</h3>
            <p>At Perfection Institute of Education, we are committed to providing a nurturing environment that empowers students to achieve their academic goals. We offer personalized coaching for students from <strong>6th to 12th grades</strong> across all subjects, ensuring a strong foundation for future studies.</p>
            <p><strong>Address:</strong> S-20, F-1, 1st Floor, Block-B, Shalimar Garden Extension-II, Ghaziabad, Uttar Pradesh-201005</p>
            <p><strong>Mobile:</strong> +91-9990333712</p>
            <p><strong>Email:</strong> perfection.education@gmail.com</p>
        </div>
    </section>

    <section id="coaching">
        <div class="content">
            <h3>Coaching Services</h3>
             <p>At Perfection Institute of Education, we understand that every student has unique learning needs and aspirations. Our coaching services are designed to cater to these diverse requirements, providing a supportive and enriching environment for students in <strong>6th to 12th grades</strong> across all subjects.</p>
        
        <p>Our curriculum is tailored to foster academic excellence and personal growth, ensuring that each student not only excels in their studies but also develops essential life skills. Here’s what sets our coaching services apart:</p>

        <ul>
            <li><strong>Personalized Learning Plans:</strong> We create individualized learning plans based on each student’s strengths, weaknesses, and academic goals. This personalized approach helps students grasp complex concepts more effectively and boosts their confidence.</li>
            <li><strong>Experienced Faculty:</strong> Our highly qualified and experienced faculty members bring a wealth of knowledge and expertise. They are passionate about teaching and are committed to nurturing students' intellectual curiosity.</li>
            <li><strong>Interactive Learning Environment:</strong> We employ modern teaching methodologies, including interactive discussions, hands-on activities, and technology-enhanced learning tools. This fosters a dynamic classroom atmosphere that keeps students engaged and motivated.</li>
            <li><strong>Regular Assessments:</strong> We conduct regular assessments and mock tests to track progress and identify areas for improvement. This helps students prepare effectively for their examinations and reduces exam-related stress.</li>
            <li><strong>Parent-Teacher Collaboration:</strong> We believe in the importance of communication between parents and teachers. Regular meetings and feedback sessions are held to ensure parents are updated on their child’s progress and can contribute to their academic journey.</li>
            <li><strong>Holistic Development:</strong> Apart from academic excellence, we focus on the overall development of our students. We encourage participation in extracurricular activities, workshops, and seminars that enhance their critical thinking, teamwork, and leadership skills.</li>
            <li><strong>Success Stories:</strong> Our students consistently achieve outstanding results in their board exams and competitive entrance tests. Many of our alumni have gone on to excel in prestigious colleges and universities, attributing their success to the solid foundation laid at our institute.</li>
        </ul>
        
        <p>Our coaching programs not only aim to improve academic performance but also prepare students for future challenges. With a strong emphasis on building character, resilience, and a passion for learning, we are dedicated to shaping the leaders of tomorrow.</p>
   
        </div>
    </section>
    <section id="english-speaking">
    <div class="content">
        <h3>English Speaking Courses</h3>
        <p>At Perfection Institute of Education, we recognize the critical role of effective communication in today’s global society. Our <strong>English Speaking Courses</strong> are specially designed to empower students with the language skills they need to excel in both academic and personal settings.</p>

        <div class="highlight">
            <h4>Key Features of Our English Speaking Courses:</h4>
            <ul>
                <li><strong>Fluency Development:</strong> Engage in interactive speaking exercises to improve fluency and confidence.</li>
                <li><strong>Vocabulary Expansion:</strong> Learn new words and phrases through practical application in everyday contexts.</li>
                <li><strong>Conversational Skills:</strong> Participate in group discussions and role-playing scenarios to enhance conversational abilities.</li>
                <li><strong>Pronunciation and Accent Training:</strong> Receive personalized feedback on pronunciation to develop clear and effective speech.</li>
                <li><strong>Public Speaking Workshops:</strong> Gain experience in public speaking, helping students articulate their thoughts confidently in front of an audience.</li>
                <li><strong>Interactive Learning Environment:</strong> Classes are conducted in a supportive setting that encourages active participation and peer interaction.</li>
                <li><strong>Flexible Scheduling:</strong> Courses are offered at various times to accommodate busy student schedules.</li>
            </ul>
        </div>

        <h4>Benefits of Joining Our English Speaking Courses:</h4>
        <ul>
            <li><strong>Boosts Academic Performance:</strong> Improved language skills can lead to better performance in written and oral assessments.</li>
            <li><strong>Enhances Career Opportunities:</strong> Proficiency in English opens doors to a wider range of job opportunities in various fields.</li>
            <li><strong>Builds Confidence:</strong> Mastering spoken English helps students express themselves more confidently in social and professional settings.</li>
            <li><strong>Improves Interpersonal Skills:</strong> Enhanced communication skills foster better relationships with peers, teachers, and future employers.</li>
            <li><strong>Prepares for Competitive Exams:</strong> Many competitive exams require strong English communication skills; our courses help students excel.</li>
        </ul>

        <p>Join our English Speaking Courses today to embark on a journey towards effective communication and personal growth. Equip yourself with the skills to succeed in a diverse and interconnected world!</p>
    </div>
</section>



     <section id="computer-courses">
        <div class="content">
            <h3>Computer Courses</h3>
           <p>Our computer training programs are designed to equip students and professionals with essential digital and technical skills using <strong>state-of-the-art technology</strong> and <strong>advanced computer systems</strong>. We provide a variety of courses ranging from basic computer literacy to advanced certifications, including:</p>
            <ul class="features-list">
                <li><strong>Desktop Publishing (DTP)</strong></li>
                <li><strong>Advanced Excel</strong> for data management and analytics</li>
                <li><strong>Tally Prime & Tally ERP 9</strong> for financial accounting</li>
                <li><strong>Graphic Designing</strong> (CorelDraw & Photoshop) for creatives</li>
                <li><strong>Web Designing</strong> for budding developers</li>
                <li><strong>Python Programming</strong> for programming enthusiasts</li>
            </ul>
            <p>Each program is delivered by industry experts, ensuring that students gain practical skills that are relevant to today’s job market. Our institute is equipped with the latest software and infrastructure to ensure an effective and engaging learning environment.</p>
       
        </div>
    </section>



    <section id="admission">
    <div class="content">
        <h3>Admission Support</h3>
        <p>We also offer comprehensive <strong>admission support services</strong> for students seeking to pursue formal education through various recognized boards and universities. We guide students through the admission process for <strong>NIOS</strong> and <strong>CBSE</strong> (10th & 12th), and provide expert assistance for higher education courses such as:</p>
        <ul class="features-list">
            <li><strong>B.Ed.</strong> (Bachelor of Education)</li>
            <li><strong>B.A.</strong> (Bachelor of Arts)</li>
            <li><strong>B.Com.</strong> (Bachelor of Commerce)</li>
            <li><strong>BBA</strong> (Bachelor of Business Administration)</li>
            <li><strong>BCA</strong> (Bachelor of Computer Applications)</li>
            <li><strong>M.A.</strong> (Master of Arts)</li>
            <li><strong>M.Com.</strong> (Master of Commerce)</li>
            <li><strong>MBA</strong> (Master of Business Administration)</li>
        </ul>
        <p>We support both <strong>regular</strong> and <strong>distance learning</strong> programs, ensuring that students have flexible learning options to suit their needs. With our <strong>guidance and counseling services</strong>, students can navigate their educational paths with confidence.</p>
    </div>
</section>


    <section id="enquiry">
        <h3>Enquiry Form</h3>
       <form id="enquiry-form">
    <input type="text" id="name" name="name" placeholder="Your Name" required>
    <input type="email" id="email" name="email" placeholder="Your Email" required>
    <input type="text" id="phone" name="phone" placeholder="Your Phone Number" required>
    <textarea id="message" name="message" placeholder="Your Message" rows="4" required></textarea>
    <button type="submit">Send Enquiry</button>
</form>

<!-- Success/Error Messages -->
<div id="success-message" style="display:none; color: green;">Your message has been sent successfully!</div>
<div id="error-message" style="display:none; color: red;">There was an error sending your message. Please try again.</div>
    </section>

    <section id="location">
        <h3>Location</h3>
        <div class="map-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31120.25218352477!2d77.32339897342589!3d28.648397637290595!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cfa52007d260d%3A0x817f8a8a87bdbce3!2sPerfection%20Institute%20of%20Education!5e0!3m2!1sen!2sin!4v1700000000" allowfullscreen></iframe>
        </div>
    </section>

<!-- Include EmailJS Script -->
<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
<script type="text/javascript">
    // Initialize EmailJS with your public key
    emailjs.init("wwIOv1v8ozZV-Q5B5");

    // Handle form submission
    document.getElementById('enquiry-form').addEventListener('submit', function (event) {
        event.preventDefault();

        // Get form values
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const phone = document.getElementById('phone').value;
        const message = document.getElementById('message').value;

        // Template parameters for EmailJS
        const templateParams = {
            name: name,
            email: email,
            phone: phone,
            message: message
        };

        // Send form data using EmailJS
        emailjs.send('service_hpi8edj', 'template_8qg0ded', templateParams)
            .then(function (response) {
                // On success, show success message and hide error message
                document.getElementById('success-message').style.display = 'block';
                document.getElementById('error-message').style.display = 'none';

                // Reset the form
                document.getElementById('enquiry-form').reset();
            }, function (error) {
                // On error, show error message and hide success message
                document.getElementById('error-message').style.display = 'block';
                document.getElementById('success-message').style.display = 'none';

                // Log the error for debugging
                console.log("Error occurred: ", error);
            });
    });
</script>


</asp:Content>
