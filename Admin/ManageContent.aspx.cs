using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ManageContent : System.Web.UI.Page
{
    // Store selected lesson ID in ViewState
    private int SelectedLessonId
    {
        get
        {
            return ViewState["SelectedLessonId"] != null
                ? Convert.ToInt32(ViewState["SelectedLessonId"])
                : 0;
        }
        set
        {
            ViewState["SelectedLessonId"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Redirect non-admins or unauthenticated users to login
        if (Session["UserType"] == null || !Session["UserType"].ToString().Equals("admin"))
        {
            Response.Redirect("~/Login.aspx");
        }

        if (!IsPostBack)
        {
            // Set default lesson to Lesson 1
            SelectedLessonId = 1;
            pnlContentForm.Visible = true;
            pnlGrid.Visible = true;

            btnLesson1.CssClass = "active-lesson";
            btnLesson2.CssClass = "";
            btnLesson3.CssClass = "";

            SqlContentDataSource.SelectParameters["LessonID"].DefaultValue = "1";
            gvContent.DataBind();
        }
    }

    protected void LessonButton_Click(object sender, EventArgs e)
    {

        Button clickedButton = (Button)sender;
        SelectedLessonId = Convert.ToInt32(clickedButton.CommandArgument);

        pnlContentForm.Visible = true;
        pnlGrid.Visible = true;

        btnLesson1.CssClass = "";
        btnLesson2.CssClass = "";
        btnLesson3.CssClass = "";

        clickedButton.CssClass = "active-lesson";

        SqlContentDataSource.SelectParameters["LessonID"].DefaultValue = SelectedLessonId.ToString();
        gvContent.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (SelectedLessonId == 0)
        return;

    string title = txtTitle.Text.Trim();
    string practice = txtPractice.Text.Trim();
    string importance = txtImportance.Text.Trim();

    // Manual validation
    if (string.IsNullOrWhiteSpace(title) || string.IsNullOrWhiteSpace(practice) || string.IsNullOrWhiteSpace(importance))
    {
        lblError.Text = "All fields must be filled in.";
        return;
    }

    string audioPath = "";
    if (fuAudio.HasFile)
    {
        string filename = Path.GetFileName(fuAudio.FileName);
        string folderPath = Server.MapPath("~/Audio/");
        if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);
        string savePath = Path.Combine(folderPath, filename);
        fuAudio.SaveAs(savePath);
        audioPath = "~/Audio/" + filename;
    }

    int orderNo = GetNextOrderNumber(SelectedLessonId);

    string query = @"INSERT INTO Content (LessonID, ContentTitle, PracticeText, ImportanceText, AudioPath, OrderNo)
                     VALUES (@LessonID, @Title, @Practice, @Importance, @AudioPath, @OrderNo)";

    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
    {
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@LessonID", SelectedLessonId);
            cmd.Parameters.AddWithValue("@Title", title);
            cmd.Parameters.AddWithValue("@Practice", practice);
            cmd.Parameters.AddWithValue("@Importance", importance);
            cmd.Parameters.AddWithValue("@AudioPath", audioPath);
            cmd.Parameters.AddWithValue("@OrderNo", orderNo);

            conn.Open();
            cmd.ExecuteNonQuery();
        }
    }

    // Refresh GridView for current lesson
    SqlContentDataSource.SelectCommand = "SELECT * FROM [Content] WHERE LessonID = @LessonID";
    SqlContentDataSource.SelectParameters.Clear();
    SqlContentDataSource.SelectParameters.Add("LessonID", SelectedLessonId.ToString());
    gvContent.DataBind();

    // Clear form and error message
    txtTitle.Text = "";
    txtPractice.Text = "";
    txtImportance.Text = "";
    lblError.Text = "";
    }

    private int GetNextOrderNumber(int lessonId)
    {
        int nextOrder = 1;
        string query = "SELECT ISNULL(MAX(OrderNo), 0) + 1 FROM Content WHERE LessonID = @LessonID";

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@LessonID", lessonId);
                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != DBNull.Value)
                    nextOrder = Convert.ToInt32(result);
            }
        }

        return nextOrder;
    }
}