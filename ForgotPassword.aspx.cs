using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void btnReset_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string newPassword = txtPassword.Text.Trim();
        string confirmPassword = txtConfirmPassword.Text.Trim();

        if (!chkTerms.Checked)
        {
            Label1.Text = "Please check the box to proceed.";
            return;
        }

        if (newPassword != confirmPassword)
        {
            Label1.Text = "Passwords do not match.";
            return;
        }

        string connStr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "UPDATE Users SET Password = @Password WHERE Email = @Email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Password", newPassword);
            cmd.Parameters.AddWithValue("@Email", email);

            con.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            con.Close();

            if (rowsAffected > 0)
            {
                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "Password reset successfully!";
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Email not found.";
            }
        }
    }

}