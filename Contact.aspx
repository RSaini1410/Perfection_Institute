<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="Perfection_Institute.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%:Title %></h2>
        <style>
            /* General Body Styling */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                animation: fadeIn 1s ease-in;
            }

            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }

            /* Header Styling */
            header {
                background-color: #4CAF50;
                color: white;
                padding: 1.5rem;
                text-align: center;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            }

            header h1 {
                margin: 0;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
            }

            nav ul li {
                display: inline;
                margin-right: 20px;
            }

            nav ul li a {
                color: white;
                text-decoration: none;
                font-weight: bold;
            }

            /* Contact Section Styling */
            section {
                margin: 20px;
                padding: 20px;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h3 {
                color: #333;
                margin-top: 20px;
                font-size: 1.6rem;
            }

            .contact-details p {
                font-size: 1.1rem;
                margin-bottom: 15px;
            }

            .contact-details strong {
                font-weight: bold;
            }

            /* Contact Form Styling */
            .contact-form {
                display: flex;
                flex-direction: column;
                max-width: 600px;
                margin: 0 auto;
            }

            .contact-form input,
            .contact-form textarea,
            .contact-form select {
                margin-bottom: 15px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 1rem;
            }

            .contact-form button {
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1.1rem;
            }

            .contact-form button:hover {
                background-color: #45a049;
            }

            /* Map Container Styling */
            .map-container {
                margin-top: 20px;
                overflow: hidden;
                position: relative;
                padding-top: 56.25%; /* 16:9 Aspect Ratio */
                max-width: 100%;
                height: 450px;
            }

            .map-container iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }

            /* Footer Styling */
            footer {
                background-color: #333;
                color: white;
                text-align: center;
                padding: 1rem;
                margin-top: 20px;
            }
        </style>

        <!-- Header Section -->
        <header>
            <h1>Contact Us</h1>
        </header>

        <!-- Contact Section -->
        <section>
            <div class="contact-details">
                <h3>Get in Touch</h3>
                <p>If you have any questions or need further information, feel free to contact us using the form below or through our contact details:</p>
                <p><strong>Phone:</strong> 9990333712</p>
                <p><strong>Address:</strong> S-20, F-1, near SM World Complex, opposite Axis Bank & SBI Bank, Block B, Shalimar Garden Extension II, Shalimar Garden, Ghaziabad, Uttar Pradesh 201005</p>
            </div>
           
           <h3><b><u>Contact Form</u></b></h3>
           
<!-- Corrected and Styled Form -->
<class="contact-form" id="contact-form">
    <div class="form-group">
        <label for="from_name">Your Name</label>
        <input type="text" id="from_name" name="from_name" placeholder="Enter Your Name" required>
    </div>

    <div class="form-group">
        <label for="from_email">Your Email</label>
        <input type="email" id="from_email" name="from_email" placeholder="Enter Your Email" required>
    </div>

    <div class="form-group">
        <label for="from_mobile">Your Mobile Number</label>
        <input type="tel" id="from_mobile" name="from_mobile" placeholder="Enter Your Mobile Number" required>
    </div>

    <div class="form-group">
        <label for="from_university">Select University</label>
        <select id="from_university" name="from_university" required>
            <option value="" disabled selected>Select University</option>
            <option value="Shubharti University">Shubharti University</option>
            <option value="Suresh Gyan University">Suresh Gyan University</option>
            <option value="Manglyatam University (Open)">Manglyatam University (Open)</option>
            <option value="Manglyatam University (Regular)">Manglyatam University (Regular)</option>
            <option value="CCS University">CCS University</option>
            <option value="NIOS Board">NIOS Board</option>
            <option value="CBSE Board">CBSE Board</option>
            <option value="">Others</option>
        </select>
    </div>

    <div class="form-group">
        <label for="from_course">Select Course</label>
        <select id="from_course" name="from_course" required>
            <option value="" disabled selected>Select Course</option>
            <option value="B.Ed.">B.Ed. (Bachelor of Education)</option>
            <option value="B.A.">B.A. (Bachelor of Arts)</option>
            <option value="B.Com.">B.Com. (Bachelor of Commerce)</option>
            <option value="BBA">BBA (Bachelor of Business Administration)</option>
            <option value="BCA">BCA (Bachelor of Computer Applications)</option>
            <option value="M.A.">M.A. (Master of Arts)</option>
            <option value="M.Com.">M.Com. (Master of Commerce)</option>
            <option value="MBA">MBA (Master of Business Administration)</option>
            <option value="MBA">Coaching Classes</option>
            <option value="MBA">Computer Classes</option>
            <option value="MBA">English Speaking </option>
            <option value="MBA">Others</option>
        </select>
    </div>

    <div class="form-group">
        <label for="message">Your Message</label>
        <textarea id="message" name="message" rows="5" placeholder="Enter your message here" required></textarea>
    </div>

    <div class="form-group">
        <button type="submit">Send Message</button>
    </div>
</>
    
<style>
    /* General form styling */
    .contact-form {
        width: 100%;
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        font-size: 1rem;
        color: #333;
        margin-bottom: 5px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
        border-color: #4CAF50;
        outline: none;
    }

    .form-group button {
        width: 100%;
        padding: 14px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1.1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-group button:hover {
        background-color: #45a049;
    }

    .form-group button:active {
        background-color: #388e3c;
    }

    /* Responsive styling for small screens */
    @media (max-width: 600px) {
        .contact-form {
            padding: 15px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            padding: 10px;
            font-size: 0.9rem;
        }

        .form-group button {
            padding: 12px;
            font-size: 1rem;
        }
    }
</style>

<script type="text/javascript">
    document.getElementById('contact-form').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent default form submission

        // Prepare the parameters
        const params = {
            from_name: document.querySelector('[name="from_name"]').value,
            from_email: document.querySelector('[name="from_email"]').value,
            from_mobile: document.querySelector('[name="from_mobile"]').value,
            from_university: document.querySelector('[name="from_university"]').value,
            from_course: document.querySelector('[name="from_course"]').value,
            message: document.querySelector('[name="message"]').value,
        };

        // Send email using EmailJS
        emailjs.send('service_hpi8edj', 'template_lzpljxq', params)
            .then(function (response) {
                alert('Message sent successfully!'); // Success message
                document.getElementById('contact-form').reset(); // Reset form fields
            }, function (error) {
                alert('Failed to send message. Please try again later.'); // Error message
            });
    });
</script>
            <h3>Our Location</h3>
            <div class="map-container">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3500.057150423253!2d77.34124317451233!3d28.687936981564366!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cfa52007d260d%3A0x817f8a8a87bdbce3!2sPerfection%20Institute%20Of%20Education!5e0!3m2!1sen!2sin!4v1729527337619!5m2!1sen!2sin" 
                        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </section>

        <!-- EmailJS Form Submission Script -->
        <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
<script>
    emailjs.init("wwIOv1v8ozZV-Q5B5");

        
            document.getElementById('contact-form').addEventListener('submit', function (event) {
                event.preventDefault(); // Prevent default form submission

                // Prepare the parameters
                const params = {
                    from_name: document.querySelector('[name="from_name"]').value,
                    from_email: document.querySelector('[name="from_email"]').value,
                    from_mobile: document.querySelector('[name="from_mobile"]').value,
                    from_university: document.querySelector('[name="from_university"]').value,
                    from_course: document.querySelector('[name="from_course"]').value,
                    message: document.querySelector('[name="message"]').value,
                };

                // Send email using EmailJS
                emailjs.send('service_hpi8edj', 'template_lzpljxq', params)
                    .then(function (response) {
                        alert('Message sent successfully!'); // Success message
                        document.getElementById('contact-form').reset(); // Reset form fields
                    }, function (error) {
                        alert('Failed to send message. Please try again later.'); // Error message
                    });
            });
</script>
    </main>
</asp:Content>
