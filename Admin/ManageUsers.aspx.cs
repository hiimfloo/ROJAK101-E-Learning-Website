using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserType"] == null || !Session["UserType"].ToString().Equals("admin"))
        {
            Response.Redirect("~/Login.aspx");
        }

        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    private void BindGrid()
    {
        string query = "SELECT * FROM Users WHERE 1=1";

        if (!string.IsNullOrWhiteSpace(txtSearch.Text))
        {
            query += " AND (FirstName LIKE @Search OR LastName LIKE @Search OR Email LIKE @Search OR Nationality LIKE @Search)";
        }

        if (!string.IsNullOrEmpty(ddlSortBy.SelectedValue))
        {
            query += " ORDER BY " + ddlSortBy.SelectedValue;
        }

        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand(query, con);

            if (!string.IsNullOrWhiteSpace(txtSearch.Text))
            {
                cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text.Trim() + "%");
            }

            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            System.Data.DataTable dt = new System.Data.DataTable();
            adapter.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int userId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();
            SqlTransaction transaction = con.BeginTransaction();

            try
            {
                SqlCommand deleteResultsCmd = new SqlCommand("DELETE FROM Results WHERE UserID = @UserID", con, transaction);
                deleteResultsCmd.Parameters.AddWithValue("@UserID", userId);
                deleteResultsCmd.ExecuteNonQuery();

                SqlCommand deleteUserCmd = new SqlCommand("DELETE FROM Users WHERE UserID = @UserID", con, transaction);
                deleteUserCmd.Parameters.AddWithValue("@UserID", userId);
                deleteUserCmd.ExecuteNonQuery();

                transaction.Commit();
                BindGrid();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('❌ Deletion failed: " + ex.Message.Replace("'", "\\'") + "');", true);
            }
        }

        e.Cancel = true;
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGrid(); // Refresh to show editable row
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid(); // Cancel editing
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int userId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        GridViewRow row = GridView1.Rows[e.RowIndex];

        string firstName = ((TextBox)row.Cells[1].Controls[0]).Text;
        string lastName = ((TextBox)row.Cells[2].Controls[0]).Text;
        string nationality = ((TextBox)row.Cells[3].Controls[0]).Text;
        string email = ((TextBox)row.Cells[4].Controls[0]).Text;
        string password = ((TextBox)row.Cells[5].Controls[0]).Text;
        string userType = ((DropDownList)row.FindControl("DropDownList1")).SelectedValue;

        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = @"UPDATE Users 
                         SET FirstName = @FirstName, LastName = @LastName, Nationality = @Nationality, 
                             Email = @Email, Password = @Password, UserType = @UserType 
                         WHERE UserID = @UserID";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@FirstName", firstName);
            cmd.Parameters.AddWithValue("@LastName", lastName);
            cmd.Parameters.AddWithValue("@Nationality", nationality);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@UserType", userType);
            cmd.Parameters.AddWithValue("@UserID", userId);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        GridView1.EditIndex = -1;
        BindGrid(); // Reload grid after update
    }
}
