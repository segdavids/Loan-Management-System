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
using System.Text;
using System.Net;
using System.IO;
using System.Data.OleDb;
using System.Net.Mail;

namespace CBNLMS
{
    public partial class users : System.Web.UI.Page
    {
        string test;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    String welcomename = "";
                    string emailz = string.Empty;
                    string lastlogins = string.Empty;
                    emailz = Session["Email"].ToString();
                    welcomename = Session["ID"].ToString();
                    lastlogins = Session["lastlogin"].ToString();
                    getrole();
                    bingrepeater();
                    alert.Visible = false;
                    Div1.Visible = false;
                    Div2.Visible = false;
                }
                else
                {
                    alert.Visible = false;
                    Div2.Visible = false;
                    Div1.Visible = false;
                    string welcomename = "";
                    string emailz = string.Empty;
                    string lastlogins = string.Empty;

                }
            }
            test = Session["Email"].ToString();
        }


        private void bingrepeater()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("SELECT * from users", sc); // table name 
            SqlDataAdapter sda = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
          
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                        sc.Close();
                    
                }

        public void getrole()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("SELECT * from user_roles", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList2.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList2.DataTextField = "role_name";
            DropDownList2.DataValueField = "role_name";

            DropDownList2.DataBind();
            sc.Close();
        }


        protected void Insert(object sender, EventArgs e)
        {
            try
            { 
                if (TextBox2.Text.Trim()=="")
                {
                    Response.Write("<script>alert('Email is Required');</script>");
                    return;
                }
                else
                if (TextBox2.Text.Trim() == "")
                {
                    Response.Write("<script>alert('First Name is Required');</script>");
                    return;
                }
                else
                { }
                sc.Open();
            SqlCommand loginn = new SqlCommand("select * from users where email='" + TextBox2.Text.ToString().Trim() + "'", sc);
            SqlDataReader rd;
            rd = loginn.ExecuteReader();
            int count = 0;
            while (rd.Read())
            {
                count += 1;
            }
            if (count == 1)
            {
                alert.Visible = true;
            }

            else if (count == 0)
            {
                DateTime date = DateTime.Now;
                string username = txtdfo.Text.Trim();
                    string email = TextBox2.Text.Trim();
                string role = DropDownList2.SelectedItem.Value.ToString();
                    string phone = TextBox3.Text.Trim();
                    string firstname = txtstate.Text.Trim();
                    string lastname = TextBox1.Text.Trim();
                RandomNumberGenerator generator = new RandomNumberGenerator();
                string password = generator.RandomPassword();
                string query = "INSERT INTO users(username,password,email,phone,first_name,last_name,user_role,date_created) VALUES(@username, @pw, @email,@phone,@firstname,@lastname,@role,@createdon)";

                    SqlCommand cmd = new SqlCommand(query, sc);
                        
                            cmd.Parameters.AddWithValue("@username", username);
                            cmd.Parameters.AddWithValue("@pw", password);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@phone", phone);
                            cmd.Parameters.AddWithValue("@firstname", firstname);
                            cmd.Parameters.AddWithValue("@lastname", lastname);
                            cmd.Parameters.AddWithValue("@role", role);
                            cmd.Parameters.AddWithValue("@createdon", date);
                            cmd.ExecuteNonQuery();
                    string useractivity = "Creation of the following User:" + username + " Role: " + role + "";
                    DateTime now = DateTime.Now;
                    SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                    cmd3.Parameters.AddWithValue("@user", test);
                    cmd3.Parameters.AddWithValue("@activity", useractivity);
                    cmd3.Parameters.AddWithValue("@datetime", now);
                    cmd3.ExecuteNonQuery();
                    sc.Close();

                    string body = this.PopulateBody(""+ lastname+"",
                                  
                                   "" + email + " ",
                                   "" + password + " ",
                                   "" + role + " ",
                                   "DFD Login Console ",
                                   "https://dfdlms.net ",
                                  
                                    " You can Change your password in the Profile tab after first login. Click the button link below to Login");
                    this.SendHtmlFormattedEmail(""+email+"", "Welcome to DFD LMS", body);
                    txtstate.Text = "";
                            TextBox2.Text = "";
                            TextBox1.Text = "";
                            TextBox3.Text = "";
                            txtdfo.Text = "";
                            Div1.Visible = true;
                    bingrepeater();
                    successtxt.InnerHtml = "User Created Successfully and Password has been Sent to the User's registered Email Address";
                        }
                    
                  
                 
                

            }
            catch (Exception err)
            {
                alert.Visible = true;
                alert.InnerHtml = err.Message;
            }
        }

        public class RandomNumberGenerator
        {
            // Generate a random number between two numbers    
            public int RandomNumber(int min, int max)
            {
                Random random = new Random();
                return random.Next(min, max);
            }

            // Generate a random string with a given size and case.   
            // If second parameter is true, the return string is lowercase  
            public string RandomString(int size, bool lowerCase)
            {
                StringBuilder builder = new StringBuilder();
                Random random = new Random();
                char ch;
                for (int i = 0; i < size; i++)
                {
                    ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                    builder.Append(ch);
                }
                if (lowerCase)
                    return builder.ToString().ToLower();
                return builder.ToString();
            }

            // Generate a random password of a given length (optional)  
            public string RandomPassword(int size = 0)
            {
                StringBuilder builder = new StringBuilder();
                builder.Append(RandomString(4, true));
                builder.Append(RandomNumber(1000, 9999));
                builder.Append(RandomString(2, false));
                return builder.ToString();
            }
        }
        protected void download_list(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Users.xls"));
            Response.ContentType = "application/ms-excel";
            DataTable dt = GetDatafromDatabase();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }

        protected DataTable GetDatafromDatabase()
        {
            DataTable dt = new DataTable();
            using (sc)
            {
                sc.Open();
                SqlCommand cmd = new SqlCommand("select * from users", sc);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sc.Close();
            }
            return dt;
        }

        protected void download_template(object sender, EventArgs e)
        {
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            string filePath = "~/assets/forms/user_creation_form.csv";
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=user_creation_form.xlsx");
            byte[] data = req.DownloadData(Server.MapPath(filePath));
            response.BinaryWrite(data);
            response.End();
        }

        protected void upload_record(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
            {
                Response.Write("<script>alert('Select at least 1 file');</script>");
            }
            else if (FileUpload1.HasFile)
            {
                //Upload and save the file
                string excelPath = Server.MapPath("~/Admin/uploads/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
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
                    dtExcelData.Columns.AddRange(new DataColumn[8] { new DataColumn("username", typeof(string)),
                new DataColumn("password", typeof(string)),
                new DataColumn("email", typeof(string)),
                new DataColumn("phone", typeof(string)),
                new DataColumn("first_name", typeof(string)),
                new DataColumn("last_name", typeof(string)),
                new DataColumn("user_role", typeof(string)),
                new DataColumn("date_created", typeof(DateTime)) });

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
                            sqlBulkCopy.DestinationTableName = "dbo.users";
                            RandomNumberGenerator generator = new RandomNumberGenerator();
                            string password = generator.RandomPassword();
                            //[OPTIONAL]: Map the Excel columns with that of the database table
                            sqlBulkCopy.ColumnMappings.Add("username", "username");
                            sqlBulkCopy.ColumnMappings.Add("password", "password");
                            sqlBulkCopy.ColumnMappings.Add("email", "email");
                            sqlBulkCopy.ColumnMappings.Add("phone", "phone");
                            sqlBulkCopy.ColumnMappings.Add("first_name", "first_name");
                            sqlBulkCopy.ColumnMappings.Add("last_name", "last_name");
                            sqlBulkCopy.ColumnMappings.Add("user_role", "user_role");
                            sqlBulkCopy.ColumnMappings.Add("date_created", "date_created");
                            con.Open();
                            sqlBulkCopy.WriteToServer(dtExcelData);

                            string useractivity = "Creation of "+ (dtExcelData.Rows.Count).ToString() + " Users";
                            DateTime now = DateTime.Now;
                            SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", con);
                            cmd3.Parameters.AddWithValue("@user", test);
                            cmd3.Parameters.AddWithValue("@activity", useractivity);
                            cmd3.Parameters.AddWithValue("@datetime", now);
                            cmd3.ExecuteNonQuery();
                            Div2.Visible = true;

                            con.Close();
                            bingrepeater();
                        }
                    }
                }
            }
        }

        protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

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
            item.FindControl("lnkDelete").Visible = !isEdit;

            //Toggle Labels.
            item.FindControl("lblCustomerId").Visible = !isEdit;
            item.FindControl("Label4").Visible = !isEdit;
            item.FindControl("lblContactName").Visible = !isEdit;
            item.FindControl("Label1").Visible = !isEdit;

            //Toggle TextBoxes.
            item.FindControl("txtContactName").Visible = isEdit;
            item.FindControl("lalstnametxt").Visible = isEdit;
            item.FindControl("emailtext").Visible = isEdit;
            item.FindControl("DropDownList15").Visible = isEdit;
        }
        protected void OnUpdate(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int customerId = int.Parse((item.FindControl("id") as Label).Text);
            string firstname = (item.FindControl("txtContactName") as TextBox).Text.Trim();
            string lastname = (item.FindControl("lalstnametxt") as TextBox).Text.Trim();
            string email = (item.FindControl("emailtext") as TextBox).Text.Trim();
            string role = (item.FindControl("DropDownList15") as DropDownList).SelectedItem.Value.Trim();

            sc.Open();

            SqlCommand img = new SqlCommand("UPDATE users SET  first_name=@firstname, last_name =@lastname, email=@email, user_role=@role WHERE id=@customerId", sc);
            img.Parameters.AddWithValue("@customerId", customerId);
            img.Parameters.AddWithValue("@firstname", firstname);
            img.Parameters.AddWithValue("@lastname", lastname);
            img.Parameters.AddWithValue("@email", email);
            img.Parameters.AddWithValue("@role", role);
        
            img.ExecuteNonQuery();
            string useractivity = "Modified User: " + email + " ";
            DateTime now = DateTime.Now;
            SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
            cmd3.Parameters.AddWithValue("@user", test);
            cmd3.Parameters.AddWithValue("@activity", useractivity);
            cmd3.Parameters.AddWithValue("@datetime", now);
            cmd3.ExecuteNonQuery();
            sc.Close();
            this.bingrepeater();
            

        }

        protected void OnCancel(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, false);
        }
        protected void OnDelete(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int customerId = int.Parse((item.FindControl("id") as Label).Text);
            string email = (item.FindControl("emailtext") as TextBox).Text.Trim();

            string query = "DELETE FROM users WHERE id=@customerId";


            SqlCommand cmd = new SqlCommand(query);
                
                    cmd.Parameters.AddWithValue("@customerId", customerId);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
            string useractivity = "Deleted User: " + email + " ";
            DateTime now = DateTime.Now;
            SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
            cmd3.Parameters.AddWithValue("@user", test);
            cmd3.Parameters.AddWithValue("@activity", useractivity);
            cmd3.Parameters.AddWithValue("@datetime", now);
            cmd3.ExecuteNonQuery();
            sc.Close();
            Response.Write("<script>alert('User Deleted');</script>");
            this.bingrepeater();
             
           
        }

        private string PopulateBody(string userName, string emailadd, string password, string role, string title, string url, string description)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Admin/newuseremail.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{UserName}", userName);
            body = body.Replace("{email}", emailadd);
            body = body.Replace("{Password}", password);
            body = body.Replace("{role}", role);
            body = body.Replace("{Title}", title);
            body = body.Replace("{Url}", url);
            body = body.Replace("{Description}", description);
            return body;
        }

        private void SendHtmlFormattedEmail(string recepientEmail, string subject, string body)
        {
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recepientEmail));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
            }
        }

       
    }
}