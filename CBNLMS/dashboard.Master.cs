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

namespace CBNLMS
{
    public partial class dashboard : System.Web.UI.MasterPage
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
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
                popbvn();
            }
            else
            {  }
        }


        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList9.SelectedItem.Text=="AADS")
            {
                Response.Redirect("~/aads_analytics.aspx");
            }
            if (DropDownList9.SelectedItem.Text == "ABP")
            {
                Response.Redirect("~/abp_analytics.aspx");
            }
            if (DropDownList9.SelectedItem.Text == "CIFI")
            {
                Response.Redirect("~/cifi_analytics.aspx");
            }
            if (DropDownList9.SelectedItem.Text == "CACS")
            {
                Response.Redirect("~/cacs_analytics.aspx");
            }
            if (DropDownList9.SelectedItem.Text == "TCF")
            {
                Response.Redirect("~/Default.aspx");
            }
        }
        public void popbvn()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from interventions order by acronym asc", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList9.DataSource = ds;
            DropDownList9.DataBind();
            DropDownList9.DataTextField = "acronym";
            DropDownList9.DataValueField = "acronym";

            DropDownList9.DataBind();
            sc.Close();
        }
    }
}