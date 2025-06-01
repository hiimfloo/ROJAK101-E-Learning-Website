<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
   
    <link href="css/Contact.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contact-wrapper">
        <div class="contact-left">
            <img src="images/image%2015.png"alt="Contact Illustration" />
            
        </div>
        <div class="contact-right">
            <h2>Contact Us</h2>
            <div class="contact-item">
                <i class="fas fa-envelope"></i>
                <span>rojak101@gmail.com</span>
            </div>
            <div class="contact-item">
                <i class="fas fa-phone"></i>
                <span>+6 03 8996 1000 (Ext. 5831)</span>
            </div>
        </div>
    </div>
</asp:Content>
