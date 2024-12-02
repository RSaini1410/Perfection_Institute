Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports System.Net.Mail

Public Class Examination
    Inherits System.Web.UI.Page

    Dim tempDir As String = Server.MapPath("~/TempUploads/") ' Ensure this directory exists on the server.

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Ensure the temporary directory exists when the page loads
        If Not Directory.Exists(tempDir) Then
            Directory.CreateDirectory(tempDir)
        End If

        If Not IsPostBack Then
            ' Check if the session has an application number
            If Session("ApplicationNo") IsNot Nothing Then
                ' Retrieve the application number from the session
                TextBox1.Text = Session("ApplicationNo").ToString()
            Else
                ' Generate a new application number if session is empty
                GenerateApplicationNumber()
            End If
        End If
    End Sub

    Private Function SaveFileAsByteArray(fileUpload As FileUpload) As Byte()
        If fileUpload.HasFile Then
            Using inputStream As Stream = fileUpload.PostedFile.InputStream
                Using memoryStream As New MemoryStream()
                    inputStream.CopyTo(memoryStream)
                    Return memoryStream.ToArray() ' Return binary data
                End Using
            End Using
        End If
        Return Nothing ' Return Nothing if no file uploaded
    End Function

    Private Sub GenerateApplicationNumber()
        Try
            Dim latestApplicationNo As Integer

            If Conn11.State = ConnectionState.Closed Then Conn11.Open()

            ' Fetch the latest application number from the database
            Dim query As String = "SELECT MAX(CAST(SUBSTRING(Appl, 5, LEN(Appl)) AS INT)) FROM Appl_Exam"
            Using cmd As New SqlCommand(query, Conn11)
                Dim result = cmd.ExecuteScalar()
                If result IsNot DBNull.Value Then
                    latestApplicationNo = Convert.ToInt32(result) + 1 ' Increment the latest number
                Else
                    latestApplicationNo = 1 ' Start from 1 if no records exist
                End If
            End Using

            ' Format the new application number and display it in TextBox1
            Dim applicationNo As String = "PIE-" & latestApplicationNo.ToString()
            TextBox1.Text = applicationNo
        Catch ex As Exception
            ClientScript.RegisterStartupScript(Me.GetType(), "error", $"alert('Error generating application number: {ex.Message}');", True)
        Finally
            If Conn11.State = ConnectionState.Open Then Conn11.Close()
        End Try

    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs)
        If Not CheckBox1.Checked Then
            ClientScript.RegisterStartupScript(Me.GetType(), "Perfection Institute",
            "alert('You must agree to the terms and conditions (terms-1).');", True)
            Return
        End If

        If Not CheckBox2.Checked Then
            ClientScript.RegisterStartupScript(Me.GetType(), "Perfection Institute",
            "alert('You must agree to the terms and conditions (terms-2).');", True)
            Return
        End If

        Try
            ' Email Sending Code
            Using smtpServer As New SmtpClient("smtp.gmail.com")
                smtpServer.Port = 587
                smtpServer.Credentials = New NetworkCredential("exam.piegzb@gmail.com", "dblu zwgk ujpu hope")
                smtpServer.EnableSsl = True

                Using mailMessage As New MailMessage()
                    mailMessage.From = New MailAddress("exam.piegzb@gmail.com")
                    mailMessage.To.Add("perfection.education@gmail.com")
                    mailMessage.CC.Add(EmailId.Text.Trim())
                    mailMessage.Subject = "Examination Form Submission"
                    mailMessage.Body = "Hello " & Textbox2.Text & "," & vbCrLf &
                "Your form has been submitted successfully." & vbCrLf &
                "Application No:" & TextBox1.Text & vbCrLf &
                ComposeEmailBody()
                    mailMessage.IsBodyHtml = True
                    AttachFiles(mailMessage)
                    smtpServer.Send(mailMessage)
                End Using
            End Using

            ' Database Insertion Code
            If Conn11.State = ConnectionState.Closed Then Conn11.Open()

            Dim query As String = "INSERT INTO Appl_Exam
            ([Date], [Appl], [Stud], [Father], [Mother], [Address], [Gen], [DOB], [Age], [Mobile], [Email], [Course], [CourseName], [Fees], [Ref], [PaymentType], [Screenshot], [Stud_Photo], [Aadhar_Front], [Aadhar_back])
            VALUES (@Date, @Appl, @Stud, @Father, @Mother, @Address, @Gen, @DOB, @Age, @Mobile, @Email, @Course, @CourseName, @Fees, @Ref, @PaymentType, @Screenshot, @Stud_Photo, @Aadhar_Front, @Aadhar_back)"

            Using cmd As New SqlCommand(query, Conn11)
                cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("dd-MM-yyyy"))
                cmd.Parameters.AddWithValue("@Appl", TextBox1.Text.Trim())
                cmd.Parameters.AddWithValue("@Stud", Textbox2.Text.Trim())
                cmd.Parameters.AddWithValue("@Father", TextBox3.Text.Trim())
                cmd.Parameters.AddWithValue("@Mother", TextBox4.Text.Trim())
                cmd.Parameters.AddWithValue("@Address", TextBox5.Text.Trim())
                cmd.Parameters.AddWithValue("@Gen", gender.SelectedValue)
                cmd.Parameters.AddWithValue("@DOB", If(String.IsNullOrEmpty(TextBox6.Text.Trim()), DBNull.Value, Convert.ToDateTime(TextBox6.Text.Trim())))
                cmd.Parameters.AddWithValue("@Age", If(Integer.TryParse(TextBoxAge.Text.Trim(), Nothing), Convert.ToInt32(TextBoxAge.Text.Trim()), DBNull.Value))
                cmd.Parameters.AddWithValue("@Mobile", If(String.IsNullOrEmpty(MobileNo.Text.Trim()), DBNull.Value, MobileNo.Text.Trim()))
                cmd.Parameters.AddWithValue("@Email", EmailId.Text.Trim())
                cmd.Parameters.AddWithValue("@Course", Course.SelectedValue)
                cmd.Parameters.AddWithValue("@CourseName", TextBox9.Text.Trim())
                cmd.Parameters.AddWithValue("@Fees", If(String.IsNullOrEmpty(feesAmount.Text.Trim()), DBNull.Value, Convert.ToDecimal(feesAmount.Text.Trim())))
                cmd.Parameters.AddWithValue("@Ref", TextBox10.Text.Trim())
                cmd.Parameters.AddWithValue("@PaymentType", PaymentType.SelectedValue)
                cmd.Parameters.Add("@Screenshot", SqlDbType.VarBinary).Value = If(SaveFileAsByteArray(FileUploadPayment), DBNull.Value)
                cmd.Parameters.Add("@Stud_Photo", SqlDbType.VarBinary).Value = If(SaveFileAsByteArray(FileUploadPhoto), DBNull.Value)
                cmd.Parameters.Add("@Aadhar_Front", SqlDbType.VarBinary).Value = If(SaveFileAsByteArray(FileUploadAadhar), DBNull.Value)
                cmd.Parameters.Add("@Aadhar_back", SqlDbType.VarBinary).Value = If(SaveFileAsByteArray(FileUploadAddress), DBNull.Value)
                cmd.ExecuteNonQuery()
            End Using

            ' Display success message
            ClientScript.RegisterStartupScript(Me.GetType(), "successMessage",
                "alert('Form submitted successfully!');", True)

            ' Reset form and generate a new application number
            ResetForm()
            GenerateApplicationNumber()
        Catch ex As Exception
            ClientScript.RegisterStartupScript(Me.GetType(), "errorMessage",
                $"alert('An error occurred: {ex.Message}');", True)
        Finally
            If Conn11.State = ConnectionState.Open Then Conn11.Close()
        End Try

    End Sub

    Private Sub AttachFiles(mailMessage As MailMessage)
        Dim tempDir As String = Server.MapPath("~/TempUploads/") ' Ensure this directory exists on the server

        ' Create the directory if it doesn't exist
        If Not System.IO.Directory.Exists(tempDir) Then
            System.IO.Directory.CreateDirectory(tempDir)
        End If
        ' Attach uploaded files
        If FileUploadPayment.HasFile Then
            Dim paymentPath = Path.Combine(tempDir, FileUploadPayment.FileName)
            FileUploadPayment.SaveAs(paymentPath)
            mailMessage.Attachments.Add(New Attachment(paymentPath))
        End If

        If FileUploadPhoto.HasFile Then
            Dim photoPath = Path.Combine(tempDir, FileUploadPhoto.FileName)
            FileUploadPhoto.SaveAs(photoPath)
            mailMessage.Attachments.Add(New Attachment(photoPath))
        End If

        If FileUploadAadhar.HasFile Then
            Dim aadharPath = Path.Combine(tempDir, FileUploadAadhar.FileName)
            FileUploadAadhar.SaveAs(aadharPath)
            mailMessage.Attachments.Add(New Attachment(aadharPath))
        End If

        If FileUploadAddress.HasFile Then
            Dim addressPath = Path.Combine(tempDir, FileUploadAddress.FileName)
            FileUploadAddress.SaveAs(addressPath)
            mailMessage.Attachments.Add(New Attachment(addressPath))
        End If
    End Sub

    ' Function to compose the email body
    Private Function ComposeEmailBody() As String
        Dim body As New StringBuilder()

        ' Start HTML document with styling and animations
        body.Append("<html>")
        body.Append("<head>")
        body.Append("<style>")
        body.Append("body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f9; color: #2C3E50; }")
        body.Append("h1, h2 { color: #34495e; text-align: center; margin-bottom: 10px; }")
        body.Append("h1 { font-size: 28px; animation: fadeIn 1.5s ease-in-out; }")
        body.Append("h2 { font-size: 22px; color: #16a085; }")
        body.Append("p { font-size: 16px; line-height: 1.5; margin: 5px 0; }")
        body.Append("table { width: 100%; border-collapse: collapse; margin: 20px 0; }")
        body.Append("th, td { padding: 12px; text-align: left; border: 1px solid #ddd; }")
        body.Append("th { background-color: #2980b9; color: white; font-size: 16px; }")
        body.Append("tr:nth-child(even) { background-color: #ecf0f1; }")
        body.Append(".section { margin-bottom: 20px; padding: 15px; background-color: #fff; border-radius: 10px; box-shadow: 0 3px 6px rgba(0,0,0,0.1); animation: slideIn 1.5s ease; }")
        body.Append(".footer { text-align: center; font-size: 14px; color: #7f8c8d; margin-top: 20px; }")
        body.Append("@keyframes fadeIn { 0% { opacity: 0; } 100% { opacity: 1; } }")
        body.Append("@keyframes slideIn { 0% { transform: translateY(20px); opacity: 0; } 100% { transform: translateY(0); opacity: 1; } }")
        body.Append("</style>")
        body.Append("</head>")
        body.Append("<body>")

        ' Header Section
        body.Append("<h1>Examination Form Submission Details</h1>")
        body.Append("<hr />")

        ' Personal Details Section
        body.Append("<div class='section'>")
        body.Append("<h2><u>Personal Details</u></h2>")
        body.Append("<table>")
        body.Append("<tr><th>Application No</th><td>" & TextBox1.Text & "</td></tr>")
        body.Append("<tr><th>Student Name</th><td>" & Textbox2.Text & "</td></tr>")
        body.Append("<tr><th>Father Name</th><td>" & TextBox3.Text & "</td></tr>")
        body.Append("<tr><th>Mother Name</th><td>" & TextBox4.Text & "</td></tr>")
        body.Append("<tr><th>Address</th><td>" & TextBox5.Text & "</td></tr>")
        body.Append("<tr><th>Gender</th><td>" & gender.SelectedValue & "</td></tr>")
        body.Append("<tr><th>Date of Birth</th><td>" & TextBox6.Text & "</td></tr>")
        body.Append("<tr><th>Mobile</th><td>" & MobileNo.Text & "</td></tr>")
        body.Append("<tr><th>Email</th><td>" & EmailId.Text & "</td></tr>")
        body.Append("</table>")
        body.Append("</div>")

        ' Course Information Section
        body.Append("<div class='section'>")
        body.Append("<h2><u>Course Information</u></h2>")
        body.Append("<table>")
        body.Append("<tr><th>Course</th><td>" & Course.SelectedValue & "</td></tr>")
        body.Append("<tr><th>Course Name</th><td>" & TextBox9.Text & "</td></tr>")
        body.Append("</table>")
        body.Append("</div>")

        ' Payment Details Section
        body.Append("<div class='section'>")
        body.Append("<h2><u>Payment Details</u></h2>")
        body.Append("<table>")
        body.Append("<tr><th>Examination Fees Amount</th><td>" & feesAmount.Text & "</td></tr>")
        body.Append("<tr><th>Payment Type</th><td>" & PaymentType.SelectedValue & "</td></tr>")
        body.Append("<tr><th>Transaction Reference No</th><td>" & TextBox10.Text & "</td></tr>")
        body.Append("</table>")
        body.Append("</div>")

        ' Terms and Conditions Section
        body.Append("<div class='section'>")
        body.Append("<h2><u>Agreement</u></h2>")
        body.Append("<table>")
        body.Append("<tr><th>Declaration Agreement</th><td>" & If(CheckBox1.Checked, "Agreed", "Not Agreed") & "</td></tr>")
        body.Append("<tr><th>Terms and Conditions</th><td>" & If(CheckBox2.Checked, "Agreed", "Not Agreed") & "</td></tr>")
        body.Append("</table>")
        body.Append("</div>")

        ' Footer Section
        body.Append("<hr />")
        body.Append("<p class='footer'>This is a system-generated email. Please do not reply.</p>")

        ' End HTML document
        body.Append("</body>")
        body.Append("</html>")

        ' Return the formatted HTML body
        Return body.ToString()
    End Function

    Private Sub CleanupTempFiles(tempDir As String)
        Try
            Dim dirInfo As New System.IO.DirectoryInfo(tempDir)
            For Each file As System.IO.FileInfo In dirInfo.GetFiles()
                file.Delete()
            Next
        Catch ex As Exception
            ' Log cleanup errors, if any
        End Try
    End Sub

    ' Reset Form Fields
    Private Sub ResetForm()
        Textbox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox5.Text = ""
        TextBox6.Text = ""
        TextBoxAge.Text = ""
        MobileNo.Text = ""
        EmailId.Text = ""
        TextBox9.Text = ""
        feesAmount.Text = ""
        TextBox10.Text = ""
        gender.SelectedIndex = 0
        Course.SelectedIndex = 0
        PaymentType.SelectedIndex = 0
        CheckBox1.Checked = False
        CheckBox2.Checked = False
        FileUploadPayment.Attributes.Clear()
        FileUploadPhoto.Attributes.Clear()
        FileUploadAadhar.Attributes.Clear()
        FileUploadAddress.Attributes.Clear()
    End Sub

End Class