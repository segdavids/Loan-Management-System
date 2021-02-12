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
using System.Text;

using System.Data.OleDb;
namespace CBNLMS.Inputing._7
{
    public partial class aads_newloanOLD : System.Web.UI.Page
    {
        string emailz;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {

            }
            emailz = Session["Email"].ToString();
            if (IsPostBack)
            {
                Div2.Visible = false;

            }
            else
            {
                string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                Div2.Visible = false;
                factype();
                //popbank();
                fillpaymentmode();
                // poptin();
                popstate();
                getWhileLoopDataind();
                //popintervention();
                sector();
                stateofbus();
                BindGrid2();
                BindGrid1();
            }
        }
        protected void download_template(object sender, EventArgs e)
        {
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            string filePath = "~/assets/forms/loan_form_template.xlsx";
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
            try
            {
                System.Threading.Thread.Sleep(1000);
                if (!FileUpload1.HasFile)
            {
                Response.Write("<script>alert('Select at least 1 file');</script>");
            }
            else if (FileUpload1.HasFile)
            {
                //Upload and save the file
                string excelPath = Server.MapPath("~/assets/uploads/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(excelPath);

                string conString = string.Empty;
                string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                switch (extension)
                {
                    case ".xls": //Excel 97-03
                        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                        break;
                    case ".xlsx": //Excel 07 or higher
                        conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                        break;

                }
                conString = string.Format(conString, excelPath);
                using (OleDbConnection excel_con = new OleDbConnection(conString))
                {
                    excel_con.Open();
                    string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                    DataTable dtExcelData = new DataTable();

                    //[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
                    dtExcelData.Columns.AddRange(new DataColumn[33] { new DataColumn("loan_guid", typeof(string)),
                new DataColumn("customer_unique_id", typeof(string)),
                new DataColumn("customer_name", typeof(string)),
                new DataColumn("customer_type", typeof(string)),
                new DataColumn("comm_assoc_name", typeof(string)),
                new DataColumn("anchor_type", typeof(string)),
                new DataColumn("intervention", typeof(string)),
                new DataColumn("bank", typeof(string)),
                new DataColumn("bank_name", typeof(string)),
                new DataColumn("facility_type", typeof(string)),
                new DataColumn("bus_stat", typeof(string)),
                new DataColumn("bus_geozone", typeof(string)),
                new DataColumn("sector", typeof(string)),
                new DataColumn("payment_mode", typeof(string)),
                new DataColumn("loan_amount", typeof(double)),
                new DataColumn("interest_rate", typeof(double)),
                new DataColumn("num_of_yrs", typeof(double)),
                new DataColumn("moratorium", typeof(double)),
                new DataColumn("start_date", typeof(DateTime)),
                new DataColumn("month_inst", typeof(double)),
                new DataColumn("num_of_inst", typeof(double)),
                new DataColumn("exp_date", typeof(DateTime)),
                new DataColumn("loan_purpose", typeof(string)),
                new DataColumn("loan_amt_out", typeof(double)),
                new DataColumn("principal_repaid", typeof(double)),
                new DataColumn("amt_repaid", typeof(double)),
                new DataColumn("principal_due", typeof(double)),
                new DataColumn("cumm_int_due", typeof(double)),
                new DataColumn("interest_paid", typeof(double)),
                new DataColumn("interest_due", typeof(double)),
                new DataColumn("loan_status", typeof(string)),
                new DataColumn("date_created", typeof(DateTime)),
                new DataColumn("time_created", typeof(DateTime)) });

                    using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                    {
                        oda.Fill(dtExcelData);
                    }
                    excel_con.Close();

                    string consString = ConfigurationManager.ConnectionStrings["cbndbConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(consString))
                    {
                        using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                        {
                            //Set the database table name
                            sqlBulkCopy.DestinationTableName = "dbo.all_loans";
                            //string password = generator.RandomPassword();
                            //[OPTIONAL]: Map the Excel columns with that of the database table
                            sqlBulkCopy.ColumnMappings.Add("loan_guid", "loan_guid");
                            sqlBulkCopy.ColumnMappings.Add("customer_unique_id", "customer_unique_id");
                            sqlBulkCopy.ColumnMappings.Add("customer_name", "customer_name");
                            sqlBulkCopy.ColumnMappings.Add("customer_type", "customer_type");
                            sqlBulkCopy.ColumnMappings.Add("comm_assoc_name", "comm_assoc_name");
                            sqlBulkCopy.ColumnMappings.Add("anchor_type", "anchor_type");
                            sqlBulkCopy.ColumnMappings.Add("intervention", "intervention");
                            sqlBulkCopy.ColumnMappings.Add("bank", "bank");
                            sqlBulkCopy.ColumnMappings.Add("bank_name", "bank_name");
                            sqlBulkCopy.ColumnMappings.Add("facility_type", "facility_type");
                            sqlBulkCopy.ColumnMappings.Add("bus_stat", "bus_stat");
                            sqlBulkCopy.ColumnMappings.Add("bus_geozone", "bus_geozone");
                            sqlBulkCopy.ColumnMappings.Add("sector", "sector");
                            sqlBulkCopy.ColumnMappings.Add("payment_mode", "payment_mode");
                            sqlBulkCopy.ColumnMappings.Add("loan_amount", "loan_amount");
                            sqlBulkCopy.ColumnMappings.Add("interest_rate", "interest_rate");
                            sqlBulkCopy.ColumnMappings.Add("num_of_yrs", "num_of_yrs");
                            sqlBulkCopy.ColumnMappings.Add("moratorium", "moratorium");
                            sqlBulkCopy.ColumnMappings.Add("start_date", "start_date");
                            sqlBulkCopy.ColumnMappings.Add("month_inst", "month_inst");
                            sqlBulkCopy.ColumnMappings.Add("num_of_inst", "num_of_inst");
                            sqlBulkCopy.ColumnMappings.Add("exp_date", "exp_date");
                            sqlBulkCopy.ColumnMappings.Add("loan_purpose", "loan_purpose");
                            sqlBulkCopy.ColumnMappings.Add("loan_amt_out", "loan_amt_out");
                            sqlBulkCopy.ColumnMappings.Add("principal_repaid", "principal_repaid");
                            sqlBulkCopy.ColumnMappings.Add("amt_repaid", "amt_repaid");
                            sqlBulkCopy.ColumnMappings.Add("principal_due", "principal_due");
                            sqlBulkCopy.ColumnMappings.Add("cumm_int_due", "cumm_int_due");
                            sqlBulkCopy.ColumnMappings.Add("interest_paid", "interest_paid");
                            sqlBulkCopy.ColumnMappings.Add("interest_due", "interest_due");
                            sqlBulkCopy.ColumnMappings.Add("loan_status", "loan_status");
                            sqlBulkCopy.ColumnMappings.Add("date_created", "date_created");
                            sqlBulkCopy.ColumnMappings.Add("time_created", "time_created");
                            con.Open();
                            sqlBulkCopy.WriteToServer(dtExcelData);

                            string useractivity = "Creation of " + (dtExcelData.Rows.Count).ToString() + " Loans";
                            DateTime now = DateTime.Now;
                            SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", con);
                            cmd3.Parameters.AddWithValue("@user", emailz);
                            cmd3.Parameters.AddWithValue("@activity", useractivity);
                            cmd3.Parameters.AddWithValue("@datetime", now);
                            cmd3.ExecuteNonQuery();
                            Div2.Visible = true;

                            con.Close();
                        }
                    }
                }
            }
            }
            catch (Exception err)
            {
                Div2.Visible = true;
                Div2.InnerHtml = err.Message;
            }
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
            DropDownList19.DataSource = ds;
            DropDownList21.DataSource = ds;
            DropDownList23.DataSource = ds;
            DropDownList19.DataBind();
            DropDownList21.DataBind();
            DropDownList23.DataBind();
            DropDownList19.DataTextField = "bus_sector";
            DropDownList21.DataTextField = "bus_sector";
            DropDownList23.DataTextField = "bus_sector";
            DropDownList19.DataValueField = "bus_sector";
            DropDownList21.DataValueField = "bus_sector";
            DropDownList23.DataValueField = "bus_sector";

            DropDownList19.DataBind();
            DropDownList21.DataBind();
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
            DropDownList20.DataSource = ds;
            DropDownList22.DataSource = ds;
            DropDownList24.DataSource = ds;
            DropDownList20.DataBind();
            DropDownList24.DataBind();
            DropDownList22.DataBind();
            DropDownList24.DataTextField = "state";
            DropDownList22.DataTextField = "state";
            DropDownList20.DataTextField = "state";
            DropDownList20.DataValueField = "state";
            DropDownList22.DataValueField = "state";
            DropDownList24.DataValueField = "state";

            DropDownList20.DataBind();
            DropDownList22.DataBind();
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
            DropDownList6.DataSource = ds;
            DropDownList1.DataSource = ds;
            DropDownList13.DataSource = ds;
            DropDownList6.DataBind();
            DropDownList13.DataBind();
            DropDownList1.DataBind();
            DropDownList6.DataTextField = "acronym";
            DropDownList13.DataTextField = "acronym";
            DropDownList1.DataTextField = "acronym";
            DropDownList6.DataValueField = "acronym";
            DropDownList1.DataValueField = "acronym";
            DropDownList13.DataValueField = "acronym";

            DropDownList6.DataBind();
            DropDownList1.DataBind();
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



        protected void add_corp(object sender, EventArgs e)
        {
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
            double NumberOfYears = Convert.ToDouble(TextBox2.Text);
            moratorium = Convert.ToDouble(Number8.Value) / 12;
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
            string cust_id = customertin.Text.ToString();
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
                Guid loanguid = Guid.NewGuid();
                string loanstatus = "Pending";
                SqlCommand cmd3 = new SqlCommand("insert into all_loans (loan_guid,customer_unique_id,customer_name,customer_type,intervention,bank,bank_name,facility_type,bus_stat,bus_geozone,sector,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,month_inst,num_of_inst,exp_date,loan_purpose,loan_status,date_created,time_created) values(@lguid,@custid,@fullname,@ctype,@intervention,@bank,@bank_name,@fact,@busstate,@buszone,@sector,@pmode,@lamt,@intr,@tenure,@mora,@sd,@payamt,@moins,@norep,@ed,@loan_purpose,@status,@entrydate,@entrytime)", sc);
                cmd3.Parameters.AddWithValue("@lguid", loanguid);
                cmd3.Parameters.AddWithValue("@custid", cust_id);
                cmd3.Parameters.AddWithValue("@fullname", orgname);
                cmd3.Parameters.AddWithValue("@ctype", ctype);
                cmd3.Parameters.AddWithValue("@intervention", DropDownList1.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank", DropDownList4.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank_name", DropDownList14.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@fact", DropDownList5.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@busstate", DropDownList22.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@buszone", geozone);
                cmd3.Parameters.AddWithValue("@sector", DropDownList21.SelectedItem.Text);
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
            Date3.Value = string.Empty;
            Number6.Value = string.Empty;
            customertin.Text = string.Empty;
            Textarea1.Value = string.Empty;
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
            double NumberOfYears = Convert.ToDouble(TextBox3.Text);
            moratorium = Convert.ToDouble(Number13.Value) / 12;
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
                Guid loanguid = Guid.NewGuid();
                string loanstatus = "Pending";
                SqlCommand cmd3 = new SqlCommand("insert into all_loans (loan_guid,customer_unique_id,customer_name,customer_type,intervention,bank,bank_name,facility_type,bus_stat,bus_geozone,sector,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,month_inst,num_of_inst,exp_date,loan_purpose,loan_status,date_created,time_created) values(@lguid,@custid,@fullname,@ctype,@intervention,@bank,@bank_name,@fact,@busstate,@buszone,@sector,@pmode,@lamt,@intr,@tenure,@mora,@sd,@payamt,@moins,@norep,@ed,@loan_purpose,@status,@entrydate,@entrytime)", sc);
                cmd3.Parameters.AddWithValue("@lguid", loanguid);
                cmd3.Parameters.AddWithValue("@custid", cust_id);
                cmd3.Parameters.AddWithValue("@fullname", statename);
                cmd3.Parameters.AddWithValue("@ctype", ctype);
                cmd3.Parameters.AddWithValue("@intervention", DropDownList13.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank", DropDownList16.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank_name", DropDownList7.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@busstate", DropDownList24.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@buszone", geozone);
                cmd3.Parameters.AddWithValue("@sector", DropDownList23.SelectedItem.Text);
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
            string geozone;
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
            if (string.IsNullOrWhiteSpace(TextBox4.Text))
            {
                Response.Write("<script>alert('Kindly Select a customer');</script>");
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
            string selected = DropDownList20.SelectedItem.Text;
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
            double LoanAmount = Convert.ToDouble(Number1.Value);
            double NumberOfYears = Convert.ToDouble(TextBox1.Value);
            moratorium = Convert.ToDouble(Number3.Value) / 12;
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
            string cust_id = TextBox4.Text.ToString();
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            DateTime disdate = DateTime.Parse(Date1.Value.ToString());
            DateTime expdate = DateTime.Parse(Date4.Value.ToString());
            DateTime firstrepaymentdate = disdate.AddMonths(Convert.ToInt32(Number3.Value));
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
                Guid loanguid = Guid.NewGuid();
                string loanstatus = "Pending";
                SqlCommand cmd3 = new SqlCommand("insert into all_loans (loan_guid,customer_unique_id,customer_name,customer_type,intervention,bank,bank_name,facility_type,bus_stat,bus_geozone,sector,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,month_inst,num_of_inst,first_repayment_date,exp_date,loan_purpose,loan_status,date_created,time_created) values(@lguid,@custid,@fullname,@ctype,@intervention,@bank,@bank_name,@fact,@busstate,@buszone,@sector,@pmode,@lamt,@intr,@tenure,@mora,@sd,@payamt,@moins,@norep,@first_repayment_date,@ed,@loan_purpose,@status,@entrydate,@entrytime)", sc);
                cmd3.Parameters.AddWithValue("@lguid", loanguid);
                cmd3.Parameters.AddWithValue("@custid", cust_id);
                cmd3.Parameters.AddWithValue("@fullname", fullname);
                cmd3.Parameters.AddWithValue("@ctype", ctype);
                cmd3.Parameters.AddWithValue("@intervention", DropDownList6.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank", DropDownList9.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@bank_name", DropDownList2.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@fact", DropDownList11.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@busstate", DropDownList20.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@buszone", geozone);
                cmd3.Parameters.AddWithValue("@sector", DropDownList19.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@pmode", DropDownList12.SelectedItem.Text);
                cmd3.Parameters.AddWithValue("@lamt", LoanAmount);
                cmd3.Parameters.AddWithValue("@intr", Convert.ToDouble(Number2.Value));
                cmd3.Parameters.AddWithValue("@tenure", Convert.ToDouble(TextBox1.Value));
                cmd3.Parameters.AddWithValue("@mora", Convert.ToDouble(Number3.Value));
                cmd3.Parameters.AddWithValue("@sd", disdate);
                cmd3.Parameters.AddWithValue("@payamt", PaymentAmount);
                cmd3.Parameters.AddWithValue("@moins", PaymentAmount);
                cmd3.Parameters.AddWithValue("@norep", NumberOfPayments);
                cmd3.Parameters.AddWithValue("@first_repayment_date", firstrepaymentdate);
                cmd3.Parameters.AddWithValue("@ed", expdate);
                cmd3.Parameters.AddWithValue("@loan_purpose", loan_purpose.Value);
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
                    double intrate = ((Convert.ToDouble(Number2.Value)) / 100);
                    int rep_mo = 0; double cummulative_principal = 0; double principal = 0; double month_int = 0; double total_month = 0; double cumm_amt_due = 0; DateTime mo_from; DateTime month_to; int no_of_monthdays;
                    mo_from = firstrepaymentdate;
                    for (int i = 0; i <= (NumberOfPayments); i++)
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
                        createschedule.Parameters.AddWithValue("@intr", Convert.ToDouble(Number2.Value));
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
            Number1.Value = string.Empty;
            Number2.Value = string.Empty;
            TextBox1.Value = string.Empty;
            Date1.Value = string.Empty;
            Date4.Value = string.Empty;
            Number3.Value = string.Empty;
            TextBox4.Text = string.Empty;
            loan_purpose.Value = string.Empty;
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


            moratorium = Convert.ToDouble(Number3.Value) / 12;
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

                moratorium = Convert.ToDouble(Number3.Value) / 12;
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

        protected void create_schedule_ind(object sender, EventArgs e)
        {

        }

        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList9.SelectedItem.Value == "DMBs")
            {
                dodmb();
            }
            else if (DropDownList9.SelectedItem.Value == "MERCHANT BANK")
            {
                merch();
            }
            else if (DropDownList9.SelectedItem.Value == "MFBs")
            {
                domfb();
            }
            else if (DropDownList9.SelectedItem.Value == "DFIs")
            {
                dfi();
            }
            else if (DropDownList9.SelectedItem.Value == "FINANCIAL COOPERATIVES")
            {
                cooperatives();
            }
            else if (DropDownList9.SelectedItem.Value == "NGO-MFIs")
            {
                ngomfi();
            }
            else
            {
                DropDownList9.SelectedItem.Value = "Select";
            }


        }
        public void dodmb()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select bank_name from bank_dmbs", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList2.DataSource = ds;
            DropDownList7.DataSource = ds;
            DropDownList14.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList7.DataBind();
            DropDownList14.DataBind();
            DropDownList2.DataTextField = "bank_name";
            DropDownList7.DataTextField = "bank_name";
            DropDownList14.DataTextField = "bank_name";
            DropDownList2.DataValueField = "bank_name";
            DropDownList7.DataValueField = "bank_name";
            DropDownList14.DataValueField = "bank_name";


            DropDownList2.DataBind();
            DropDownList7.DataBind();
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
            DropDownList2.DataSource = ds;
            DropDownList7.DataSource = ds;
            DropDownList14.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList7.DataBind();
            DropDownList14.DataBind();
            DropDownList2.DataTextField = "bank_name";
            DropDownList7.DataTextField = "bank_name";
            DropDownList14.DataTextField = "bank_name";
            DropDownList2.DataValueField = "bank_name";
            DropDownList7.DataValueField = "bank_name";
            DropDownList14.DataValueField = "bank_name";


            DropDownList2.DataBind();
            DropDownList7.DataBind();
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
            DropDownList2.DataSource = ds;
            DropDownList7.DataSource = ds;
            DropDownList14.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList7.DataBind();
            DropDownList14.DataBind();
            DropDownList2.DataTextField = "bank_name";
            DropDownList7.DataTextField = "bank_name";
            DropDownList14.DataTextField = "bank_name";
            DropDownList2.DataValueField = "bank_name";
            DropDownList7.DataValueField = "bank_name";
            DropDownList14.DataValueField = "bank_name";


            DropDownList2.DataBind();
            DropDownList7.DataBind();
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
            DropDownList2.DataSource = ds;
            DropDownList7.DataSource = ds;
            DropDownList14.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList7.DataBind();
            DropDownList14.DataBind();
            DropDownList2.DataTextField = "bank_name";
            DropDownList7.DataTextField = "bank_name";
            DropDownList14.DataTextField = "bank_name";
            DropDownList2.DataValueField = "bank_name";
            DropDownList7.DataValueField = "bank_name";
            DropDownList14.DataValueField = "bank_name";


            DropDownList2.DataBind();
            DropDownList7.DataBind();
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
            DropDownList2.DataSource = ds;
            DropDownList7.DataSource = ds;
            DropDownList14.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList7.DataBind();
            DropDownList14.DataBind();
            DropDownList2.DataTextField = "bank_name";
            DropDownList7.DataTextField = "bank_name";
            DropDownList14.DataTextField = "bank_name";
            DropDownList2.DataValueField = "bank_name";
            DropDownList7.DataValueField = "bank_name";
            DropDownList14.DataValueField = "bank_name";


            DropDownList2.DataBind();
            DropDownList7.DataBind();
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
            DropDownList2.DataSource = ds;
            DropDownList7.DataSource = ds;
            DropDownList14.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList7.DataBind();
            DropDownList14.DataBind();
            DropDownList2.DataTextField = "bank_name";
            DropDownList7.DataTextField = "bank_name";
            DropDownList14.DataTextField = "bank_name";
            DropDownList2.DataValueField = "bank_name";
            DropDownList7.DataValueField = "bank_name";
            DropDownList14.DataValueField = "bank_name";


            DropDownList2.DataBind();
            DropDownList7.DataBind();
            DropDownList14.DataBind();
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
        private void BindGrid1()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_customer where customer_type='INDIVIDUAL'", sc))
            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater2.DataSource = dt;
                        Repeater2.DataBind();
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

        protected void Repeater2_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Selectind")
            {

                string loandetails = e.CommandArgument.ToString();
                TextBox4.Text = loandetails;
                Response.Write("<script>alert('You have Selected Customer with BVN: " + loandetails + "');</script>");

            }
        }
    }

}