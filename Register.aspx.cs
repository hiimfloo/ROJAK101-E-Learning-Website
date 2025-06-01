using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<string> countries = new List<string>
        {
                    "Malaysia",
                    "Singapore",
                    "Indonesia",
                    "Thailand",
                    "Brunei",
                    "Philippines",
                    "Vietnam",
                    "Cambodia",
                    "Myanmar, {Burma}",
                    "Laos",
                    "United States",

                    // The Rest (Alphabetical & No Duplicates)
                    "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua & Deps", "Argentina", "Armenia",
                    "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus",
                    "Belgium", "Belize", "Benin", "Bhutan", "Bolivia", "Bosnia Herzegovina", "Botswana", "Brazil",
                    "Bulgaria", "Burkina", "Burundi", "Cameroon", "Canada", "Cape Verde", "Central African Rep",
                    "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Congo {Democratic Rep}",
                    "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica",
                    "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea",
                    "Eritrea", "Estonia", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia",
                    "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana",
                    "Haiti", "Honduras", "Hungary", "Iceland", "India", "Iran", "Iraq", "Ireland {Republic}",
                    "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati",
                    "Korea North", "Korea South", "Kosovo", "Kuwait", "Kyrgyzstan", "Latvia", "Lebanon", "Lesotho",
                    "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar",
                    "Malawi", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico",
                    "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Namibia",
                    "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway",
                    "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Poland",
                    "Portugal", "Qatar", "Romania", "Russian Federation", "Rwanda", "St Kitts & Nevis", "St Lucia",
                    "Saint Vincent & the Grenadines", "Samoa", "San Marino", "Sao Tome & Principe", "Saudi Arabia",
                    "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Slovakia", "Slovenia", "Solomon Islands",
                    "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Swaziland",
                    "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Togo", "Tonga",
                    "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine",
                    "United Arab Emirates", "United Kingdom", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City",
                    "Venezuela", "Yemen", "Zambia", "Zimbabwe"
        };

            // Optionally remove duplicates if Malaysia appears again
            var distinctCountries = countries.Distinct().ToList();

            ddlNationality.DataSource = distinctCountries;
            ddlNationality.DataBind();
        }
    }

    protected void txtLastName_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        CustomValidator1.Validate();

        if (!Page.IsValid)
            return;

        SqlDataSource1.Insert();
        Response.Redirect("Login.aspx");
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        System.Data.DataView dv = new System.Data.DataView();



        dv = (System.Data.DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);



        if (dv.Count > 0)

            args.IsValid = false;

        else

            args.IsValid = true;
    }

    protected void chkTerms_CheckedChanged(object sender, EventArgs e)
    {

    }
}