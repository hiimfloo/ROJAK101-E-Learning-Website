using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Admin_Default2 : System.Web.UI.Page
{
    string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserType"] == null || !Session["UserType"].ToString().Equals("admin"))
            Response.Redirect("~/Login.aspx");

        if (!IsPostBack)
        {
            LoadAdminName();
            LoadDashboardData();
        }
    }

    private void LoadAdminName()
    {
        string firstName = Session["FirstName"] != null ? Session["FirstName"].ToString() : "";
        if (!string.IsNullOrEmpty(firstName))
            Label1.Text = firstName;
    }

    private void LoadDashboardData()
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();

            lblTotalUsers.Text = ExecuteScalar(conn, "SELECT COUNT(*) FROM Users").ToString();

            lblLessonsPublished.Text = ExecuteScalar(conn, "SELECT COUNT(*) FROM Lesson").ToString();

            lblFeedbacksReceived.Text = ExecuteScalar(conn, "SELECT COUNT(*) FROM Feedback").ToString();

            // Average Quiz Score
            object avgScore = ExecuteScalar(conn, "SELECT AVG(Score) FROM Results");

            if (avgScore != DBNull.Value)
            {
                double average = Convert.ToDouble(avgScore);
                double percentage = average * 10; 
                lblAvgQuizScore.Text = Math.Round(percentage) + "%";
            }
            else
            {
                lblAvgQuizScore.Text = "0%";
            }

        }
    }

    private object ExecuteScalar(SqlConnection conn, string query)
    {
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            return cmd.ExecuteScalar();
        }
    }

    protected void btnManageLesson_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageContent.aspx");
    }

    protected void btnManageUsers_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageUsers.aspx");
    }



    protected void btnManageQuiz_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageQuiz.aspx");
    }

    protected void btnViewFeedbacks_Click(object sender, EventArgs e)
    {
        Response.Redirect("Viewfeedback.aspx");
    }
}