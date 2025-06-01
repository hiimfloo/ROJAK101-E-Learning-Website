using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtFeedback.Text))
        {
            lblMessage.Text = "❌ Please enter your feedback.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        try
        {
            string userId = Session["UserID"] != null ? Session["UserID"].ToString() : "0";
            SqlDataSource1.InsertParameters["UserID"].DefaultValue = userId;
            SqlDataSource1.InsertParameters["DateCreated"].DefaultValue = DateTime.Now.ToString();
            SqlDataSource1.InsertParameters["Status"].DefaultValue = "Pending";
            SqlDataSource1.InsertParameters["Message"].DefaultValue = txtFeedback.Text.Trim();
            SqlDataSource1.InsertParameters["IsTestimonial"].DefaultValue = "False";

            SqlDataSource1.Insert();

            txtFeedback.Text = "";
            lblMessage.Text = "✅ Thank you for your feedback!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "❌ Something went wrong: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}