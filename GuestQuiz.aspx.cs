using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GuestQuiz : System.Web.UI.Page

{
    private static List<Question> quizQuestions;
    private static List<string> userAnswers;
    private const int TotalQuestions = 3; // For guest session




    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            startPanel.Visible = true;
            quizPanel.Visible = false;
        }
    }

    protected void btnStart_Click(object sender, EventArgs e)
    {
        startPanel.Visible = false;
        quizPanel.Visible = true;

        LoadQuestions(); 

       
        Session["AllQuestions"] = quizQuestions;

      
        userAnswers = new List<string>();
        Session["UserAnswers"] = userAnswers;

        Session["Index"] = 0;

        DisplayQuestion(0);
    }


    private void LoadQuestions()
    {
        quizQuestions = new List<Question>();
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string query = "SELECT TOP 10 * FROM Questions ORDER BY NEWID()";

        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                quizQuestions.Add(new Question
                {
                    QuestionID = Convert.ToInt32(reader["QuestionID"]),
                    QuestionText = reader["QuestionText"].ToString(),
                    OptionA = reader["OptionA"].ToString(),
                    OptionB = reader["OptionB"].ToString(),
                    OptionC = reader["OptionC"].ToString(),
                    OptionD = reader["OptionD"].ToString(),
                    CorrectAnswer = reader["CorrectAnswer"].ToString()
                });
            }
        }
    }

    private void DisplayQuestion(int index)
    {
        if (index < quizQuestions.Count)
        {
            var q = quizQuestions[index];
            lblProgress.Text = "Question " + (index + 1) + " of " + TotalQuestions;
            lblQuestion.Text = q.QuestionText;

            textA.Text = "A. " + q.OptionA;
            textB.Text = "B. " + q.OptionB;
            textC.Text = "C. " + q.OptionC;
            textD.Text = "D. " + q.OptionD;

            optA.Checked = optB.Checked = optC.Checked = optD.Checked = false;
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        string answer = "";
        if (optA.Checked) answer = "A";
        else if (optB.Checked) answer = "B";
        else if (optC.Checked) answer = "C";
        else if (optD.Checked) answer = "D";

        userAnswers.Add(answer);

        int index = (int)Session["Index"] + 1;
        Session["Index"] = index;

        if (index < TotalQuestions) // First 3 for guest
        {
            DisplayQuestion(index);
        }
        else
        {
            // Save answers so far
            Session["UserAnswers"] = userAnswers;
            Response.Redirect("Login.aspx?continue=quiz");
        }
    }


}
