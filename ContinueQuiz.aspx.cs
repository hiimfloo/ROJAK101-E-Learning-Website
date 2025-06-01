using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContinueQuiz : System.Web.UI.Page
{
    private List<Question> quizQuestions;
    private List<string> userAnswers;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 🧪 Debugging: Check if session survived
            if (Session["AllQuestions"] == null || Session["UserAnswers"] == null)
            {
                Response.Write("<h2 style='color:red;'>❌ Session[\"AllQuestions\"] or [\"UserAnswers\"] is NULL in ContinueQuiz</h2>");
                Response.End(); // Prevent crash
                return;
            }

            // ✅ Session is okay, continue normally
            quizQuestions = (List<Question>)Session["AllQuestions"];
            userAnswers = (List<string>)Session["UserAnswers"];
            Session["Index"] = 3;
            DisplayQuestion(3);
        }
    }

    private void DisplayQuestion(int index)
    {
        var q = quizQuestions[index];
        lblProgress.Text = "Question " + (index + 1) + " of 10";
        lblQuestion.Text = q.QuestionText;
        textA.Text = "A. " + q.OptionA;
        textB.Text = "B. " + q.OptionB;
        textC.Text = "C. " + q.OptionC;
        textD.Text = "D. " + q.OptionD;

        optA.Checked = optB.Checked = optC.Checked = optD.Checked = false;
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        string answer = "";
        if (optA.Checked) answer = "A";
        else if (optB.Checked) answer = "B";
        else if (optC.Checked) answer = "C";
        else if (optD.Checked) answer = "D";

        userAnswers = (List<string>)Session["UserAnswers"];
        userAnswers.Add(answer);
        Session["UserAnswers"] = userAnswers;

        int index = (int)Session["Index"] + 1;

        if (index < 10)
        {
            Session["Index"] = index;
            DisplayQuestion(index);
        }
        else
        {
            int score = 0;
            var allQuestions = (List<Question>)Session["AllQuestions"];

            for (int i = 0; i < 10; i++)
            {
                if (userAnswers[i] == allQuestions[i].CorrectAnswer)
                    score++;
            }

            Response.Redirect("QuizResult.aspx?score=" + score);
        }
    }


}