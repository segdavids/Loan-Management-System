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
        string loanapprovedid; string tester;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
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
                tester = Session["Email"].ToString();
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
            Response.Redirect("~/Inputing/2/Approval_report.aspx?" + querey);
        }

        protected void test2(object sender, EventArgs e)
        {

            string loanid = Span1.InnerHtml;
            string querey = "status=declined";
            Session["DeclineReport"] = loanid;
            //  Session["customertype"] = "Individual";
            Response.Redirect("~/Inputing/2/Decline_report.aspx?" + querey);
        }

        protected void OnEdit(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, true);
        }

        private void ToggleElements(RepeaterItem item, bool isEdit)
        {
            //Toggle Buttons.
            item.FindControl("lnkEdit").Visible = !isEdit;
            item.FindControl("lnkUpdate").Visible = isEdit;
            item.FindControl("lnkCancel").Visible = isEdit;
           // item.FindControl("lnkDelete").Visible = !isEdit;

            //Toggle Labels.
            item.FindControl("lblContactName").Visible = !isEdit;
            item.FindControl("lblCountry1").Visible = !isEdit;
            item.FindControl("Label2").Visible = !isEdit;
            item.FindControl("Label3").Visible = !isEdit;
            item.FindControl("Label1").Visible = !isEdit;
            item.FindControl("Label6").Visible = !isEdit;
            item.FindControl("Label8").Visible = !isEdit;

            //Toggle TextBoxes.
            item.FindControl("Number11").Visible = isEdit;
            item.FindControl("TextBox3").Visible = isEdit;
            item.FindControl("TextBox1").Visible = isEdit;
            item.FindControl("Date5").Visible = isEdit;
            item.FindControl("DropDownList15").Visible = isEdit;
            item.FindControl("DropDownList1").Visible = isEdit;
        }

        protected void OnUpdate(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            string loan_id = (item.FindControl("Label7") as Label).Text.ToString().Trim();
            string customerid = (item.FindControl("lblCustomerId") as Label).Text;
            string customername = (item.FindControl("Label4") as Label).Text;
            double loanamount = Double.Parse((item.FindControl("Number11") as TextBox).Text);
            DateTime disdate = DateTime.Parse((item.FindControl("Date5") as TextBox).Text);
            double tenure = Double.Parse((item.FindControl("TextBox3") as TextBox).Text);
            double loantenure = Math.Round((tenure / 12),2);
            double morato = Double.Parse((item.FindControl("TextBox1") as TextBox).Text);
            string interveniton = (item.FindControl("DropDownList15") as DropDownList).SelectedItem.Value.Trim();
            string paymentmode = (item.FindControl("DropDownList1") as DropDownList).SelectedItem.Value.Trim();
            DateTime expdate = disdate.AddMonths(Convert.ToInt32(tenure));
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            double moratorium = morato / 12;
            double NumberOfPayments = (loantenure - moratorium) * 12;
            double PaymentAmount = (loanamount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
            sc.Open();
            SqlCommand cmd3 = new SqlCommand("update all_loans set intervention=@interveniton,payment_mode=@paymentmode,loan_amount=@lamt,num_of_yrs=@noy,moratorium=@mora,start_date=@start,payment_amt=@payamt,month_inst=@payamt2,num_of_inst=@numofinst,exp_date=@expdate,date_created=@datecreated,time_created=@timecreated where loan_guid=@loanguid", sc);
            cmd3.Parameters.AddWithValue("@loanguid", loan_id);
            cmd3.Parameters.AddWithValue("@interveniton", interveniton);
            cmd3.Parameters.AddWithValue("@paymentmode", paymentmode);
            cmd3.Parameters.AddWithValue("@lamt", loanamount);
            cmd3.Parameters.AddWithValue("@noy", loantenure);
            cmd3.Parameters.AddWithValue("@mora", morato);
            cmd3.Parameters.AddWithValue("@start", disdate);
            cmd3.Parameters.AddWithValue("@payamt", PaymentAmount);
            cmd3.Parameters.AddWithValue("@payamt2", PaymentAmount);
            cmd3.Parameters.AddWithValue("@numofinst", NumberOfPayments);
            cmd3.Parameters.AddWithValue("@expdate", expdate);
            cmd3.Parameters.AddWithValue("@datecreated", entrydate);
            cmd3.Parameters.AddWithValue("@timecreated", entrytim);
            cmd3.ExecuteNonQuery();


            string useractivity = "Modified Loan Details. for Loan_ID: " + loan_id + " and Customer: "+customername+"("+customerid+") ";
            DateTime now = DateTime.Now;
            SqlCommand cmd33 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
            cmd33.Parameters.AddWithValue("@user", tester);
            cmd33.Parameters.AddWithValue("@activity", useractivity);
            cmd33.Parameters.AddWithValue("@datetime", now);
            cmd33.ExecuteNonQuery();
            sc.Close();
            this.BindGrid();


        }
        protected void OnCancel(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, false);
        }
    }
}