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

namespace CBNLMS.Reporting._3
{
    public partial class Decline_report : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        string loanid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DeclineReport"] == null)
            {
                Response.Redirect("~/Reporting/3/approve_loan.aspx");
            }
            else
            {

            }
            loanid = Session["DeclineReport"].ToString();

            if (!IsPostBack)
            {


                BindGrid();
                getWhileLoopDataind();


            }
        }
        private void BindGrid()
        {

            SqlCommand img = new SqlCommand("select * from all_loans where loan_guid='" + loanid + "'", sc);

            sc.Open();
            SqlDataReader sdrpopulate = img.ExecuteReader();
            if (sdrpopulate.HasRows)
            {
                while (sdrpopulate.Read())
                {
                    customername.InnerHtml = (sdrpopulate["customer_name"].ToString());
                    customerid.InnerHtml = (sdrpopulate["customer_unique_id"].ToString());
                    customertype.InnerHtml = (sdrpopulate["customer_type"].ToString());
                    state.InnerHtml = (sdrpopulate["bus_stat"].ToString());
                    intervention.InnerHtml = (sdrpopulate["intervention"].ToString());
                    bankdiv.InnerHtml = (sdrpopulate["bank_name"].ToString());
                    loanpurpose.InnerHtml = (sdrpopulate["loan_purpose"].ToString());
                    tenure.InnerHtml = " " + String.Format("{0:#,##0}", sdrpopulate["num_of_yrs"] == DBNull.Value ? 0 : Convert.ToInt32(sdrpopulate["num_of_yrs"]));

                    loanidspan.InnerHtml = " " + String.Format("{0:#,##0}", sdrpopulate["loan_id"] == DBNull.Value ? 0 : Convert.ToInt32(sdrpopulate["loan_id"]));
                    moratorium.InnerHtml = " " + String.Format("{0:#,##0.00}", sdrpopulate["moratorium"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["moratorium"]));
                    disamount.InnerHtml = " ₦" + String.Format("{0:#,##0.00}", sdrpopulate["loan_amount"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["loan_amount"]));
                    DateTime tempd = Convert.ToDateTime(sdrpopulate["start_date"].ToString());
                    DateTime tempd1 = Convert.ToDateTime(sdrpopulate["exp_date"].ToString());
                    disbursementdate.InnerHtml = " " + tempd1.ToString("dd/MM/yyyy");
                    expirydate.InnerHtml = " " + tempd.ToString("dd/MM/yyyy");



                }
            }
            sc.Close();
        }

        public string getWhileLoopDataind()
        {
            string htmlStr = "";

            SqlCommand img = new SqlCommand("select * from all_loans where loan_guid='" + loanid + "'", sc);
            SqlParameter paramID = new SqlParameter();
            img.CommandType = CommandType.Text;
            img.Parameters.AddWithValue("@ID", loanid);
            sc.Open();
            SqlDataReader sdrpopulate = img.ExecuteReader();
            int serialnumber = 0;
            DateTime now = DateTime.Now;
            while (sdrpopulate.Read())
            {
                dateandtime.InnerHtml = now.ToString("dd MMM yyyy");
                double moratorium = 0;
                double PaymentAmount = 0;
                string LoanAmount = " ₦" + String.Format("{0:#,##0.00}", sdrpopulate["loan_amount"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["loan_amount"]));
                double NumberOfYears = sdrpopulate["num_of_yrs"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["num_of_yrs"]);
                double rate = sdrpopulate["interest_rate"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["interest_rate"]);
                string repayment = sdrpopulate["payment_mode"] == DBNull.Value ? "N/A" : (sdrpopulate["payment_mode"]).ToString();
                double NumberOfPayments = (NumberOfYears - moratorium) * 12;
                // PaymentAmount = (LoanAmount) / (NumberOfPayments);
                PaymentAmount = Math.Round(PaymentAmount, 2);
                string cust_id = sdrpopulate["customer_unique_id"] == DBNull.Value ? "aa244" : (sdrpopulate["customer_unique_id"]).ToString();
                string pfi = sdrpopulate["bank_name"] == DBNull.Value ? "N/A" : (sdrpopulate["bank_name"]).ToString();
                DateTime entrydate = DateTime.Now;
                TimeSpan entrytim = DateTime.Now.TimeOfDay;
                DateTime disdate = Convert.ToDateTime(sdrpopulate["start_date"]);
                string datefrom = disdate.ToString("dd/MM/yyyy");
                DateTime expdate = Convert.ToDateTime(sdrpopulate["exp_date"]);
                string dateto = expdate.ToString("dd/MM/yyyy");
                serialnumber = serialnumber + 1;
                htmlStr += "<tr><td>" + serialnumber + "</td><td>" + pfi + "</td><td>" + LoanAmount + "</td><td>" + NumberOfYears + "</td><td>" + rate + "</td><td>" + repayment + "</td></tr>";

            }
            sc.Close();
            return htmlStr;
        }
    }
}