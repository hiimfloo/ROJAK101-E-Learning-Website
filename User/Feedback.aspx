<%@ Page Title="Contact&Feedback" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/Feedback.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contact-wrapper">
        <div class="contact-left">
            <img src="../images/image%2015.png"alt="Contact Illustration" />
            
        </div>
        <div class="contact-right">
            <h2>Contact Us</h2>
            <div class="contact-item">
                <i class="fas fa-envelope"></i>
                <span>xxxxxxxxx@gmail.com</span>
            </div>
            <div class="contact-item">
                <i class="fas fa-phone"></i>
                <span>+6 03 8996 1000 (Ext. 5831)</span>
            </div>
        </div>
    </div>

    <!-- Feedback Section -->
    <div class="feedback-wrapper">
        <h2>Leave us a Feedback!</h2>
        <div class="feedback-form">
            <asp:TextBox ID="txtFeedback" runat="server" CssClass="feedback-textbox" TextMode="MultiLine" placeholder="Type your feedback..."></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="feedback-submit" />
           <asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO [Feedback] ([UserID], [DateCreated], [Status], [Message], [IsTestimonial]) 
                   VALUES (@UserID, @DateCreated, @Status, @Message, @IsTestimonial)"
    SelectCommand="SELECT * FROM [Feedback]"
    UpdateCommand="UPDATE [Feedback] SET [UserID] = @UserID, [DateCreated] = @DateCreated, [Status] = @Status, [Message] = @Message, [IsTestimonial] = @IsTestimonial WHERE [FeedbackID] = @FeedbackID"
    DeleteCommand="DELETE FROM [Feedback] WHERE [FeedbackID] = @FeedbackID">
    
    <InsertParameters>
        <asp:Parameter Name="UserID" Type="Int32" />
        <asp:Parameter Name="DateCreated" Type="DateTime" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="Message" Type="String" />
        <asp:Parameter Name="IsTestimonial" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="UserID" Type="Int32" />
        <asp:Parameter Name="DateCreated" Type="DateTime" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="Message" Type="String" />
        <asp:Parameter Name="IsTestimonial" Type="Boolean" />
        <asp:Parameter Name="FeedbackID" Type="Int32" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="FeedbackID" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>
            <asp:Label ID="lblMessage" runat="server" CssClass="success-message" />
        </div>
    </div>
</asp:Content>
