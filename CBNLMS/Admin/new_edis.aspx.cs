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
    public partial class new_edis1 : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        // SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {
                String welcomename = String.Empty;
                string emailz = string.Empty;
                emailz = Session["Email"].ToString();
                welcomename = Session["ID"].ToString();
                string lastlogins = Session["lastlogin"].ToString();
               
            }
            popdropdown();
            popstate();
            popgeozone();
        }
        public void popdropdown()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [registration_status]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "reg_status";
            DropDownList1.DataValueField = "reg_status";

            DropDownList1.DataBind();
            sc.Close();
            // DropDownList1.DataTextField = ds.Tables[0].Columns["reg_status"].ToString();
            // DropDownList1.DataValueField = ds.Tables[0].Columns["reg_status"].ToString();             // to retrive specific  textfield name 

        }

        public void popstate()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [states]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList2.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList2.DataTextField = "state";
            DropDownList2.DataValueField = "state";

            DropDownList2.DataBind();
            sc.Close();

            // DropDownList1.DataTextField = ds.Tables[0].Columns["reg_status"].ToString();
            // DropDownList1.DataValueField = ds.Tables[0].Columns["reg_status"].ToString();             // to retrive specific  textfield name 

        }

        public void popgeozone()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [geo_political_zone]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList3.DataSource = ds;
            DropDownList3.DataBind();
            DropDownList3.DataTextField = "geo_zone";
            DropDownList3.DataValueField = "geo_zone";

            DropDownList3.DataBind();
            sc.Close();

            // DropDownList1.DataTextField = ds.Tables[0].Columns["reg_status"].ToString();
            // DropDownList1.DataValueField = ds.Tables[0].Columns["reg_status"].ToString();             // to retrive specific  textfield name 

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void upload_btn(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}