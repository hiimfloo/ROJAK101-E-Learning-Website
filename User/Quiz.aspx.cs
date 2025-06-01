using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;

public partial class User_Quiz : System.Web.UI.Page
{
    private static List<Question> quizQuestions;
    private static List<string> userAnswers;
    private const int TotalQuestions = 10;

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
        userAnswers = new List<string>();
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

            textA.InnerText = "A. " + q.OptionA;
            textB.InnerText = "B. " + q.OptionB;
            textC.InnerText = "C. " + q.OptionC;
            textD.InnerText = "D. " + q.OptionD;

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

        if (index < TotalQuestions)
        {
            Session["Index"] = index;
            DisplayQuestion(index);
        }
        else
        {
            int score = 0;
            for (int i = 0; i < TotalQuestions; i++)
            {
                if (userAnswers[i] == quizQuestions[i].CorrectAnswer)
                    score++;
            }

            Response.Redirect("QuizResult.aspx?score=" + score);
        }
    }

    private class Question
    {
        public int QuestionID;
        public string QuestionText;
        public string OptionA, OptionB, OptionC, OptionD;
        public string CorrectAnswer;
    }
}
