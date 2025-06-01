using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageQuiz : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Redirect non-admins or unauthenticated users to login
        if (Session["UserType"] == null || !Session["UserType"].ToString().Equals("admin"))
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}