using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid(""); // No sorting initially
        }
    }

    protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sortField = ddlSortBy.SelectedValue;
        string query = "SELECT * FROM Results";

        if (!string.IsNullOrEmpty(sortField))
        {
            query += " ORDER BY " + sortField + " DESC";
        }

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvResults.DataSource = dt;
            gvResults.DataBind();
        }
    }


    private void BindGrid(string sortField)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string query = "SELECT * FROM Results";

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (!string.IsNullOrEmpty(sortField))
                {
                    dt.DefaultView.Sort = sortField + " DESC";
                }

                gvResults.DataSource = dt;
                gvResults.DataBind();
            }
        }
    }
}