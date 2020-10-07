using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CBNLMS.Inputing._3
{
    public partial class inputer3 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Inputer_3"] == null || Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
             if (!this.IsPostBack)
            {
                {
                    string lastlogins = string.Empty;
                    string lname = string.Empty;
                    string phone = string.Empty;
                    string welcomename = string.Empty;
                    string emailz = string.Empty;
                    string role = string.Empty;
                    //username.InnerHtml = string.Empty;
                    role = Session["Role"].ToString();
                    emailz = Session["Email"].ToString();
                    welcomename = Session["Inputer_3"].ToString();
                    lastlogins = Session["lastlogin"].ToString();
                    lname = Session["LName"].ToString();
                    phone = Session["Phone"].ToString();
                    user.InnerHtml += "<strong>" + welcomename + " </strong>";
                    lastlogin.InnerHtml += "" + lastlogins + "";

                    // username.InnerHtml = "<strong>" + welcomename + " </strong>";



                }

            }
        }
    }
}