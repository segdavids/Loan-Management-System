﻿using System;
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
    public partial class Repayment_Form : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
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
            customerpop();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void save_data(object sender, EventArgs e)
        {

        }
        public void customerpop()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select customer_name from [agmeis_app]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList2.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList2.DataTextField = "customer_name";
            DropDownList2.DataValueField = "customer_name";

            DropDownList2.DataBind();
            sc.Close();
        }

        protected void upload_record(object sender, EventArgs e)
        {

        }

        protected void download_template(object sender, EventArgs e)
        {

        }
    }
}