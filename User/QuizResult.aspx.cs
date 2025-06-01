using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_QuizResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string score = Request.QueryString["score"];
            ltFinalScore.Text = "<div class='score'>You scored " + score + " out of 10.</div>";

            SaveQuizResult(Convert.ToInt32(score));
        }
    }

    private void SaveQuizResult(int score)
    {
        if (Session["UserID"] == null)
            return;

        int userId = Convert.ToInt32(Session["UserID"]);
        int quizId = 1; // or whatever your quiz ID is

        int nextResultID = GetNextResultID(); // ✅ get the next available ResultID

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string insert = "INSERT INTO Results (ResultID, UserID, QuizID, Score, DateAttempted) VALUES (@ResultID, @UserID, @QuizID, @Score, @DateAttempted)";
            using (SqlCommand cmd = new SqlCommand(insert, conn))
            {
                cmd.Parameters.AddWithValue("@ResultID", nextResultID);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@QuizID", quizId);
                cmd.Parameters.AddWithValue("@Score", score);
                cmd.Parameters.AddWithValue("@DateAttempted", DateTime.Now);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
    private int GetNextResultID()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string query = "SELECT ISNULL(MAX(ResultID), 0) + 1 FROM Results";
            SqlCommand cmd = new SqlCommand(query, conn);
            return (int)cmd.ExecuteScalar();
        }
    }

}
