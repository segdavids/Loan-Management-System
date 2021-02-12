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

namespace CBNLMS.Admin
{
    public partial class state_loan : System.Web.UI.Page
    {
         SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            protected void Page_Load(object sender, EventArgs e)
            {
                if (IsPostBack)
                {
                    repaymentwindow.Visible = false;
                }
                else
                {
                string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true); repaymentwindow.Visible = false;
                    factype();
                    //popbank();
                    fillpaymentmode();
                    // poptin();
                    popstate();
                    getWhileLoopDataind();
                    popintervention();
                    sector();
                    stateofbus();
          
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
                DropDownList23.DataSource = ds;
                DropDownList23.DataBind();
                DropDownList23.DataTextField = "bus_sector";
                DropDownList23.DataValueField = "bus_sector";

                DropDownList23.DataBind();
                sc.Close();
            }
            public void stateofbus()
            {
                sc.Open();
                SqlCommand com = new SqlCommand("select * from states", sc); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                DropDownList24.DataSource = ds;
                DropDownList24.DataBind();
                DropDownList24.DataTextField = "state";
                DropDownList24.DataValueField = "state";

                DropDownList24.DataBind();
                sc.Close();
            }
            public void popintervention()
            {
                sc.Open();
                SqlCommand com = new SqlCommand("select * from interventions where acronym !='ABP'", sc); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                DropDownList13.DataSource = ds;
                DropDownList13.DataBind();
                DropDownList13.DataTextField = "acronym";
                DropDownList13.DataValueField = "acronym";

                DropDownList13.DataBind();
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
                DropDownList16.DataSource = ds;
                DropDownList16.DataBind();
                DropDownList16.DataTextField = "bank";
                DropDownList16.DataValueField = "bank";

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
                DropDownList17.DataSource = ds;
                DropDownList17.DataBind();
                DropDownList17.DataValueField = "facility_type";

                DropDownList17.DataTextField = "facility_type";

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

                DropDownList18.DataSource = ds2;
                DropDownList18.DataBind();
                DropDownList18.DataTextField = "payment_mode";
                DropDownList18.DataValueField = "payment_mode";

                DropDownList18.DataBind();
                sc.Close();
            }

         

            protected void clear_ind(object sender, EventArgs e)
            {

            }



    

          
            protected void add_state(object sender, EventArgs e)
            {
            try
            {
                System.Threading.Thread.Sleep(1000);
                string geozone;
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
             
                if (string.IsNullOrWhiteSpace(Number13.Value))
                {
                    Response.Write("<script>alert('Moratorium Required!');</script>");
                    goto end;
                }
                string selected = DropDownList24.SelectedItem.Text;
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
                double LoanAmount = Convert.ToDouble(Number11.Value);
                double tenure = Convert.ToDouble(TextBox3.Text);
                double NumberOfYears = Math.Round((tenure / 12), 2); ;
                moratorium = Convert.ToDouble(Number13.Value) / 12;
                double NumberOfPayments = (NumberOfYears - moratorium) * 12;
                PaymentAmount = (LoanAmount) / (NumberOfPayments);
                PaymentAmount = Math.Round(PaymentAmount, 2);
                string cust_id = DropDownList15.SelectedItem.Value.ToString();
                DateTime entrydate = DateTime.Now;
                TimeSpan entrytim = DateTime.Now.TimeOfDay;
                DateTime disdate = DateTime.Parse(Date5.Value.ToString());
                DateTime expdate = disdate.AddMonths(Convert.ToInt32(tenure)); sc.Open();
                SqlCommand check = new SqlCommand("select state_name, customer_type from all_customer where state_name = @bvn", sc);
                check.Parameters.AddWithValue("@bvn", cust_id);
                SqlDataReader rd = check.ExecuteReader();
                while (rd.Read())
                {
                    string statename = rd.GetString(0);
                    string ctype = rd.GetString(1);
                    Guid loanguid = Guid.NewGuid();
                    string loanstatus = "Pending";
                    SqlCommand cmd3 = new SqlCommand("insert into all_loans (loan_guid,customer_unique_id,customer_name,customer_type,intervention,bank,bank_name,facility_type,bus_stat,bus_geozone,sector,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,month_inst,num_of_inst,exp_date,loan_purpose,loan_status,date_created,time_created) values(@lguid,@custid,@fullname,@ctype,@intervention,@bank,@bank_name,@fact,@busstate,@buszone,@sector,@pmode,@lamt,@intr,@tenure,@mora,@sd,@payamt,@moins,@norep,@ed,@loan_purpose,@status,@entrydate,@entrytime)", sc);
                    cmd3.Parameters.AddWithValue("@lguid", loanguid);
                    cmd3.Parameters.AddWithValue("@custid", cust_id);
                    cmd3.Parameters.AddWithValue("@fullname", statename);
                    cmd3.Parameters.AddWithValue("@ctype", ctype);
                    cmd3.Parameters.AddWithValue("@intervention", DropDownList13.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@bank", DropDownList16.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@bank_name", DropDownList14.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@busstate", DropDownList24.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@buszone", geozone);
                    cmd3.Parameters.AddWithValue("@sector", DropDownList23.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@fact", DropDownList17.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@pmode", DropDownList18.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@lamt", LoanAmount);
                    cmd3.Parameters.AddWithValue("@intr", Convert.ToDouble(Number12.Value));
                    cmd3.Parameters.AddWithValue("@tenure", NumberOfYears);
                    cmd3.Parameters.AddWithValue("@mora", Convert.ToDouble(Number13.Value));
                    cmd3.Parameters.AddWithValue("@sd", disdate);
                    cmd3.Parameters.AddWithValue("@payamt", PaymentAmount);
                    cmd3.Parameters.AddWithValue("@moins", PaymentAmount);
                    cmd3.Parameters.AddWithValue("@norep", NumberOfPayments);
                    cmd3.Parameters.AddWithValue("@ed", expdate);
                    cmd3.Parameters.AddWithValue("@loan_purpose", Textarea2.Value);
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
                        double intrate = ((Convert.ToDouble(Number12.Value)) / 100);
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
                            createschedule.Parameters.AddWithValue("@intr", Convert.ToDouble(Number12.Value));
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
                Number12.Value = string.Empty;
                TextBox3.Text = string.Empty;
                Number13.Value = string.Empty;
                Date5.Value = string.Empty;
                //Date6.Value = string.Empty;
                Number11.Value = string.Empty;
                end:
                { }
            }
            catch (Exception err)
            {
                alert.Visible = true;
                alert.InnerHtml = err.Message;
            }
        }

            protected void clear_state(object sender, EventArgs e)
            {
                Number12.Value = string.Empty;
                TextBox3.Text = string.Empty;
                Number13.Value = string.Empty;
                Date5.Value = string.Empty;
              //  Date6.Value = string.Empty;
                Number11.Value = string.Empty;
            }

     



     


  

          

            protected void cal_state(object sender, EventArgs e)
            {
            System.Threading.Thread.Sleep(1000);

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
                double NumberOfYears = Convert.ToDouble(TextBox3.Text)/12;
                moratorium = (Convert.ToDouble(Number13.Value)) / 12;
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

                    moratorium = Convert.ToDouble(Number13.Value) / 12;
                    NumberOfPayments = (NumberOfYears - moratorium) * 12;
                    PaymentAmount = (LoanAmount) / (NumberOfPayments);
                    PaymentAmount = Math.Round(PaymentAmount, 2);


                repaymentwindow.Visible = true;
                Number14.Visible = true;
                Number15.Visible = true;
                    string naira = "₦" + String.Format("{0:#,##0.000}", PaymentAmount);
                    Number14.Text = naira;
                    Number15.Text = NumberOfPayments.ToString();
                }
                end:
                { }
            }
        protected void facilitytypechanged(object sender, EventArgs e)
        {
            wcplustl();

        }
        public void wcplustl()
        {
            if (DropDownList17.SelectedItem.Text == "WORKING CAPITAL + TERM LOAN")
            {
                reporttodiv.Visible = true;
                wcortlamount.InnerHtml = "Term Loan Amount Disbursed";
                Number11.Attributes.Add("Placeholder", "Enter the Term Loan Amount Disbursed");
                wcortltenure.InnerHtml = "Term Loan Tenure(Months)";
                TextBox3.Attributes.Add("Placeholder", "Term Loan Tenure in Months");

            }
            else if (DropDownList17.SelectedItem.Text == "WORKING CAPITAL")
            {
                reporttodiv.Visible = false;
                Number13.Disabled = true;
                wcortlamount.InnerHtml = "Working Capital Amount Disbursed";
                Number11.Attributes.Add("Placeholder", "Enter the Working Capital Amount Disbursed");
                wcortltenure.InnerHtml = "Working Capital Loan Tenure(Months)";
                TextBox3.Attributes.Add("Placeholder", "Working Capital Loan Tenure in Months");
            }
            else if (DropDownList17.SelectedItem.Text == "TERM LOAN")
            {
                reporttodiv.Visible = false;
                Number13.Disabled = false;
                wcortlamount.InnerHtml = "Term Loan Amount Disbursed";
                Number11.Attributes.Add("Placeholder", "Enter the Term Loan Amount Disbursed");
                wcortltenure.InnerHtml = "Term Loan Tenure(Months)";
                TextBox3.Attributes.Add("Placeholder", "Term Loan Tenure in Months");
            }
            else
            {
                reporttodiv.Visible = false;
                wcortlamount.InnerHtml = "Amount Disbursed";
                Number11.Attributes.Add("Placeholder", "Enter the Loan Amount Disbursed");
                wcortltenure.InnerHtml = "Loan Tenure(Months)";
                TextBox3.Attributes.Add("Placeholder", "Loan Tenure in Months");
            }
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
                DropDownList14.DataSource = ds;
                DropDownList14.DataBind();
                DropDownList14.DataTextField = "bank_name";
                DropDownList14.DataValueField = "bank_name";


                DropDownList14.DataBind();
                sc.Close();
            }
            public void domfb()
            {
                sc.Open();
                SqlCommand com = new SqlCommand("select bank_name from bank_mfbs", sc); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                DropDownList14.DataSource = ds;
                DropDownList14.DataBind();
                DropDownList14.DataTextField = "bank_name";
                DropDownList14.DataValueField = "bank_name";


                DropDownList14.DataBind();
                sc.Close();
            }
            public void merch()
            {
                sc.Open();
                SqlCommand com = new SqlCommand("select bank_name from bank_merchant", sc); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                DropDownList14.DataSource = ds;
                DropDownList14.DataBind();
                DropDownList14.DataTextField = "bank_name";
                DropDownList14.DataValueField = "bank_name";


                DropDownList14.DataBind();
                sc.Close();
            }
            public void dfi()
            {
                sc.Open();
                SqlCommand com = new SqlCommand("select bank_name from bank_dfis", sc); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                DropDownList14.DataSource = ds;
                DropDownList14.DataBind();
                DropDownList14.DataTextField = "bank_name";
                DropDownList14.DataValueField = "bank_name";


                DropDownList14.DataBind();
                sc.Close();
            }
            public void cooperatives()
            {
                sc.Open();
                SqlCommand com = new SqlCommand("select bank_name from bank_cooperative", sc); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                DropDownList14.DataSource = ds;
                DropDownList14.DataBind();
                DropDownList14.DataTextField = "bank_name";
                DropDownList14.DataValueField = "bank_name";


                DropDownList14.DataBind();
                sc.Close();
            }
            public void ngomfi()
            {
                sc.Open();
                SqlCommand com = new SqlCommand("select bank_name from bank_ngomfi", sc); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                DropDownList14.DataSource = ds;
                DropDownList14.DataBind();
                DropDownList14.DataTextField = "bank_name";
                DropDownList14.DataValueField = "bank_name";


                DropDownList14.DataBind();
                sc.Close();
            }

        

            protected void state_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (DropDownList16.SelectedItem.Value == "DMBs")
                {
                    dodmb();
                }
                else if (DropDownList16.SelectedItem.Value == "MERCHANT BANK")
                {
                    merch();
                }
                else if (DropDownList16.SelectedItem.Value == "MFBs")
                {
                    domfb();
                }
                else if (DropDownList16.SelectedItem.Value == "DFIs")
                {
                    dfi();
                }
                else if (DropDownList16.SelectedItem.Value == "FINANCIAL COOPERATIVES")
                {
                    cooperatives();
                }
                else if (DropDownList16.SelectedItem.Value == "NGO-MFIs")
                {
                    ngomfi();
                }
                else
                {
                    DropDownList16.SelectedItem.Value = "Select";
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
          
         

         
        }
    }