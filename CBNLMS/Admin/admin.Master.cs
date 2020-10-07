using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Data;
using System.Web.Services;
using System.Web.Script.Services;
using System.Globalization;

namespace CBNLMS
{
    public partial class admin1 : System.Web.UI.MasterPage
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