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

namespace CBNLMS.Inputing._7
{
    public partial class viewschedule : System.Web.UI.Page
    {
        string amortid;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ViewSchedule"] == null)
            {
                Response.Redirect("~/Inputing/7/schedule_loans.aspx");
            }
            else
            {

            }
            amortid = Session["ViewSchedule"].ToString();

            if (!IsPostBack)
            {


                BindGrid();
                getWhileLoopDataind();


            }
        }

        private void BindGrid()
        {
            sc.Open();
            SqlCommand img = new SqlCommand("select * from all_loans where loan_guid='" + amortid + "'", sc);
            SqlParameter paramID = new SqlParameter();
            img.CommandType = CommandType.Text;
            img.Parameters.AddWithValue("@ID", amortid);
            SqlDataReader sdrpopulate = img.ExecuteReader();
            sdrpopulate.Read();
            nof.InnerHtml = " " + String.Format("{0:#,##0.00}", sdrpopulate["num_of_inst"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["num_of_inst"]));
            DateTime now = DateTime.Now;
            pamtpm.InnerHtml = " ₦" + String.Format("{0:#,##0.00}", sdrpopulate["payment_amt"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["payment_amt"]));
            obligor.InnerHtml = " " + sdrpopulate["customer_name"].ToString();
            amtdis.InnerHtml = " ₦" + String.Format("{0:#,##0.00}", sdrpopulate["loan_amount"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["loan_amount"]));
            if (sdrpopulate["start_date"]==DBNull.Value)
            {
                Response.Write("<script>alert('The Loan you have selected does not have a Start Date: Schedule for this Loan cannot be Generated!');</script>");
                dateofd.InnerHtml = "No Start Date";
            }
            else
            {
                DateTime tempd = Convert.ToDateTime(sdrpopulate["start_date"].ToString());
                dateofd.InnerHtml = " " + tempd.ToString("dd/MM/yyyy");
            }
           
            cbnratte.InnerHtml = " " + String.Format("{0:#,##0.00}", (sdrpopulate["interest_rate"].ToString()));
            ftype.InnerHtml = " " + sdrpopulate["facility_type"].ToString() + "";
            tenor.InnerHtml = " " + sdrpopulate["num_of_yrs"].ToString();
            mora.InnerHtml = " " + sdrpopulate["moratorium"].ToString();
            pmode.InnerHtml = " " + sdrpopulate["payment_mode"].ToString();

            sc.Close();
        }

        public string getWhileLoopDataind()
        {
            string htmlStr = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "SELECT * from amortization_Schedule where amortization_id='" + amortid + "' order by row_id asc";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    int rowid = reader.GetInt32(0);
                    string amorid = reader.GetString(1);
                    string loanid = reader.GetString(2);
                    //string fullname = "" + state + " " + geo_z + " " + anchor + "";
                    string customeruniqueid = reader.GetString(3);
                    int rowmonth = reader.GetInt32(4);
                    DateTime datefromfull = reader.GetDateTime(5);
                    string datefrom = datefromfull.ToString("dd/MM/yyyy");

                    DateTime datetofull = reader.GetDateTime(6);
                    string dateto = datetofull.ToString("dd/MM/yyyy");
                    int noofmodays = reader.GetInt32(7);
                    double priceprmodoub = reader.GetDouble(8);
                    string princrepmonth = "₦" + String.Format("{0:#,##0.00}", priceprmodoub);

                    double cbnintdouble = reader.GetDouble(9);
                    string cbnint = "₦" + String.Format("{0:#,##0.00}", cbnintdouble);

                    double monthintdouble = reader.GetDouble(10);
                    string monthint = "₦" + String.Format("{0:#,##0.00}", monthintdouble);

                    double mototaldouble = reader.GetDouble(11);
                    string mototal = "₦" + String.Format("{0:#,##0.00}", mototaldouble);

                    double cummamtduedouble = reader.GetDouble(12);
                    string cummamtdue = "₦" + String.Format("{0:#,##0.00}", cummamtduedouble);

                    //  string amtrepayed = reader.GetString(14);
                    //string repdayte = reader.GetString(15);
                    //string dateto = reader.GetString(16);
                    first.Visible = true;
                    second.Visible = false;
                    htmlStr += "<tr><td>" + rowmonth + "</td><td>" + datefrom + "</td><td>" + dateto + "</td><td>" + noofmodays + "</td><td>" + princrepmonth + "</td><td>" + monthint + "</td><td>" + mototal + "</td><td>" + cummamtdue + "</td></tr>";
                 
                }
            }
            else
            {
                SqlCommand img = new SqlCommand("select * from all_loans where loan_guid='" + amortid + "'", sc);
                SqlParameter paramID = new SqlParameter();
                img.CommandType = CommandType.Text;
                img.Parameters.AddWithValue("@ID", amortid);
                SqlDataReader sdrpopulate = img.ExecuteReader();
                while (sdrpopulate.Read())
                {
                    double moratorium = 0;
                    double PaymentAmount = 0;
                    double LoanAmount = Convert.ToDouble((Convert.ToDouble(sdrpopulate["loan_amount"])));
                    double NumberOfYears = sdrpopulate["num_of_yrs"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["num_of_yrs"]);
                    moratorium = sdrpopulate["moratorium"] == DBNull.Value ? 0 : Convert.ToDouble(sdrpopulate["moratorium"]);
                    double NumberOfPayments = (NumberOfYears - moratorium) * 12;
                    PaymentAmount = (LoanAmount) / (NumberOfPayments);
                    PaymentAmount = Math.Round(PaymentAmount, 2);
                    //   double priceprmodoub = reader.GetDouble(8);
                    pamtpm.InnerHtml = "₦" + String.Format("{0:#,##0.00}", PaymentAmount);
                    nof.InnerHtml = String.Format("{0:#,##0}", NumberOfPayments); 
                   string cust_id = sdrpopulate["customer_unique_id"] == DBNull.Value ? "aa244" :(sdrpopulate["customer_unique_id"]).ToString();
                    DateTime entrydate = DateTime.Now;
                    TimeSpan entrytim = DateTime.Now.TimeOfDay;
                    if (sdrpopulate["start_date"]==DBNull.Value)
                    {
                        Response.Write("<script>alert('The Loan you have selected does not have a Start Date: Schedule for this Loan cannot be Generated!');</script>");
                    }
                    else
                    {
                        DateTime disdate = Convert.ToDateTime(sdrpopulate["start_date"]);
                        string datefrom = disdate.ToString("dd/MM/yyyy");
                    }
                   
                    DateTime expdate = Convert.ToDateTime(sdrpopulate["exp_date"]);
                    string dateto = expdate.ToString("dd/MM/yyyy");


                    int loanuniqueid = sdrpopulate.GetInt32(0);
                    //CREATE AMORTIZATION SCHEDULE
                    double intrate = ((Convert.ToDouble(sdrpopulate["interest_rate"])) / 100);
                    int rep_mo = 0; double cummulative_principal = 0; double principal = 0; double month_int = 0; double total_month = 0; double cumm_amt_due = 0; DateTime mo_from; DateTime month_to; int no_of_monthdays;

                    mo_from = Convert.ToDateTime(sdrpopulate["start_date"]);
                    DataTable dt = new DataTable();
                    dt.Columns.AddRange(new DataColumn[8] { new DataColumn("row_month", typeof(int)),
                            new DataColumn("datefrom", typeof(string)),
                        new DataColumn("dateto", typeof(string)),
                        new DataColumn("no_of_mo_days", typeof(int)),
                        new DataColumn("principal_rep_mo", typeof(double)),
                        new DataColumn("month_int", typeof(double)),
                        new DataColumn("mo_total", typeof(double)),
                        new DataColumn("cumm_amt_due",typeof(double)) });
                    for (int i = 0; i <= (NumberOfPayments - 1); i++)
                    {
                        rep_mo = rep_mo + 1;
                        // DateTime tempmoto = mo_from.AddDays(-1);
                        month_to = mo_from.AddMonths(1);
                        
                        no_of_monthdays = DateTime.DaysInMonth(mo_from.Year, mo_from.Month);
                        cummulative_principal = cummulative_principal + PaymentAmount;
                        if (DateTime.IsLeapYear(mo_from.Year))
                        {
                            month_int = LoanAmount - (cummulative_principal * intrate * no_of_monthdays / 366);
                        }
                        else
                        {
                            month_int = LoanAmount - (cummulative_principal * intrate * no_of_monthdays / 365);
                        }
                        total_month = PaymentAmount + month_int;
                        cumm_amt_due = total_month + cumm_amt_due;
                        
                        dt.Rows.Add(rep_mo, mo_from.ToString("dd/MM/yyyy"), month_to.ToString("dd/MM/yyyy"), no_of_monthdays, PaymentAmount, month_int, total_month, cumm_amt_due);
                        mo_from = month_to;
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                        first.Visible = false;
                        second.Visible = true;
                    }
                }

            }
            sc.Close();
            return htmlStr;
        }

        protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}