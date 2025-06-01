using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadTestimonials();
        }
    }

    private void LoadTestimonials()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = @"
                SELECT F.Message, U.FirstName + ' ' + U.LastName AS UserName
                FROM Feedback F
                INNER JOIN Users U ON F.UserID = U.UserID
                WHERE F.IsTestimonial = 1
                ORDER BY F.DateCreated DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptTestimonials.DataSource = dt;
            rptTestimonials.DataBind();
        }
    }

    public string GetCardColor(int index)
    {
        string[] colors = { "green", "blue", "yellow" };
        return colors[index % colors.Length];
    }

    public string GetFooterColor(int index)
    {
        string[] colors = { "green-footer", "blue-footer", "yellow-footer" };
        return colors[index % colors.Length];
    }
}