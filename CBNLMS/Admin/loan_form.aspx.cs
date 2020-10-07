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

namespace CBNLMS
{
    public partial class loan_form1 : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        // SqlCommand cmd;
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
            fillselet();
            fillinter();
            fillbank();
            fillobligor();
            fillpaymentmode();

        }
        public void fillselet()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [facility_type]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset

            DropDownList3.DataSource = ds;
            DropDownList3.DataBind();
            DropDownList3.DataValueField = "facility_type";
            DropDownList3.DataTextField = "facility_type";
            DropDownList3.DataBind();
            sc.Close();

        }

        public void fillinter()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [interventions]", sc); // table name 
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

        public void fillbank()
        {
            sc.Open();
            SqlCommand com1 = new SqlCommand("select bank from types_banks", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com1);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset

            DropDownList4.DataSource = ds;
            DropDownList4.DataBind();
            DropDownList4.DataTextField = "bank";
            DropDownList4.DataValueField = "bank";
            DropDownList4.DataBind();
            sc.Close();

        }
        public void fillobligor()
        {
            sc.Open();
            SqlCommand com2 = new SqlCommand("select * from [obligor]", sc); // table name 
            SqlDataAdapter da2 = new SqlDataAdapter(com2);
            DataTable ds2 = new DataTable();
            da2.Fill(ds2);  // fill dataset

            DropDownList2.DataSource = ds2;
            DropDownList2.DataBind();
            DropDownList2.DataTextField = "obligor_name";
            DropDownList2.DataValueField = "obligor_name";

            DropDownList2.DataBind();
            sc.Close();



        }

        public void fillpaymentmode()
        {
            sc.Open();
            SqlCommand com2 = new SqlCommand("select * from [payment_mode]", sc); // table name 
            SqlDataAdapter da2 = new SqlDataAdapter(com2);
            DataTable ds2 = new DataTable();
            da2.Fill(ds2);  // fill dataset

            DropDownList5.DataSource = ds2;
            DropDownList5.DataBind();
            DropDownList5.DataTextField = "payment_mode";
            DropDownList5.DataValueField = "payment_mode";

            DropDownList5.DataBind();
            sc.Close();



        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            double moratorium = 0;
            double PaymentAmount;
            double LoanAmount = Convert.ToInt32(validationCustomUsername.Value);
            double NumberOfYears = Convert.ToInt32(TextBox2.Text);
            moratorium = Convert.ToDouble(mora.Value);
            double NumberOfPayments = (NumberOfYears - moratorium) * 12;
            PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
            sc.Open();
            DateTime disdate = DateTime.Parse(Date2.Value.ToString());
            DateTime expdate = DateTime.Parse(Date3.Value.ToString());


            SqlCommand cmd3 = new SqlCommand("insert into loan_t (obligor_name,intervention,bank,facility_type,payment_mode,loan_amount,interest_rate,num_of_yrs,moratorium,start_date,payment_amt,num_of_pay,num_of_inst,exp_date) values('" + (DropDownList2.SelectedItem.Text).ToString() + "','" + DropDownList1.SelectedItem.Text + "','" + DropDownList4.SelectedItem.Text + "','" + DropDownList3.SelectedItem.Text + "','" + DropDownList5.SelectedItem.Text + "','" + Convert.ToDouble(validationCustomUsername.Value) + "','" + Convert.ToDouble(intrate.Value) + "','" + Convert.ToDouble(TextBox2.Text) + "','" + Convert.ToDouble(mora.Value) + "', '" + disdate + "','" + PaymentAmount + "','" + NumberOfPayments + "','" + NumberOfPayments + "','" + expdate + "')", sc);
            cmd3.Parameters.AddWithValue("obligor_name", DropDownList2.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("intervention", DropDownList1.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("bank", DropDownList4.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("facility_type", DropDownList3.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("payment_mode", DropDownList5.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("loan_amount", Convert.ToDouble(validationCustomUsername.Value));
            cmd3.Parameters.AddWithValue("interest_rate", Convert.ToDouble(intrate.Value));
            cmd3.Parameters.AddWithValue("num_of_yrs", Convert.ToDouble(TextBox2.Text));
            cmd3.Parameters.AddWithValue("moratorium", Convert.ToDouble(mora.Value));
            cmd3.Parameters.AddWithValue("start_date", disdate);
            cmd3.Parameters.AddWithValue("payment_amt", PaymentAmount);
            cmd3.Parameters.AddWithValue("num_of_pay", NumberOfPayments);
            cmd3.Parameters.AddWithValue("num_of_inst", NumberOfPayments);
            cmd3.Parameters.AddWithValue("exp_date", expdate);
            cmd3.ExecuteNonQuery();
            sc.Close();
            Response.Write("<script>alert('Loan Record Added Successfully');</script>");
            validationCustomUsername.Value = string.Empty;
            intrate.Value = string.Empty;
            TextBox2.Text = string.Empty;
            mora.Value = string.Empty;
            Date2.Value = string.Empty;
            Date3.Value = string.Empty;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            double moratorium = 0;
            double PaymentAmount;
            double LoanAmount = Convert.ToInt32(validationCustomUsername.Value);
            double NumberOfYears = Convert.ToInt32(TextBox2.Text);

            if (NumberOfYears - moratorium == 0 || LoanAmount <= 0 || NumberOfYears <= 0)
            {
                TextBox3.Visible = true;
                TextBox4.Visible = true;
                TextBox3.Text = "Eroor";
                TextBox4.Text = "Error";
            }


            else
            {
                LoanAmount = Convert.ToDouble(validationCustomUsername.Value);
                NumberOfYears = Convert.ToDouble(TextBox2.Text);

                if (LoanAmount <= 0 || NumberOfYears <= 0)
                {

                }

                moratorium = Convert.ToDouble(mora.Value);
                double NumberOfPayments = (NumberOfYears - moratorium) * 12;
                PaymentAmount = (LoanAmount) / (NumberOfPayments);
                PaymentAmount = Math.Round(PaymentAmount, 2);



                TextBox3.Visible = true;
                TextBox4.Visible = true;
                string naira = "₦" + String.Format("{0:#,##0.000}", PaymentAmount);
                TextBox3.Text = naira;
                TextBox4.Text = NumberOfPayments.ToString();
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
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

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            validationCustomUsername.Value = string.Empty;
            intrate.Value = string.Empty;
            TextBox2.Text = string.Empty;
            mora.Value = string.Empty;
            Date2.Value = string.Empty;
            Date3.Value = string.Empty;
        }

        private void InsertCSVRecords(DataTable csvdt)
        {

            //creating object of SqlBulkCopy    
            SqlBulkCopy objbulk = new SqlBulkCopy(sc);
            //assigning Destination table name    
            objbulk.DestinationTableName = "loan_t";
            //Mapping Table column    
            objbulk.ColumnMappings.Add("loan_id", "loan_id");
            objbulk.ColumnMappings.Add("obligor_id", "obligor_id");
            objbulk.ColumnMappings.Add("obligor_name", "obligor_name");
            objbulk.ColumnMappings.Add("intervention", "intervention");
            objbulk.ColumnMappings.Add("bank", "bank");
            objbulk.ColumnMappings.Add("facility_type", "facility_type");
            objbulk.ColumnMappings.Add("payment_mode", "payment_mode");
            objbulk.ColumnMappings.Add("loan_amount", "loan_amount");
            objbulk.ColumnMappings.Add("interest_rate", "interest_rate");
            objbulk.ColumnMappings.Add("num_of_yrs", "num_of_yrs");
            objbulk.ColumnMappings.Add("moratorium", "moratorium");
            objbulk.ColumnMappings.Add("start_date", "start_date");
            objbulk.ColumnMappings.Add("payment_amt", "payment_amt");
            objbulk.ColumnMappings.Add("num_of_pay", "num_of_pay");
            objbulk.ColumnMappings.Add("num_of_inst", "num_of_inst");
            objbulk.ColumnMappings.Add("exp_date", "exp_date");
            objbulk.ColumnMappings.Add("obligo_name", "obligo_name");
            //inserting Datatable Records to DataBase    
            sc.Open();
            objbulk.WriteToServer(csvdt);
            sc.Close();


        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            int LoanAmount = Convert.ToInt32(validationCustomUsername.Value);
            int NumberOfYears = Convert.ToInt32(TextBox2.Text);

            if (LoanAmount <= 0 || NumberOfYears <= 0)
            {

            }

            int moratorium = Convert.ToInt32(mora.Value);
            int NumberOfPayments = (NumberOfYears - moratorium) * 12;
            double PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
            TextBox3.Visible = true;
            TextBox3.Text = PaymentAmount.ToString();
        }

        void calculatepayment()
        {
            int LoanAmount = Convert.ToInt32(validationCustomUsername.Value);
            int NumberOfYears = Convert.ToInt32(TextBox2.Text);

            if (LoanAmount <= 0 || NumberOfYears <= 0)
            {

            }

            int moratorium = Convert.ToInt32(mora.Value);
            int NumberOfPayments = (NumberOfYears - moratorium) * 12;
            double PaymentAmount = (LoanAmount) / (NumberOfPayments);
            PaymentAmount = Math.Round(PaymentAmount, 2);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {

        }



        protected void TEST(object sender, EventArgs e)
        {

        }

        protected void upload_btn(object sender, EventArgs e)
        {
            //Creating object of datatable  
            DataTable tblcsv = new DataTable();
            //creating columns  
            tblcsv.Columns.Add("loan_id");
            tblcsv.Columns.Add("obligor_id");
            tblcsv.Columns.Add("obligor_name");
            tblcsv.Columns.Add("intervention");
            tblcsv.Columns.Add("bank");
            tblcsv.Columns.Add("facility_type");
            tblcsv.Columns.Add("payment_mode");
            tblcsv.Columns.Add("loan_amount");
            tblcsv.Columns.Add("interest_rate");
            tblcsv.Columns.Add("num_of_yrs");
            tblcsv.Columns.Add("moratorium");
            tblcsv.Columns.Add("start_date");
            tblcsv.Columns.Add("payment_amt");
            tblcsv.Columns.Add("num_of_pay");
            tblcsv.Columns.Add("num_of_inst");
            tblcsv.Columns.Add("exp_date");
            tblcsv.Columns.Add("obligo_name");

            //getting full file path of Uploaded file  
            string CSVFilePath = Server.MapPath(FileUpload1.PostedFile.FileName);
            //Reading All text  
            string ReadCSV = File.ReadAllText(CSVFilePath);
            //spliting row after new line  
            foreach (string csvRow in ReadCSV.Split('\n'))
            {
                if (!string.IsNullOrEmpty(csvRow))
                {
                    //Adding each row into datatable  
                    tblcsv.Rows.Add();
                    int count = 0;
                    foreach (string FileRec in csvRow.Split(','))
                    {
                        tblcsv.Rows[tblcsv.Rows.Count - 1][count] = FileRec;
                        count++;
                    }
                }


            }
            //Calling insert Functions  
            InsertCSVRecords(tblcsv);
        }
    }
}