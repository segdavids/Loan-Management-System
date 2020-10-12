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
    public partial class disbursement1 : System.Web.UI.Page
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
            getWhileLoopData();
            getWhileLoopDatahead();
        }

        protected void upload_btn(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            fillselet();
            getWhileLoopDatahead2();
            // return htmlStr1;


        }
        public string fillselet()
        {
            string droptext = DropDownList2.Text.ToString();
            if (droptext == "Intervention")
            {
                droptext = "intervention";
            }
            else if (droptext == "Bank")
            {
                droptext = "bank";
            }
            else if (droptext == "Geopolitical zone")
            {
                droptext = "goe_z";
            }
            else if (droptext == "Sector")
            {
                droptext = "Commodity";
            }
            else if (droptext == "Commodity")
            {
                droptext = "commodity";
            }
            else if (droptext == "year")
            {
                droptext = "date_dis";
            }
            else if (droptext == "Anchor")
            {
                droptext = "anchor";
            }
            else if (droptext == "Projects")
            {
                droptext = "project";
            }
            string htmlStr3 = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "SELECT " + droptext + ",SUM(CAST(amt_rel as float)) from adp group by " + droptext + " ";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                string state = reader.GetString(0);
                double geo_z = reader.GetDouble(1);
                string geozstr = "₦" + String.Format("{0:#,##0.000}", geo_z.ToString());
                //string anchor = reader.GetString(3);
                //string dof_dis = reader.GetString(4);
                //string due_date = reader.GetString(5);
                //string loan_status = reader.GetString(6);
                //string due_out = reader.GetString(20);
                htmlStr3 += "<tr><td>" + state + "</td><td>" + geozstr + "</td></tr>";
            }

            sc.Close();
            return htmlStr3;

        }
        public string getWhileLoopData()
        {
            string htmlStr = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "SELECT customer_name,customer_unique_id,(case when bus_stat is null then 'Not Specified' else bus_stat end) as bus_stat, loan_amount,(case when start_date is null then CAST('00:15' AS datetime) else start_date end) as start_date,(case when exp_date is null then CAST('00:15' AS datetime) else exp_date end) as exp_date,(case when loan_status is null then 'Uknown' else loan_status end) as loan_status,customer_type,bank_name from cbndb.dbo.all_loans";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                string cname = reader.GetString(0);
                string cid = reader.GetString(1);
                string state = reader.GetString(2);
                double disamt = reader["loan_amount"] == DBNull.Value? 0.00: Convert.ToDouble(reader["loan_amount"]);
                DateTime dof_dis = reader.GetDateTime(4);
                DateTime due_date = reader.GetDateTime(5);
                string loan_status = reader.GetString(6);
                string custype = reader.GetString(7);
                string bank = reader.GetString(8);
                htmlStr += "<tr><td>" + cname + "</td><td>" + custype + "</td><td>" + cid + "</td><td>" + state + "</td><td>" + String.Format("{0:#,##0.00}", disamt) + "</td><td>" + dof_dis.ToString("dd/MM/yyyy") + "</td><td>" + due_date.ToString("dd/MM/yyyy") + "</td><td>" + bank + "</td><td>" + loan_status + "</td></tr>";
            }

            sc.Close();
            return htmlStr;
        }

        public string getWhileLoopDatahead()
        {
            string htmlStr = "";

            htmlStr = "<tr><td> CUSTOMER NAME </td><td> CUSTOMER TYPE  </td><td> CUSTOMERID  </td><td>STATE</td><td>AMOUNT DISBURSED(₦)</td><td>DISBURSEMENT DATE</td><td>EXPIRY DATE</td><td>BANK</td><td>STATUS</td></tr>";


            return htmlStr;
        }

        public string getWhileLoopDatahead2()
        {
            string htmlStr2 = "";
            string header = DropDownList2.Text.ToString();
            htmlStr2 = "<tr><td> " + header + " </td><td>Amount Disbursed</td></tr>";


            return htmlStr2;
        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //    string droptext = DropDownList2.Text.ToString();
            //    if (droptext== "Intervention")
            //    {
            //        droptext = "intervention";
            //    }
            //    else if (droptext == "Bank")
            //        {
            //            droptext = "bank";
            //        }
            //    else if (droptext == "Geopolitical zone")
            //    {
            //        droptext = "goe_z";
            //    }
            //    else if (droptext == "Sector")
            //    {
            //        droptext = "Commodity";
            //    }
            //    else if (droptext == "Commodity")
            //    {
            //        droptext = "commodity";
            //    }
            //    else if (droptext == "year")
            //    {
            //        droptext = "date_dis";
            //    }
            //    else if (droptext == "Anchor")
            //    {
            //        droptext = "anchor";
            //    }
            //    else if (droptext == "Projects")
            //    {
            //        droptext = "project";
            //    }
            //    string htmlStr1 = "";
            //    SqlCommand thisCommand = sc.CreateCommand();
            //    thisCommand.CommandText = "SELECT "+droptext+ ",SUM(CAST(amt_rel as float)) from adp group by " + droptext+" ";
            //    sc.Open();
            //    SqlDataReader reader = thisCommand.ExecuteReader();

            //    while (reader.Read())
            //    {
            //        string state = reader.GetString(1);
            //        string geo_z = reader.GetString(2);
            //        string anchor = reader.GetString(3);
            //        string dof_dis = reader.GetString(4);
            //        string due_date = reader.GetString(5);
            //        string loan_status = reader.GetString(6);
            //        string due_out = reader.GetString(20);
            //        htmlStr1 += "<tr><td>" + state + "</td><td>" + geo_z + "</td><td>" + anchor + "</td><td>" + dof_dis + "</td><td>" + due_date + "</td><td>" + loan_status + "</td><td>" + due_out + "</td></tr>";
            //    }

            //    sc.Close();
            //   // return htmlStr1;
        }

        protected void clear_filter(object sender, EventArgs e)
        {
            getWhileLoopData();
            getWhileLoopDatahead();
        }
    }
}