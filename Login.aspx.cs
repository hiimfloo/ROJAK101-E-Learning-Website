using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // Execute select query and store records in table 

        System.Data.DataView dv = (System.Data.DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);



        // Check number of records returned 

        if (dv.Count == 0)
        {

            Label1.Text = "Username and Password is incorrect!";

            return;

        }



        // Create session keys       
        Session["UserID"] = dv[0]["UserID"].ToString();
        Session["FirstName"] = dv[0]["FirstName"].ToString(); 
        Session["Email"] = dv[0]["Email"].ToString();
        Session["UserType"] = dv[0]["UserType"].ToString();



        // Based on UserType to redirect 

        if (Session["UserType"].ToString().Equals("admin"))

            Response.Redirect("~/Admin/Default.aspx");

        if (Session["UserType"].ToString().Equals("user"))

            Response.Redirect("~/User/Default.aspx");
    }
}