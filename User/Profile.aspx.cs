using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadNationalities();
            LoadUserData();
            ViewState["OriginalEmail"] = Session["email"] == null ? "" : Session["email"].ToString();
        }
    }

    private void LoadUserData()
    {
        if (Session["email"] == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }

        string email = Session["email"].ToString();
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT FirstName, LastName, Nationality, Email FROM Users WHERE Email = @Email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", email);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtFirstName.Text = reader["FirstName"].ToString();
                txtLastName.Text = reader["LastName"].ToString();
                ddlNationality.SelectedValue = reader["Nationality"].ToString();
                txtEmail.Text = reader["Email"].ToString();
            }
        }
    }

    private void LoadNationalities()
    {
        List<string> countries = new List<string>
        {
            "Malaysia", "Singapore", "Indonesia", "Thailand", "Brunei", "Philippines", "Vietnam", "Cambodia",
            "Myanmar", "Laos", "United States", "India", "China", "Japan", "South Korea", "United Kingdom",
            "Germany", "France", "Australia", "Canada", "New Zealand", "South Africa", "Brazil", "Mexico"
        };

        countries.Sort();
        ddlNationality.Items.Clear();
        ddlNationality.Items.Add(new ListItem("-- Select Nationality --", ""));
        foreach (string country in countries)
        {
            ddlNationality.Items.Add(new ListItem(country, country));
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text != txtConfirmPassword.Text)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('❌ Passwords do not match.');", true);
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string originalEmail = ViewState["OriginalEmail"].ToString();

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query;
            SqlCommand cmd;

            if (!string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                query = @"UPDATE Users SET FirstName=@FirstName, LastName=@LastName, 
                          Nationality=@Nationality, Email=@NewEmail, Password=@Password 
                          WHERE Email=@OriginalEmail";
            }
            else
            {
                query = @"UPDATE Users SET FirstName=@FirstName, LastName=@LastName, 
                          Nationality=@Nationality, Email=@NewEmail 
                          WHERE Email=@OriginalEmail";
            }

            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
            cmd.Parameters.AddWithValue("@Nationality", ddlNationality.SelectedValue);
            cmd.Parameters.AddWithValue("@NewEmail", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@OriginalEmail", originalEmail);

            if (!string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            }

            con.Open();
            int rowsAffected = cmd.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                Session["email"] = txtEmail.Text.Trim();
                Response.Redirect("~/User/Default.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('❌ Update failed.');", true);
            }
        }
    }

    protected void btnDeactivate_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();
            SqlTransaction transaction = con.BeginTransaction();

            try
            {
                // Step 1: Get UserID based on Email
                string getUserIdQuery = "SELECT UserID FROM Users WHERE Email = @Email";
                SqlCommand getUserIdCmd = new SqlCommand(getUserIdQuery, con, transaction);
                getUserIdCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                object userIdObj = getUserIdCmd.ExecuteScalar();

                if (userIdObj == null)
                {
                    throw new Exception("User not found.");
                }

                int userId = Convert.ToInt32(userIdObj);

                // Step 2: Delete associated Results
                string deleteResultsQuery = "DELETE FROM Results WHERE UserID = @UserID";
                SqlCommand deleteResultsCmd = new SqlCommand(deleteResultsQuery, con, transaction);
                deleteResultsCmd.Parameters.AddWithValue("@UserID", userId);
                deleteResultsCmd.ExecuteNonQuery();

                // Step 3: Delete the User
                string deleteUserQuery = "DELETE FROM Users WHERE UserID = @UserID";
                SqlCommand deleteUserCmd = new SqlCommand(deleteUserQuery, con, transaction);
                deleteUserCmd.Parameters.AddWithValue("@UserID", userId);
                deleteUserCmd.ExecuteNonQuery();

                // Commit the transaction
                transaction.Commit();

                Session.Clear();
                Response.Redirect("~/Register.aspx");
            }
            catch (Exception ex)
            {
                // Rollback safely
                try
                {
                    transaction.Rollback();
                }
                catch
                {
                    // Optional: log rollback failure
                }

                string safeMessage = ex.Message.Replace("'", "\\'").Replace(Environment.NewLine, " ");
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('❌ Deactivation failed: " + safeMessage + "');", true);
            }
        }
    }
}