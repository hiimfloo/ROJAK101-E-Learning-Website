using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class User_Slang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLessonContent(1); // LessonID = 1 for Slang
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
                    AudioPath = reader["AudioPath"].ToString()
                });
            }
        }

        rptLessonContent.DataSource = dataList;
        rptLessonContent.DataBind();
    }

    protected void rptLessonContent_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            var item = (ContentItem)e.Item.DataItem;
            PlaceHolder phAudio = (PlaceHolder)e.Item.FindControl("phAudio");
            HtmlAudio audio = (HtmlAudio)e.Item.FindControl("audioPlayer");
            HtmlSource source = (HtmlSource)e.Item.FindControl("audioSource");

            if (!string.IsNullOrEmpty(item.AudioPath))
                source.Src = ResolveUrl(item.AudioPath);
            else
                phAudio.Visible = false;
        }
    }

    private class ContentItem
    {
        public string ContentTitle { get; set; }
        public string PracticeText { get; set; }
        public string ImportanceText { get; set; }
        public string AudioPath { get; set; }
    }
}