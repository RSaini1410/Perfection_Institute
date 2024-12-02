<%@ Page Title="Examination Form" Language="vb" AutoEventWireup="True" MasterPageFile="~/Site.Master" CodeBehind="Examination.aspx.vb" Inherits="Perfection_Institute.Examination" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #36D1DC, #5B86E5);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            color: #fff;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        :root {
    --color1: #36D1DC;
    --color2: #5B86E5;
    --color3: #FF5F6D;
    --text-color-light: #ffffff;
    --text-color-dark: #000000;
}

.form-container {
    background: linear-gradient(135deg, var(--color1), var(--color2), var(--color3));
    background-size: 400% 400%;
    animation: animatedBackground 10s ease infinite;
    color: var(--text-color-light); /* Initial font color */
    transition: color 0.5s ease; /* Smooth font color transition */
    margin: 50px auto;
    width: 90%;
    max-width: 700px;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    font-size: 1.2rem;
    font-family: Arial, sans-serif;
    text-align: left;
}

/* Keyframes for animated background */
@keyframes animatedBackground {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

/* Adjust font color based on background brightness */
/*@keyframes fontColorShift {
    0% {
        color: var(--text-color-light);
    }
    50% {
        color: var(--text-color-dark);
    }
    100% {
        color: var(--text-color-light);
    }
}*/

.form-container {
    animation: animatedBackground 10s ease infinite, fontColorShift 10s ease infinite;
}
hr {
    border: 0;
    height: 2px;
    background: #fff; /* Color of the line */
    margin: 20px 0; /* Space before and after the line */
}

/* Add a smooth glow effect to the text for a stylish look */
.form-container h1, 
.form-container h3, 
.form-container label {
    text-shadow: 0px 0px 10px rgba(255, 255, 255, 0.6);
}
        .form-container h1, .form-container h3 {
            text-align: center;
            color: #333;
        }

        .form-field {
            margin-bottom: 20px;
        }

        .form-field label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"], input[type="number"], input[type="file"], textarea, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .error-message {
            color: #FF5F6D;
            font-size: 16px;
            margin-top: 10px;
        }


        .form-button {
            background-color: #5B86E5;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-button:hover {
            background-color: #36D1DC;
        }
        #clientDateTime {
    font-size: 20px;
    color: #00008B;
    font-weight: bold;
    text-shadow: 0 0 5px rgba(255, 255, 255, 0.7);
    animation: glow 1.5s infinite alternate;
}

@keyframes glow {
    from {
        text-shadow: 0 0 5px rgba(255, 255, 255, 0.7), 0 0 10px #001F3F ;
    }
    to {
        text-shadow: 0 0 10px rgba(255, 255, 255, 1), 0 0 20px #001F3F ;
    }
}

    /* Progress Bar Styles */
        .progress-container {
            background: #f3f3f3;
            border-radius: 12px;
            margin: 20px auto;
            height: 20px;
            width: 90%;
            max-width: 700px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .progress-bar {
            height: 100%;
            width: 0%;
            background: linear-gradient(135deg, #36D1DC, #5B86E5);
            border-radius: 12px 0 0 12px;
            transition: width 0.3s ease;
        }
        
    </style>
     

    <div class="form-field">
    <label for="dateTimeDisplay"></label>
    <asp:Label ID="lblDateTime" runat="server" CssClass="form-input"></asp:Label>
    <span id="clientDateTime" style="font-size: 18px; display: block; color: #FF5F6D; margin-top: 10px;"></span>
</div>
    <!-- Examination Form -->
    <div class="form-container">
        <h1><u>Examination Form</u></h1>

        <!-- Section: Personal Details -->
        <div class="form-section">
           
           <%-- <!-- Application Number -->
            <div class="form-field">
                <label for="applicationNo">Application No.</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
            </div>--%>

            <div class="form-field">
    <label for="applicationNo">Application No.</label>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" ReadOnly="true" EnableViewState="true"></asp:TextBox>
</div>

            <hr>
            <!-- Student Name -->
             <h3><u>Personal Details</u></h3>
            <div class="form-field">
                <label for="studentName">Student Name</label>
                <asp:TextBox ID="Textbox2" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="StudentNameValidator" runat="server" 
                    ControlToValidate="Textbox2" ErrorMessage="Student Name is required." 
                    CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <!-- Father Name -->
            <div class="form-field">
                <label for="FatherName">Father Name</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FatherNameValidator" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="Father Name is required." 
                    CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <!-- Mother Name -->
            <div class="form-field">
                <label for="MotherName">Mother Name</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="MotherNameValidator" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="Mother Name is required." 
                    CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <!-- Address -->
            <div class="form-field">
                <label for="Address">Address</label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="AddressValidator" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="Address is required." 
                    CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

        <div class="form-field">
        <label for="gender">Gender</label>
        <asp:DropDownList ID="gender" runat="server" CssClass="form-input">
            <asp:ListItem Text="Select" Value=""></asp:ListItem>
            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="genderFieldValidator" runat="server" 
            ControlToValidate="gender" InitialValue="" ErrorMessage="Gender is required." 
            CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
      <!-- Date of Birth Field -->
<!-- Date of Birth Field -->
<div class="form-field">
    <label for="DOB">Date of Birth</label>
    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-input" TextMode="Date" OnInput="calculateAge(this.value)"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox6" ErrorMessage="Date of birth is required." 
        CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
</div>

<!-- Age Field -->
<div class="form-field">
    <label for="age">Age</label>
    <asp:TextBox ID="TextBoxAge" runat="server" CssClass="form-input" ReadOnly="true"></asp:TextBox>
</div>

<script type="text/javascript">
    // Function to calculate age
    function calculateAge(dob) {
        const dobDate = new Date(dob);
        const today = new Date();

        // Check if the date is valid
        if (isNaN(dobDate.getTime())) {
            document.getElementById('<%= TextBoxAge.ClientID %>').value = '';
            return;
        }

        let age = today.getFullYear() - dobDate.getFullYear();
        const monthDiff = today.getMonth() - dobDate.getMonth();
        const dayDiff = today.getDate() - dobDate.getDate();

        // Adjust the age if the current date is before the birthday
        if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
            age--;
        }

        // Update the age field
        document.getElementById('<%= TextBoxAge.ClientID %>').value = age >= 0 ? age + " Years" : '';
    }
</script>


</div>
       

            <!-- Mobile -->
            <div class="form-field">
                <label for="Mobile">Mobile</label>
                <asp:TextBox ID="MobileNo" runat="server" CssClass="form-input"></asp:TextBox>
            <asp:RegularExpressionValidator ID="MobileNoValidator" runat="server" 
                ControlToValidate="MobileNo" ErrorMessage="Enter a valid 10-digit mobile number." 
                ValidationExpression="^\d{10}$" CssClass="error-message" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="MobileNoRequired" runat="server" 
                ControlToValidate="MobileNo" ErrorMessage="Mobile number is required." 
                CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>

            </div>
            <!-- Email -->
            <div class="form-field">
                <label for="Email">Email</label>
                <asp:TextBox ID="EmailId" runat="server" CssClass="form-input"></asp:TextBox>
            <asp:RegularExpressionValidator ID="EmailValidator" runat="server" 
                ControlToValidate="EmailId" ErrorMessage="Enter a valid email address." 
                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                CssClass="error-message" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                ControlToValidate="EmailId" ErrorMessage="Email ID is required." 
                CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>

            </div>
        
        <hr />
        <!-- Section: Course Information -->
        <div class="form-section">
            <h3><u>Course Information</u></h3>
            <!-- Course -->
            <div class="form-field">
                <label for="course">Course</label>
                <asp:DropDownList ID="Course" runat="server" CssClass="form-input">
                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                <asp:ListItem Text="Computer Course" Value="Computer Course"></asp:ListItem>
                <asp:ListItem Text="Coaching Course" Value="Coaching Course"></asp:ListItem>
                <asp:ListItem Text="English Speaking" Value="English Speaking"></asp:ListItem>
                <asp:ListItem Text="Admission Related" Value="Admission Related"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="CourseValidator" runat="server" 
                ControlToValidate="Course" InitialValue="" ErrorMessage="Course selection is required." 
                CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
</div>
            </div>
            <!-- Course Name -->
            <div class="form-field">
                <label for="CourseName">Course Name</label>
                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox9" ErrorMessage="Course Name is required." 
                    CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
    
<hr />
        <!-- Section: Payment Details -->
        <div class="form-section">
            <h3><u>Payment Details</u></h3>
            <!-- Fees Amount -->
            <div class="form-field">
                <label for="feesAmount">Examination Fees Amount (INR)</label>
                <asp:TextBox ID="feesAmount" runat="server" CssClass="form-input" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FeesAmountValidator" runat="server" 
                    ControlToValidate="feesAmount" ErrorMessage="Fees Amount is required." 
                    CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-field">
    <label for="paymentType">Payment Type</label>
    <asp:DropDownList ID="PaymentType" runat="server" CssClass="form-input">
                <asp:ListItem Text="Select Payment Type" Value=""></asp:ListItem>
                <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                <asp:ListItem Text="Paytm" Value="Paytm"></asp:ListItem>
                <asp:ListItem Text="PhonePe" Value="PhonePe"></asp:ListItem>
                <asp:ListItem Text="GPay" Value="GPay"></asp:ListItem>
                <asp:ListItem Text="NEFT" Value="NEFT"></asp:ListItem>
                <asp:ListItem Text="Direct Transfer Bank" Value="Direct Transfer Bank"></asp:ListItem>
                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="PaymentTypeValidator" runat="server" 
                ControlToValidate="PaymentType" InitialValue="" ErrorMessage="Payment type is required." 
                CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
</div>
</div>
        
        <script>
            // Keep track of uploaded file data
            const uploadedFiles = new Map();

            function validateFileUpload(inputElement, errorElementId) {
                const file = inputElement.files[0]; // Get the uploaded file
                const errorElement = document.getElementById(errorElementId);

                if (file) {
                    const fileKey = `${file.name}-${file.size}`; // Create a unique key based on name and size

                    // Check if the file has already been uploaded
                    if (uploadedFiles.has(fileKey)) {
                        errorElement.textContent = "This file has already been uploaded.";
                        inputElement.value = ""; // Clear the input to reset the uploaded file
                    } else {
                        // Mark the file as uploaded
                        uploadedFiles.set(fileKey, true);
                        errorElement.textContent = ""; // Clear any previous error message
                    }
                }
            }
        </script>
        
        <!-- Transaction Reference -->
    <div class="form-field">
        <label for="transactionRef">Transaction Reference No/ Cash:</label>
        <asp:TextBox ID="TextBox10" runat="server" CssClass="form-input"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
    ControlToValidate="TextBox10" ErrorMessage="Transaction Reference No. is required." 
    CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
   <div class="form-field">
    <label for="FileUploadPayment">Upload Payment Screenshot</label>
    <asp:FileUpload ID="FileUploadPayment" runat="server" accept="image/*" />
    <div class="preview-container" id="paymentScreenshotPreview"></div>
    <span id="paymentScreenshotError" class="error-message"></span>
</div>

<div class="form-field">
    <label for="FileUploadPhoto">Photo Upload</label>
    <asp:FileUpload ID="FileUploadPhoto" runat="server" accept="image/*" />
    <div class="preview-container" id="photoUploadPreview"></div>
    <span id="photoUploadError" class="error-message"></span>
</div>

<div class="form-field">
    <label for="FileUploadAadhar">Aadhar Card Front</label>
    <asp:FileUpload ID="FileUploadAadhar" runat="server" accept="image/*" />
    <div class="preview-container" id="aadharUploadPreview"></div>
    <span id="aadharUploadError" class="error-message"></span>
</div>

<div class="form-field">
    <label for="FileUploadAddress">Aadhar Address Proof</label>
    <asp:FileUpload ID="FileUploadAddress" runat="server" accept="image/*" />
    <div class="preview-container" id="aadharAddressUploadPreview"></div>
    <span id="aadharAddressUploadError" class="error-message"></span>
</div>


        <script>
            // Function to handle file preview and validate file size
            function handleFilePreviewAndValidation(input, previewId) {
                const file = input.files[0];
                const previewContainer = document.getElementById(previewId);

                // Clear preview if no file is selected
                if (!file) {
                    previewContainer.innerHTML = '';
                    return;
                }

                // Validate file size (2MB limit)
                if (file.size > 2 * 1024 * 1024) {
                    alert('File size must be less than 2MB');
                    input.value = ''; // Clear the input field
                    previewContainer.innerHTML = ''; // Clear the preview
                    return;
                }

                // Display file preview
                const reader = new FileReader();
                reader.onload = function (e) {
                    previewContainer.innerHTML = `<img src="${e.target.result}" alt="Preview" style="max-width: 200px; max-height: 200px;" />`;
                };
                reader.readAsDataURL(file);
            }

            // File input elements and corresponding preview container IDs
            const fileInputs = [
                { id: '<%= FileUploadPayment.ClientID %>', previewId: 'paymentScreenshotPreview' },
        { id: '<%= FileUploadPhoto.ClientID %>', previewId: 'photoUploadPreview' },
        { id: '<%= FileUploadAadhar.ClientID %>', previewId: 'aadharUploadPreview' },
        { id: '<%= FileUploadAddress.ClientID %>', previewId: 'aadharAddressUploadPreview' }
            ];

            // Attach event listeners for file inputs
            fileInputs.forEach(input => {
                const element = document.getElementById(input.id);
                if (element) {
                    element.addEventListener('change', function () {
                        handleFilePreviewAndValidation(this, input.previewId);
                    });
                }
            });

            // Form validation and submission handler
            document.getElementById('submitButton').addEventListener('click', function (e) {
                e.preventDefault(); // Prevent default form submission for validation

                if (validateForm()) {
                    alert('Form submitted successfully!');
                }
            });

            // Dummy form validation function (extend with custom logic if needed)
            function validateForm() {
                // Additional form-level validation logic can be added here
                return true; // Assuming valid form for demonstration
            }
        </script>
        <script>
            // Set to track uploaded file hashes for duplicate detection
            const uploadedFileHashes = new Set();

            // Function to generate a unique hash for the file based on its name and size
            function generateFileHash(file) {
                return `${file.name}_${file.size}`;
            }

            // Function to validate duplicate files in real-time
            function handleDuplicateFileValidation(input, errorId) {
                const file = input.files[0];
                const errorContainer = document.getElementById(errorId);

                // Clear any previous error message
                errorContainer.textContent = '';

                // If no file is selected, return
                if (!file) return;

                // Generate file hash and check for duplicates
                const fileHash = generateFileHash(file);
                if (uploadedFileHashes.has(fileHash)) {
                    // Show error for duplicate file
                    errorContainer.textContent = 'Error: Duplicate file detected. Please upload a different file.';
                    input.value = ''; // Clear the input field to prevent upload
                    return;
                }

                // Add the file hash to the set to track it
                uploadedFileHashes.add(fileHash);
            }

            // Example usage with event listeners for file inputs
            document.getElementById('<%= FileUploadPayment.ClientID %>').addEventListener('change', function () {
                handleDuplicateFileValidation(this, 'paymentScreenshotError');
            });

            document.getElementById('<%= FileUploadPhoto.ClientID %>').addEventListener('change', function () {
    handleDuplicateFileValidation(this, 'photoUploadError');
});

document.getElementById('<%= FileUploadAadhar.ClientID %>').addEventListener('change', function () {
    handleDuplicateFileValidation(this, 'aadharUploadError');
});

            document.getElementById('<%= FileUploadAddress.ClientID %>').addEventListener('change', function () {
                handleDuplicateFileValidation(this, 'aadharAddressUploadError');
            });
           
        </script>





        <script>
            function updateDateTime() {
                const now = new Date();

                // Create a unique format for date and time
                const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                const dayName = days[now.getDay()]; // Day name

                const date = now.getDate();
                const monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
                const monthName = monthNames[now.getMonth()]; // Month name

                const year = now.getFullYear();
                const hours = now.getHours() % 12 || 12; // 12-hour format
                const minutes = String(now.getMinutes()).padStart(2, '0'); // Add leading zeros
                const seconds = String(now.getSeconds()).padStart(2, '0'); // Add leading zeros
                const ampm = now.getHours() >= 12 ? 'PM' : 'AM';

                const uniqueDateTime = `${dayName}, ${monthName} ${date}, ${year} ${hours}:${minutes}:${seconds} ${ampm}`;

                // Update the label dynamically
                document.getElementById('clientDateTime').textContent = ` ${uniqueDateTime}`;
            }

            // Call updateDateTime every second
            setInterval(updateDateTime, 1000);

        </script>


        <hr />
                   <!-- Terms and Conditions -->
<div class="form-group">
    
   <asp:CheckBox ID="CheckBox1" runat="server" />
<span style="font-size: 16px;">
    I am responsible for the accuracy of details.
</span>
    <div class="error-message" id="CheckBox1Error" style="color: red; display: none;">You must agree to the terms and conditions.</div>
</div>
        <div class="form-group">
   <asp:CheckBox ID="CheckBox2" runat="server" />
<span style="font-size: 16px;">
    I agree that form approval & admit card generation depend on verification.
</span>
    <div class="error-message" id="CheckBox2Error" style="color: red; display: none;">You must agree to the terms and conditions.</div>
</div>

          <!-- Progress Bar -->
<div class="progress-container">
    <div class="progress-bar" id="progressBar"></div>
</div>
     <!-- Submit Button -->
        <!-- Loader Overlay -->
<div id="loaderOverlay" class="loader-overlay" style="display: none;">
    <div class="loader"></div>
    <p>Please wait, your form is being submitted...</p>
</div>

<style>
/* Loader Overlay */
.loader-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    color: white;
    font-size: 18px;
}

/* Loader Animation */
.loader {
    border: 6px solid #f3f3f3;
    border-top: 6px solid #3498db;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>


        <script>
            function showLoader() {
                document.getElementById('loaderOverlay').style.display = 'flex';
            }
        </script>

    <hr />  
     <div class="button-container">
    <center>     
        <%--<asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="form-button" OnClick="SubmitButton_Click"></asp:Button>--%>

        <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="form-button" 
    OnClick="SubmitButton_Click" OnClientClick="showLoader(); return true;">
</asp:Button>
     </center>
     </div>
</div>
  <hr />

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const formFields = Array.from(document.querySelectorAll('.form-container input, .form-container select, .form-container textarea'));
            const progressBar = document.getElementById('progressBar');

            const updateProgressBar = () => {
                const totalFields = formFields.length;
                let filledFields = 0;

                formFields.forEach(field => {
                    if ((field.type === 'checkbox' && field.checked) ||
                        (field.type !== 'checkbox' && field.value.trim() !== '')) {
                        filledFields++;
                    }
                });

                const progress = Math.round((filledFields / totalFields) * 100);
                progressBar.style.width = `${progress}%`;
            };

            formFields.forEach(field => {
                field.addEventListener('input', updateProgressBar);
                field.addEventListener('change', updateProgressBar);
            });

            updateProgressBar();
        });
    </script>

</asp:Content>

