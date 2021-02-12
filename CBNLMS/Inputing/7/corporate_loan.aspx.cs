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
using System.Net;
using System.IO;

namespace CBNLMS.Inputing._7
{
    public partial class corporate_loan : System.Web.UI.Page
    {

        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                repaymentwindow.Visible = false;
                alert.Visible = false;
            }
            else
            {
                alert.Visible = false;
                string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                repaymentwindow.Visible = false;
                factype();
                //popbank();
                fillpaymentmode();
                // poptin();
                getWhileLoopDataind();
              //  popintervention();
                sector();
                stateofbus();
                BindGrid2();
           
            }
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
        public void sector()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from business_sector", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList21.DataSource = ds;
            DropDownList21.DataBind();
            DropDownList21.DataTextField = "bus_sector";
            DropDownList21.DataValueField = "bus_sector";

            DropDownList21.DataBind();
            sc.Close();
        }
        public void stateofbus()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from states", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList22.DataSource = ds;
            DropDownList22.DataBind();

            DropDownList22.DataTextField = "state";

            DropDownList22.DataValueField = "state";

            DropDownList22.DataBind();
            sc.Close();
        }
        public void popintervention()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from interventions where acronym !='ABP'", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "acronym";
            DropDownList1.DataValueField = "acronym";

            DropDownList1.DataBind();
            sc.Close();
        }

        //public void poptin()
        //{
        //    sc.Open();
        //    SqlCommand com = new SqlCommand("select tin_no from all_customer where customer_type='CORPORATE'", sc); // table name 
        //    SqlDataAdapter da = new SqlDataAdapter(com);
        //    DataTable ds = new DataTable();
        //    da.Fill(ds);  // fill dataset
        //    DropDownList3.DataSource = ds;
        //    DropDownList3.DataBind();
        //    DropDownList3.DataTextField = "tin_no";
        //    DropDownList3.DataValueField = "tin_no";

        //    DropDownList3.DataBind();
        //    sc.Close();
        //}

        public void popbank()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from types_banks", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList4.DataSource = ds;
            DropDownList4.DataBind();
            DropDownList4.DataTextField = "bank";
            DropDownList4.DataValueField = "bank";

            DropDownList4.DataBind();
            sc.Close();
        }
        public void factype()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [facility_type]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList5.DataSource = ds;
            DropDownList5.DataBind();

            DropDownList5.DataValueField = "facility_type";
            DropDownList5.DataTextField = "facility_type";

            DropDownList5.DataBind();
            sc.Close();
        }

        public void fillpaymentmode()
        {
            sc.Open();
            SqlCommand com2 = new SqlCommand("select * from [payment_mode]", sc); // table name 
            SqlDataAdapter da2 = new SqlDataAdapter(com2);
            DataTable ds2 = new DataTable();
            da2.Fill(ds2);  // fill dataset

            DropDownList10.DataSource = ds2;
            DropDownList10.DataBind();
            DropDownList10.DataTextField = "payment_mode";
            DropDownList10.DataValueField = "payment_mode";

            DropDownList10.DataBind();
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



        protected void add_corp(object sender, EventArgs e)
        {
            try
            {
                System.Threading.Thread.Sleep(1000);
                string geozone;
                if (string.IsNullOrWhiteSpace(Number6.Value))
                {
                    Response.Write("<script>alert('Loan Amount Required!');</script>");
                    goto end;
                }
                if (string.IsNullOrWhiteSpace(customertin.Text))
                {
                    Response.Write("<script>alert('Kindly select a Customer');</script>");
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

                if (string.IsNullOrWhiteSpace(Number8.Value))
                {
                    Response.Write("<script>alert('Moratorium Required!');</script>");
                    goto end;
                }
                string selected = DropDownList22.SelectedItem.Text;
                if (selected == "EKITI" || selected == "OGUN" || selected == "ONDO" || selected == "OSUN" || selected == "OYO" || selected == "LAGOS")
                {
                    geozone = "SOUTH WEST";
                }
                else if (selected == "EDO" || selected == "RIVERS" || selected == "CROSS RIVER" || selected == "DELTA" || selected == "AKWA IBOM" || selected == "BAYELSA")
                {
                    geozone = "SOUTH SOUTH";
                }
                else if (selected == "ANAMBRA" || selected == "ABIA" || selected == "IMO" || selected == "EBONYI" || selected == "ENUGU")
                {
                    geozone = "SOUTH EAST";
                }
                else if (selected == "SOKOTO" || selected == "ZAMFARA" || selected == "JIGAWA" || selected == "KADUNA" || selected == "KANO" || selected == "KATSINA" || selected == "KEBBI")
                {
                    geozone = "NORTH WEST";
                }
                else if (selected == "BAUCHI" || selected == "ADAMAWA" || selected == "BORNO" || selected == "TARABA" || selected == "YOBE" || selected == "GOMBE")
                {
                    geozone = "NORTH EAST";
                }
                else if (selected == "PLATEAU" || selected == "NASSARAWA" || selected == "NIGER" || selected == "BENUE" || selected == "FEDERAL CAPITAL TERRITORY" || selected == "KOGI" || selected == "KWARA")
                {
                    geozone = "NORTH CENTRAL";
                }
                else
                {
                    Response.Write("<script>alert('Selected State of business is not valid');</script>");
                    goto end;
                }
                double moratorium = 0;
                double PaymentAmount = 0;
                double LoanAmount = Convert.ToDouble(Number6.Value);
                double tenure = Convert.ToDouble(TextBox2.Text);
                double NumberOfYears = Math.Round((tenure / 12), 2); ;
                moratorium = Convert.ToDouble(Number8.Value) / 12;
                double NumberOfPayments = (NumberOfYears - moratorium) * 12;
                PaymentAmount = (LoanAmount) / (NumberOfPayments);
                PaymentAmount = Math.Round(PaymentAmount, 2);
                string cust_id = customertin.Text.ToString();
                DateTime entrydate = DateTime.Now;
                TimeSpan entrytim = DateTime.Now.TimeOfDay;

                DateTime disdate = DateTime.Parse(Date2.Value.ToString());

                DateTime expdate = disdate.AddMonths(Convert.ToInt32(tenure));
                sc.Open();
                SqlCommand check = new SqlCommand("select organization_name,tin_no, customer_type from all_customer where tin_no = @bvn", sc);
                check.Parameters.AddWithValue("@bvn", cust_id);
                SqlDataReader rd = check.ExecuteReader();
                while (rd.Read())
                {
                    string orgname = rd.GetString(0);
                    string tinno = rd.GetString(1);
                    string ctype = rd.GetString(2);
                    Guid loanguid = Guid.NewGuid();
                    string loanstatus = "Pending";
                    SqlCommand cmd3 = new SqlCommand("insert into all_loans (loan_guid,customer_unique_id,customer_name,customer_type,intervention,bank,bank_name,facility_type,bus_stat,bus_geozone,sector,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,month_inst,num_of_inst,exp_date,loan_purpose,loan_status,date_created,time_created) values(@lguid,@custid,@fullname,@ctype,@intervention,@bank,@bank_name,@fact,@busstate,@buszone,@sector,@pmode,@lamt,@intr,@tenure,@mora,@sd,@payamt,@moins,@norep,@ed,@loan_purpose,@status,@entrydate,@entrytime)", sc);
                    cmd3.Parameters.AddWithValue("@lguid", loanguid);
                    cmd3.Parameters.AddWithValue("@custid", cust_id);
                    cmd3.Parameters.AddWithValue("@fullname", orgname);
                    cmd3.Parameters.AddWithValue("@ctype", ctype);
                    cmd3.Parameters.AddWithValue("@intervention", DropDownList1.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@bank", DropDownList4.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@bank_name", DropDownList7.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@fact", DropDownList5.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@busstate", DropDownList22.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@buszone", geozone);
                    cmd3.Parameters.AddWithValue("@sector", DropDownList21.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@pmode", DropDownList10.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@lamt", LoanAmount);
                    cmd3.Parameters.AddWithValue("@intr", Convert.ToDouble(Number7.Value));
                    cmd3.Parameters.AddWithValue("@tenure", NumberOfYears);
                    cmd3.Parameters.AddWithValue("@mora", Convert.ToDouble(Number8.Value));
                    cmd3.Parameters.AddWithValue("@sd", disdate);
                    cmd3.Parameters.AddWithValue("@payamt", PaymentAmount);
                    cmd3.Parameters.AddWithValue("@moins", PaymentAmount);
                    cmd3.Parameters.AddWithValue("@norep", NumberOfPayments);
                    cmd3.Parameters.AddWithValue("@ed", expdate);
                    cmd3.Parameters.AddWithValue("@loan_purpose", Textarea1.Value);
                    cmd3.Parameters.AddWithValue("@status", loanstatus);
                    cmd3.Parameters.AddWithValue("@entrydate", entrydate);
                    cmd3.Parameters.AddWithValue("@entrytime", entrytim);

                    cmd3.ExecuteNonQuery();

                    SqlCommand getlid = new SqlCommand("select loan_id from all_loans where loan_guid = '" + loanguid + "'", sc);
                    //getlid.Parameters.AddWithValue("@loanguid", loanguid);
                    SqlDataReader rdlid = getlid.ExecuteReader();
                    while (rdlid.Read())
                    {
                        int loanuniqueid = rdlid.GetInt32(0);
                        //CREATE AMORTIZATION SCHEDULE
                        double intrate = ((Convert.ToDouble(Number7.Value)) / 100);
                        int rep_mo = 0; double cummulative_principal = 0; double principal = 0; double month_int = 0; double total_month = 0; double cumm_amt_due = 0; DateTime mo_from; DateTime month_to; int no_of_monthdays;
                        mo_from = disdate;
                        for (int i = 0; i <= (NumberOfPayments - 1); i++)
                        {
                            rep_mo = rep_mo + 1;
                            // DateTime tempmoto = mo_from.AddDays(-1);
                            month_to = mo_from.AddMonths(1);
                            // string yearstr = mo_from.ToString("YYYY");
                            //int yearint = mo_from.Year;
                            // string monthstr = mo_from.ToString("MM");
                            //int monthint = Convert.ToInt32(monthstr);
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
                            SqlCommand createschedule = new SqlCommand("insert into amortization_Schedule (amortization_id,loan_id,customer_unique_id,row_month,date_from,date_to,no_of_mo_days,principal_rep_mo,cbn_int,month_int,mo_total,cumm_amt_due,date_of_creation) values(@amoid,@loanid,@custid,@rowmonth,@datefrom,@dateto,@noofmonthdays,@princrepmo,@intr,@moint,@motot,@cummamtdue,@dateofcr)", sc);
                            createschedule.Parameters.AddWithValue("@amoid", loanguid);
                            createschedule.Parameters.AddWithValue("@loanid", loanuniqueid);
                            createschedule.Parameters.AddWithValue("@custid", cust_id);
                            createschedule.Parameters.AddWithValue("@rowmonth", rep_mo);
                            createschedule.Parameters.AddWithValue("@datefrom", mo_from);
                            createschedule.Parameters.AddWithValue("@dateto", month_to);
                            createschedule.Parameters.AddWithValue("@noofmonthdays", no_of_monthdays);
                            createschedule.Parameters.AddWithValue("@princrepmo", PaymentAmount);
                            createschedule.Parameters.AddWithValue("@intr", Convert.ToDouble(Number7.Value));
                            createschedule.Parameters.AddWithValue("@moint", month_int);
                            createschedule.Parameters.AddWithValue("@motot", total_month);
                            createschedule.Parameters.AddWithValue("@cummamtdue", cumm_amt_due);
                            createschedule.Parameters.AddWithValue("@dateofcr", entrydate);
                            createschedule.ExecuteNonQuery();
                            mo_from = month_to;

                        }
                    }
                }
                sc.Close();

                Response.Write("<script>alert('Loan Record Added Successfully and Schedule Created!');</script>");
                Number7.Value = string.Empty;
                TextBox2.Text = string.Empty;
                Number8.Value = string.Empty;
                Date2.Value = string.Empty;
                // Date3.Value = string.Empty;
                Number6.Value = string.Empty;
                customertin.Text = string.Empty;
                Textarea1.Value = string.Empty;
                end:
                { }

            }
            catch (Exception err)
            {
                alert.Visible = true;
                alert.InnerHtml = err.Message;
            }
        }
    

        protected void clear_corp(object sender, EventArgs e)
        {
            Number7.Value = string.Empty;
            TextBox2.Text = string.Empty;
            Number8.Value = string.Empty;
            Date2.Value = string.Empty;
           // Date3.Value = string.Empty;
            Number6.Value = string.Empty;
        }










        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void cal_corp(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(1000);
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
            double NumberOfYears = Convert.ToDouble(TextBox2.Text) / 12;
            moratorium = (Convert.ToDouble(Number8.Value)) / 12;
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
                if (Number8.Value == "0")
                {
                    moratorium = 0;
                }
                else
                {
                    moratorium = Convert.ToDouble(Number8.Value) / 12;
                }


                NumberOfPayments = (NumberOfYears - moratorium) * 12;
                PaymentAmount = (LoanAmount) / (NumberOfPayments);
                PaymentAmount = Math.Round(PaymentAmount, 1);


                repaymentwindow.Visible = true;
                Number10.Visible = true;
                Number9.Visible = true;
                string naira = "₦" + String.Format("{0:#,##0.00}", PaymentAmount);
                Number9.Text = naira;
                Number10.Text = NumberOfPayments.ToString();
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

        protected void create_schedule_ind(object sender, EventArgs e)
        {

        }


        public void dodmb()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select bank_name from bank_dmbs", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList7.DataSource = ds;
            DropDownList7.DataBind();
            DropDownList7.DataTextField = "bank_name";
            DropDownList7.DataValueField = "bank_name";


            DropDownList7.DataBind();
            sc.Close();
        }
        public void domfb()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select bank_name from bank_mfbs", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList7.DataSource = ds;
            DropDownList7.DataBind();
            DropDownList7.DataTextField = "bank_name";
            DropDownList7.DataValueField = "bank_name";


            DropDownList7.DataBind();
            sc.Close();
        }
        public void merch()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select bank_name from bank_merchant", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList7.DataSource = ds;
            DropDownList7.DataBind();
            DropDownList7.DataTextField = "bank_name";
            DropDownList7.DataValueField = "bank_name";


            DropDownList7.DataBind();
            sc.Close();
        }
        public void dfi()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select bank_name from bank_dfis", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList7.DataSource = ds;
            DropDownList7.DataBind();
            DropDownList7.DataTextField = "bank_name";
            DropDownList7.DataValueField = "bank_name";


            DropDownList7.DataBind();
            sc.Close();
        }
        public void cooperatives()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select bank_name from bank_cooperative", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList7.DataSource = ds;
            DropDownList7.DataBind();
            DropDownList7.DataTextField = "bank_name";
            DropDownList7.DataValueField = "bank_name";


            DropDownList7.DataBind();
            sc.Close();
        }
        public void ngomfi()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select bank_name from bank_ngomfi", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList7.DataSource = ds;
            DropDownList7.DataBind();
            DropDownList7.DataTextField = "bank_name";
            DropDownList7.DataValueField = "bank_name";


            DropDownList7.DataBind();
            sc.Close();
        }

        protected void corp_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList4.SelectedItem.Value == "DMBs")
            {
                dodmb();
            }
            else if (DropDownList4.SelectedItem.Value == "MERCHANT BANK")
            {
                merch();
            }
            else if (DropDownList4.SelectedItem.Value == "MFBs")
            {
                domfb();
            }
            else if (DropDownList4.SelectedItem.Value == "DFIs")
            {
                dfi();
            }
            else if (DropDownList4.SelectedItem.Value == "FINANCIAL COOPERATIVES")
            {
                cooperatives();
            }
            else if (DropDownList4.SelectedItem.Value == "NGO-MFIs")
            {
                ngomfi();
            }
            else
            {
                DropDownList4.SelectedItem.Value = "Select";
            }

        }




        protected void corp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {


            }
        }
        protected void OnPageIndexChanging_corp(object sender, GridViewPageEventArgs e)
        {

        }
        protected void corp_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void corp_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                (e.Row.FindControl("lblRowNumber") as Label).Text = (e.Row.RowIndex + 1).ToString();

            }
        }
        private void BindGrid2()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_customer where customer_type='CORPORATE'", sc))
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
                    }
                }
            }
        }


        protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {

                string loandetails = e.CommandArgument.ToString();
                customertin.Text = loandetails;
                Response.Write("<script>alert('You have Selected customer TIN: " + loandetails + "');</script>");

            }
        }


    }
}