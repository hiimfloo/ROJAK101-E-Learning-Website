using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class User_Social : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLessonContent(3); // LessonID = 3 for Social
        }
    }

    private void LoadLessonContent(int lessonId)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string query = "SELECT ContentTitle, PracticeText, ImportanceText, AudioPath FROM Content WHERE LessonID = @LessonID ORDER BY OrderNo";

        var dataList = new List<ContentItem>();

        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@LessonID", lessonId);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                dataList.Add(new ContentItem
                {
                    ContentTitle = reader["ContentTitle"].ToString(),
                    PracticeText = reader["PracticeText"].ToString(),
                    ImportanceText = reader["ImportanceText"].ToString(),
                    ImagePath = ResolveUrl(reader["AudioPath"].ToString()) // Use AudioPath to store image path
                });
            }
        }

        rptLessonContent.DataSource = dataList;
        rptLessonContent.DataBind();
    }

    private class ContentItem
    {
        public string ContentTitle { get; set; }
        public string PracticeText { get; set; }
        public string ImportanceText { get; set; }
        public string ImagePath { get; set; }
    }
}