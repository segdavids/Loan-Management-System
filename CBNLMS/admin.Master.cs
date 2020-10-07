using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CBNLMS
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null || Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            
           if (!this.IsPostBack)
                {
                    String welcomename = String.Empty;
                string emailz = string.Empty;
                emailz = Session["Email"].ToString();
                welcomename = Session["ID"].ToString();
                string lastlogins = Session["lastlogin"].ToString();
                user.InnerHtml += "<strong>" + welcomename + " </strong>";
                lastlogin.InnerHtml += "" + lastlogins + "";

            }
            else
            { }
        }
    }
}