using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Default: show guest menu
        Menu1.Visible = true;
        Menu2.Visible = false;
        Menu3.Visible = false;

        if (Session["UserType"] != null)
        {
            string userType = Session["UserType"].ToString();

            if (userType.Equals("admin"))
            {
                Menu1.Visible = false;
                Menu2.Visible = true;
                Menu3.Visible = false;
            }
            else if (userType.Equals("user"))
            {
                Menu1.Visible = false;
                Menu2.Visible = false;
                Menu3.Visible = true;
            }
        }


    }


    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        
    }
    protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Value == "Logout")
        {
            Session.Clear();
            Session.Abandon(); // Clear session
            Response.Redirect("~/Login.aspx"); // Redirect to login page
        }
    }
    protected void Menu3_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Value == "Logout")
        {
            Session.Clear();
            Session.Abandon(); // Clear session
            Response.Redirect("~/Login.aspx"); // Redirect to login page
        }
    }
}
