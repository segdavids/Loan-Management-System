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
using System.Net;
using System.IO;

namespace CBNLMS.Inputing._3
{
    public partial class newloan : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            popbvn();
            factype();
            popbank();
            fillpaymentmode();
            poptin();
            popstate();
            getWhileLoopDataind();
        }

        protected void download_template(object sender, EventArgs e)
        {
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            string filePath = "~/assets/forms/loan_form_template.csv";
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=loan_form_template.csv");
            byte[] data = req.DownloadData(Server.MapPath(filePath));
            response.BinaryWrite(data);
            response.End();
        }

        protected void upload_record(object sender, EventArgs e)
        {

        }

        protected void save_data(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        public void popbvn()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select BVN from all_customer where customer_type='INDIVIDUAL'", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList8.DataSource = ds;
            DropDownList8.DataBind();
            DropDownList8.DataTextField = "bvn";
            DropDownList8.DataValueField = "bvn";

            DropDownList8.DataBind();
            sc.Close();
        }
        public void poptin()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select tin_no from all_customer where customer_type='CORPORATE'", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList3.DataSource = ds;
            DropDownList3.DataBind();
            DropDownList3.DataTextField = "tin_no";
            DropDownList3.DataValueField = "tin_no";

            DropDownList3.DataBind();
            sc.Close();
        }
        public void popstate()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select state_name from all_customer where customer_type='STATE GOVERNMENT'", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList15.DataSource = ds;
            DropDownList15.DataBind();
            DropDownList15.DataTextField = "state_name";
            DropDownList15.DataValueField = "state_name";

            DropDownList15.DataBind();
            sc.Close();
        }
        public void popbank()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from types_banks", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList9.DataSource = ds;
            DropDownList4.DataSource = ds;
            DropDownList16.DataSource = ds;
            DropDownList9.DataBind();
            DropDownList4.DataBind();
            DropDownList16.DataBind();
            DropDownList9.DataTextField = "bank";
            DropDownList4.DataTextField = "bank";
            DropDownList16.DataTextField = "bank";
            DropDownList9.DataValueField = "bank";
            DropDownList4.DataValueField = "bank";
            DropDownList16.DataValueField = "bank";

            DropDownList9.DataBind();
            DropDownList4.DataBind();
            DropDownList16.DataBind();
            sc.Close();
        }
        public void factype()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [facility_type]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList11.DataSource = ds;
            DropDownList17.DataSource = ds;
            DropDownList5.DataSource = ds;
            DropDownList11.DataBind();
            DropDownList5.DataBind();
            DropDownList17.DataBind();
            DropDownList11.DataTextField = "facility_type";
            DropDownList11.DataValueField = "facility_type";
            DropDownList17.DataValueField = "facility_type";

            DropDownList5.DataValueField = "facility_type";
            DropDownList5.DataTextField = "facility_type";
            DropDownList17.DataTextField = "facility_type";

            DropDownList11.DataBind();
            DropDownList5.DataBind();
            DropDownList17.DataBind();
            sc.Close();
        }

        public void fillpaymentmode()
        {
            sc.Open();
            SqlCommand com2 = new SqlCommand("select * from [payment_mode]", sc); // table name 
            SqlDataAdapter da2 = new SqlDataAdapter(com2);
            DataTable ds2 = new DataTable();
            da2.Fill(ds2);  // fill dataset

            DropDownList12.DataSource = ds2;
            DropDownList10.DataSource = ds2;
            DropDownList18.DataSource = ds2;
            DropDownList12.DataBind();
            DropDownList10.DataBind();
            DropDownList18.DataBind();
            DropDownList12.DataTextField = "payment_mode";
            DropDownList10.DataTextField = "payment_mode";
            DropDownList18.DataTextField = "payment_mode";
            DropDownList12.DataValueField = "payment_mode";
            DropDownList10.DataValueField = "payment_mode";
            DropDownList18.DataValueField = "payment_mode";

            DropDownList12.DataBind();
            DropDownList10.DataBind();
            DropDownList18.DataBind();
            sc.Close();
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            string custype = DropDownList4.SelectedItem.Value.ToString();
            if (custype == "INDIVIDUAL")
            {
                sc.Open();
                SqlCommand ind = new SqlCommand("select first_name, last_name from all_customer where customer_type=@custype", sc); // table name 
                SqlDataAdapter indda = new SqlDataAdapter(ind);
                DataTable inds = new DataTable();
                indda.Fill(inds);  // fill dataset
                DropDownList1.DataSource = inds;
                DropDownList1.DataBind();
                DropDownList1.DataTextField = "first_name";
                DropDownList1.DataValueField = "first_name";
            }
            if (custype == "")
            {

            }
            if (custype == "")
            {

            }
            else
            { }
            sc.Open();
            SqlCommand com = new SqlCommand("select first_name, last_name from all_customer where ", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
        }

        protected void clear_ind(object sender, EventArgs e)
        {

        }

        protected void add_ind_loan(object sender, EventArgs e)
        {

        }

        protected void add_corp(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Number6.Value))
            {
                Response.Write("<script>alert('Loan Amount Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Number7.Value))
            {
                Response.Write("<script>alert('Interest Rate Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(TextBox2.Text))
            {
                Response.Write("<script>alert('Loan Tenure Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Date2.Value))
            {
                Response.Write("<script>alert('Date Disbursed Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Date3.Value))
            {
                Response.Write("<script>alert('Expiry Date Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Number8.Value))
            {
                Response.Write("<script>alert('Moratorium Required!');</script>");
                goto end;
            }
            double moratorium = 0;
            double PaymentAmount = 0;
            double LoanAmount = Convert.ToDouble(Number6.Value);
            double NumberOfYears = Convert.ToDouble(TextBox2.Text);
            moratorium = Convert.ToDouble(Number8.Value);
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
            string cust_id = DropDownList3.SelectedItem.Value.ToString();
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            DateTime disdate = DateTime.Parse(Date2.Value.ToString());
            DateTime expdate = DateTime.Parse(Date3.Value.ToString());
            sc.Open();
            SqlCommand check = new SqlCommand("select organization_name,tin_no, customer_type from all_customer where tin_no = @bvn", sc);
            check.Parameters.AddWithValue("@bvn", cust_id);
            SqlDataReader rd = check.ExecuteReader();
            while (rd.Read())
            {
                string orgname = rd.GetString(0);
                string tinno = rd.GetString(1);
                string ctype = rd.GetString(2);
                SqlCommand cmd3 = new SqlCommand("insert into all_loans (customer_unique_id,customer_name,customer_type,intervention,bank,facility_type,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,month_inst,num_of_inst,exp_date,date_created,time_created) values(@custid,@fullname,@ctype,@intervention,@bank,@fact,@pmode,@lamt,@intr,@tenure,@mora,@sd,@payamt,@moins,@norep,@ed,@entrydate,@entrytime)", sc);
                cmd3.Parameters.AddWithValue("@custid", cust_id);
                cmd3.Parameters.AddWithValue("@fullname", orgname);
                cmd3.Parameters.AddWithValue("@ctype", ctype);
                cmd3.Parameters.AddWithValue("@intervention", DropDownList1.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank", DropDownList4.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@fact", DropDownList5.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@pmode", DropDownList10.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@lamt", LoanAmount);
                cmd3.Parameters.AddWithValue("@intr", Convert.ToDouble(Number7.Value));
                cmd3.Parameters.AddWithValue("@tenure", Convert.ToDouble(TextBox2.Text));
                cmd3.Parameters.AddWithValue("@mora", Convert.ToDouble(Number8.Value));
                cmd3.Parameters.AddWithValue("@sd", disdate);
                cmd3.Parameters.AddWithValue("@payamt", PaymentAmount);
                cmd3.Parameters.AddWithValue("@moins", PaymentAmount);
                cmd3.Parameters.AddWithValue("@norep", NumberOfPayments);
                cmd3.Parameters.AddWithValue("@ed", expdate);
                cmd3.Parameters.AddWithValue("@entrydate", entrydate);
                cmd3.Parameters.AddWithValue("@entrytime", entrytim);

                cmd3.ExecuteNonQuery();

            }
            sc.Close();

            Response.Write("<script>alert('Loan Record Added Successfully');</script>");
            Number7.Value = string.Empty;
            TextBox2.Text = string.Empty;
            Number8.Value = string.Empty;
            Date2.Value = string.Empty;
            Date3.Value = string.Empty;
            Number6.Value = string.Empty;
            end:
            { }
        }

        protected void clear_corp(object sender, EventArgs e)
        {
            Number7.Value = string.Empty;
            TextBox2.Text = string.Empty;
            Number8.Value = string.Empty;
            Date2.Value = string.Empty;
            Date3.Value = string.Empty;
            Number6.Value = string.Empty;
        }

        protected void add_state(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Number11.Value))
            {
                Response.Write("<script>alert('Loan Amount Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Number12.Value))
            {
                Response.Write("<script>alert('Interest Rate Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(TextBox3.Text))
            {
                Response.Write("<script>alert('Loan Tenure Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Date5.Value))
            {
                Response.Write("<script>alert('Date Disbursed Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Date6.Value))
            {
                Response.Write("<script>alert('Expiry Date Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Number13.Value))
            {
                Response.Write("<script>alert('Moratorium Required!');</script>");
                goto end;
            }
            double moratorium = 0;
            double PaymentAmount = 0;
            double LoanAmount = Convert.ToDouble(Number11.Value);
            double NumberOfYears = Convert.ToDouble(TextBox3.Text);
            moratorium = Convert.ToDouble(Number13.Value);
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
            string cust_id = DropDownList15.SelectedItem.Value.ToString();
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            DateTime disdate = DateTime.Parse(Date5.Value.ToString());
            DateTime expdate = DateTime.Parse(Date6.Value.ToString());
            sc.Open();
            SqlCommand check = new SqlCommand("select state_name, customer_type from all_customer where state_name = @bvn", sc);
            check.Parameters.AddWithValue("@bvn", cust_id);
            SqlDataReader rd = check.ExecuteReader();
            while (rd.Read())
            {
                string statename = rd.GetString(0);
                string ctype = rd.GetString(1);
                SqlCommand cmd3 = new SqlCommand("insert into all_loans (customer_unique_id,customer_name,customer_type,intervention,bank,facility_type,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,month_inst,num_of_inst,exp_date,date_created,time_created) values(@custid,@fullname,@ctype,@intervention,@bank,@fact,@pmode,@lamt,@intr,@tenure,@mora,@sd,@payamt,@moins,@norep,@ed,@entrydate,@entrytime)", sc);
                cmd3.Parameters.AddWithValue("@custid", cust_id);
                cmd3.Parameters.AddWithValue("@fullname", statename);
                cmd3.Parameters.AddWithValue("@ctype", ctype);
                cmd3.Parameters.AddWithValue("@intervention", DropDownList13.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank", DropDownList16.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@fact", DropDownList17.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@pmode", DropDownList18.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@lamt", LoanAmount);
                cmd3.Parameters.AddWithValue("@intr", Convert.ToDouble(Number12.Value));
                cmd3.Parameters.AddWithValue("@tenure", Convert.ToDouble(TextBox3.Text));
                cmd3.Parameters.AddWithValue("@mora", Convert.ToDouble(Number13.Value));
                cmd3.Parameters.AddWithValue("@sd", disdate);
                cmd3.Parameters.AddWithValue("@payamt", PaymentAmount);
                cmd3.Parameters.AddWithValue("@moins", PaymentAmount);
                cmd3.Parameters.AddWithValue("@norep", NumberOfPayments);
                cmd3.Parameters.AddWithValue("@ed", expdate);
                cmd3.Parameters.AddWithValue("@entrydate", entrydate);
                cmd3.Parameters.AddWithValue("@entrytime", entrytim);

                cmd3.ExecuteNonQuery();

            }
            sc.Close();

            Response.Write("<script>alert('Loan Record Added Successfully');</script>");
            Number12.Value = string.Empty;
            TextBox3.Text = string.Empty;
            Number13.Value = string.Empty;
            Date5.Value = string.Empty;
            Date6.Value = string.Empty;
            Number11.Value = string.Empty;
            end:
            { }
        }

        protected void clear_state(object sender, EventArgs e)
        {
            Number12.Value = string.Empty;
            TextBox3.Text = string.Empty;
            Number13.Value = string.Empty;
            Date5.Value = string.Empty;
            Date6.Value = string.Empty;
            Number11.Value = string.Empty;
        }

        protected void add_ind(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Number1.Value))
            {
                Response.Write("<script>alert('Loan Amount Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Number2.Value))
            {
                Response.Write("<script>alert('Interest Rate Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(TextBox1.Value))
            {
                Response.Write("<script>alert('Loan Tenure Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Date1.Value))
            {
                Response.Write("<script>alert('Date Disbursed Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Date4.Value))
            {
                Response.Write("<script>alert('Expiry Date Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Number3.Value))
            {
                Response.Write("<script>alert('Moratorium Required!');</script>");
                goto end;
            }
            double moratorium = 0;
            double PaymentAmount = 0;
            double LoanAmount = Convert.ToDouble(Number1.Value);
            double NumberOfYears = Convert.ToDouble(TextBox1.Value);
            moratorium = Convert.ToDouble(Number3.Value);
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
            string cust_id = DropDownList8.SelectedItem.Value.ToString();
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            DateTime disdate = DateTime.Parse(Date1.Value.ToString());
            DateTime expdate = DateTime.Parse(Date4.Value.ToString());
            sc.Open();
            SqlCommand check = new SqlCommand("select first_name,last_name,(case when other_name is null then '.' else other_name end), customer_type from all_customer where bvn = @bvn", sc);
            check.Parameters.AddWithValue("@bvn", cust_id);
            SqlDataReader rd = check.ExecuteReader();
            while (rd.Read())
            {
                string fname = rd.GetString(0);
                string lname = rd.GetString(1);
                string oname = rd.GetString(2);
                string fullname = "" + fname + " " + lname + " " + oname + "";
                string ctype = rd.GetString(3);
                SqlCommand cmd3 = new SqlCommand("insert into all_loans (customer_unique_id,customer_name,customer_type,intervention,bank,facility_type,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,month_inst,num_of_inst,exp_date,date_created,time_created) values(@custid,@fullname,@ctype,@intervention,@bank,@fact,@pmode,@lamt,@intr,@tenure,@mora,@sd,@payamt,@moins,@norep,@ed,@entrydate,@entrytime)", sc);
                cmd3.Parameters.AddWithValue("@custid", cust_id);
                cmd3.Parameters.AddWithValue("@fullname", fullname);
                cmd3.Parameters.AddWithValue("@ctype", ctype);
                cmd3.Parameters.AddWithValue("@intervention", DropDownList6.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank", DropDownList9.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@fact", DropDownList11.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@pmode", DropDownList12.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@lamt", LoanAmount);
                cmd3.Parameters.AddWithValue("@intr", Convert.ToDouble(Number2.Value));
                cmd3.Parameters.AddWithValue("@tenure", Convert.ToDouble(TextBox1.Value));
                cmd3.Parameters.AddWithValue("@mora", Convert.ToDouble(Number3.Value));
                cmd3.Parameters.AddWithValue("@sd", disdate);
                cmd3.Parameters.AddWithValue("@payamt", PaymentAmount);
                cmd3.Parameters.AddWithValue("@moins", PaymentAmount);
                cmd3.Parameters.AddWithValue("@norep", NumberOfPayments);
                cmd3.Parameters.AddWithValue("@ed", expdate);
                cmd3.Parameters.AddWithValue("@entrydate", entrydate);
                cmd3.Parameters.AddWithValue("@entrytime", entrytim);

                cmd3.ExecuteNonQuery();

            }
            sc.Close();

            Response.Write("<script>alert('Loan Record Added Successfully');</script>");
            Number1.Value = string.Empty;
            Number2.Value = string.Empty;
            TextBox1.Value = string.Empty;
            Date1.Value = string.Empty;
            Date4.Value = string.Empty;
            Number3.Value = string.Empty;
            end:
            { }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Number1.Value))
            {
                Response.Write("<script>alert('Loan Amount Required!');</script>");
                goto end;
            }

            if (string.IsNullOrWhiteSpace(TextBox1.Value))
            {
                Response.Write("<script>alert('Loan Tenure Required!');</script>");
                goto end;
            }


            if (string.IsNullOrWhiteSpace(Number3.Value))
            {
                Response.Write("<script>alert('Moratorium Required!');</script>");
                goto end;
            }
            double moratorium = 0;
            double PaymentAmount = 0;
            double LoanAmount = Convert.ToDouble(Number1.Value);
            double NumberOfYears = Convert.ToDouble(TextBox1.Value);


            moratorium = Convert.ToDouble(Number3.Value);
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);



            if (NumberOfYears - moratorium == 0 || LoanAmount <= 0 || NumberOfYears <= 0)
            {

            }


            else
            {


                if (LoanAmount <= 0 || NumberOfYears <= 0)
                {

                }

                moratorium = Convert.ToDouble(Number3.Value);
                NumberOfPayments = (NumberOfYears - moratorium) * 12;
                PaymentAmount = (LoanAmount) / (NumberOfPayments);
                PaymentAmount = Math.Round(PaymentAmount, 2);



                Number4.Visible = true;
                Number5.Visible = true;
                string naira = "₦" + String.Format("{0:#,##0.000}", PaymentAmount);
                Number4.Text = naira;
                Number5.Text = NumberOfPayments.ToString();
            }
            end:
            { }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void cal_corp(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Number6.Value))
            {
                Response.Write("<script>alert('Loan Amount Required!');</script>");
                goto end;
            }

            if (string.IsNullOrWhiteSpace(TextBox2.Text))
            {
                Response.Write("<script>alert('Loan Tenure Required!');</script>");
                goto end;
            }


            if (string.IsNullOrWhiteSpace(Number8.Value))
            {
                Response.Write("<script>alert('Moratorium Required!');</script>");
                goto end;
            }
            double moratorium = 0;
            double PaymentAmount = 0;
            double LoanAmount = Convert.ToDouble(Number6.Value);
            double NumberOfYears = Convert.ToDouble(TextBox2.Text);
            moratorium = Convert.ToDouble(Number8.Value);
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);

            if (NumberOfYears - moratorium == 0 || LoanAmount <= 0 || NumberOfYears <= 0)
            {

            }


            else
            {


                if (LoanAmount <= 0 || NumberOfYears <= 0)
                {

                }
                if (Number3.Value == "0")
                {
                    moratorium = 0;
                }
                else
                {
                    moratorium = Convert.ToDouble(Number3.Value);
                }


                NumberOfPayments = (NumberOfYears - moratorium) * 12;
                PaymentAmount = (LoanAmount) / (NumberOfPayments);
                PaymentAmount = Math.Round(PaymentAmount, 1);



                Number4.Visible = true;
                Number5.Visible = true;
                string naira = "₦" + String.Format("{0:#,##0.00}", PaymentAmount);
                Number9.Text = naira;
                Number10.Text = NumberOfPayments.ToString();
            }
            end:
            { }
        }

        protected void scehdule_corp(object sender, EventArgs e)
        {

        }

        protected void cal_state(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Number11.Value))
            {
                Response.Write("<script>alert('Loan Amount Required!');</script>");
                goto end;
            }

            if (string.IsNullOrWhiteSpace(TextBox3.Text))
            {
                Response.Write("<script>alert('Loan Tenure Required!');</script>");
                goto end;
            }


            if (string.IsNullOrWhiteSpace(Number13.Value))
            {
                Response.Write("<script>alert('Moratorium Required!');</script>");
                goto end;
            }
            double moratorium = 0;
            double PaymentAmount = 0;
            double LoanAmount = Convert.ToDouble(Number11.Value);
            double NumberOfYears = Convert.ToDouble(TextBox3.Text);
            moratorium = Convert.ToDouble(Number13.Value);
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);



            if (NumberOfYears - moratorium == 0 || LoanAmount <= 0 || NumberOfYears <= 0)
            {

            }


            else
            {


                if (LoanAmount <= 0 || NumberOfYears <= 0)
                {

                }

                moratorium = Convert.ToDouble(Number13.Value);
                NumberOfPayments = (NumberOfYears - moratorium) * 12;
                PaymentAmount = (LoanAmount) / (NumberOfPayments);
                PaymentAmount = Math.Round(PaymentAmount, 2);



                Number4.Visible = true;
                Number5.Visible = true;
                string naira = "₦" + String.Format("{0:#,##0.000}", PaymentAmount);
                Number14.Text = naira;
                Number15.Text = NumberOfPayments.ToString();
            }
            end:
            { }
        }

        protected void schedule_state(object sender, EventArgs e)
        {

        }

        protected void all_ind(object sender, EventArgs e)
        {

        }

        protected void all_corp(object sender, EventArgs e)
        {

        }

        protected void all_state(object sender, EventArgs e)
        {

        }
        public string getWhileLoopDataind()
        {
            string htmlStr = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "SELECT (case when first_name is null then 'N/A' else first_name end),(case when last_name is null then 'N/A' else last_name end),(case when other_name is null then 'N/A' else other_name end),(case when bvn is null then 'N/A' else bvn end), (case when organization_name is null then 'N/A' else organization_name end), (case when tin_no is null then 'N/A' else tin_no end), (case when cac_no is null then 'N/A' else cac_no end) from all_customer where customer_type='INDIVIDUAL' or customer_tyPe='CORPORATE'";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                string state = reader.GetString(0);
                string geo_z = reader.GetString(1);
                string anchor = reader.GetString(2);
                string fullname = "" + state + " " + geo_z + " " + anchor + "";
                string dof_dis = reader.GetString(3);
                string due_date = reader.GetString(4);
                string loan_status = reader.GetString(5);
                string due_out = reader.GetString(6);
                htmlStr += "<tr><td>" + fullname + "</td><td>" + dof_dis + "</td><td>" + due_date + "</td><td>" + loan_status + "</td><td>" + due_out + "</td></tr>";
            }

            sc.Close();
            return htmlStr;
        }
    }
}