using System;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Redirect non-admins or unauthenticated users to login
        if (Session["UserType"] == null || !Session["UserType"].ToString().Equals("admin"))
        {
            Response.Redirect("~/Login.aspx");
        }


    }

    protected void ApplyFilterSort(object sender, EventArgs e)
    {
        string statusFilter = ddlStatusFilter.SelectedValue;
        string sortBy = ddlSortBy.SelectedValue;

        string query = "SELECT FeedbackID, UserID, DateCreated, [Status], Message, IsTestimonial FROM Feedback WHERE 1=1";

        if (statusFilter != "ALL")
        {
            query += " AND [Status] = @Status";
        }

        if (!string.IsNullOrEmpty(sortBy))
        {
            query += " ORDER BY " + sortBy;
        }

        SqlDataSource1.SelectCommand = query;
        SqlDataSource1.SelectParameters.Clear();

        if (statusFilter != "ALL")
        {
            SqlDataSource1.SelectParameters.Add("Status", statusFilter);
        }

        GridView1.DataBind();
    }
}



