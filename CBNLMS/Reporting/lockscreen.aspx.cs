using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Windows;
using System.IO;
using System.Threading;
using System.Net;

namespace CBNLMS.Reporting
{
    public partial class lockscreen : System.Web.UI.Page
    {
        string email = string.Empty;
        string welcomename = string.Empty;
        string lname = string.Empty;
        string role = string.Empty;
        SqlConnection constr = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null && Session["Email"]==null )
            {
                Response.Redirect("~/index.aspx");
            }
            else
            if (!IsPostBack)
            {
                
                role = Session["Role"].ToString();
                email = Session["Email"].ToString();
                welcomename = Session["Name"].ToString();
                lname = Session["LName"].ToString();
                alert.Visible = false;
                Session.RemoveAll();
                Session.Abandon();
                firsname.InnerHtml += "" + welcomename.ToString() + " ";
                fullname.InnerHtml = ""+welcomename+", "+lname+"";
            }
        }

        protected void unlock(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Passwords do not Match');</script>");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Passwords do not Match');</script>");

        }
    }
    }
