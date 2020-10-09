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
using System.IO;
using System.Drawing;

namespace CBNLMS.Reporting._2
{
    public partial class approve_loan : System.Web.UI.Page
    {
        string loanapprovedid;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                alert.Visible = false;
                failed.Visible = false;
                BindGrid();
            }
            else
            {
                alert.Visible = false;
                failed.Visible = false;
            }
        }

        private void BindGrid()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_loans where loan_status='Pending' ", sc))
            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                        return;
                    }
                }
            }
        }

        protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Approve")
            {
                string querey = "bvn=" + e.CommandArgument.ToString();
                string loanid = e.CommandArgument.ToString();
                sc.Open();
                SqlCommand img = new SqlCommand("update all_loans set loan_status='Active' where loan_guid='" + loanid + "'", sc);
                SqlParameter paramID = new SqlParameter();
                img.CommandType = CommandType.Text;
                img.ExecuteNonQuery();

                uploaded.InnerHtml = ""+ loanid + "";
                loanapprovedid = loanid;
                Session["customertype"] = "Individual";
                BindGrid();
                alert.Visible = true;
            }
            else if (e.CommandName == "Deny")
            {
                string querey = "bvn=" + e.CommandArgument.ToString();
                string loanid = e.CommandArgument.ToString();
                sc.Open();
                SqlCommand img = new SqlCommand("update all_loans set loan_status='Denied' where loan_guid='" + loanid + "'", sc);
                SqlParameter paramID = new SqlParameter();
                img.CommandType = CommandType.Text;
                img.ExecuteNonQuery();

                Span1.InnerHtml = "" + loanid + "";
                loanapprovedid = loanid;
             //   Session["customertype"] = "Individual";
                BindGrid();
                failed.Visible = true;
            }
        }

        protected void Button6_Click_cass(object sender, EventArgs e)
        {
         
        }

        protected void test(object sender, EventArgs e)
        {

            string loanid = uploaded.InnerHtml;
            string querey = "status=approved";
            Session["ApproveReport"] = loanid;
            //  Session["customertype"] = "Individual";
            Response.Redirect("~/Reporting/2/Approval_report.aspx?" + querey);
        }

        protected void test2(object sender, EventArgs e)
        {

            string loanid = Span1.InnerHtml;
            string querey = "status=declined";
            Session["DeclineReport"] = loanid;
            //  Session["customertype"] = "Individual";
            Response.Redirect("~/Reporting/2/Decline_report.aspx?" + querey);
        }
    }
}