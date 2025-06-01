using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;

public partial class GuestQuizResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string score = Request.QueryString["score"];
            ltFinalScore.Text = "You scored " + score + " out of 3!";
        }
    }
}
