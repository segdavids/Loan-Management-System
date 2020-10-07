using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Net;
using System.IO;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

namespace CBNLMS.Admin
{
    public partial class manage_pictures : System.Web.UI.Page
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
                    bingrepeater();
                }
                else
                {
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
            SqlCommand com = new SqlCommand("SELECT * from pictures", sc); // table name 
            SqlDataAdapter sda = new SqlDataAdapter(com);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            sc.Close();

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
            item.FindControl("Label5").Visible = !isEdit;
            item.FindControl("Label9").Visible = !isEdit;
            item.FindControl("lblContactName").Visible = !isEdit;
            item.FindControl("Label4").Visible = !isEdit;
            item.FindControl("Label6").Visible = !isEdit;
            item.FindControl("Label7").Visible = !isEdit;

            //Toggle TextBoxes.
            item.FindControl("DropDownList1").Visible = isEdit;
            item.FindControl("DropDownList3").Visible = isEdit;
            item.FindControl("DropDownList4").Visible = isEdit;
            item.FindControl("emailtext").Visible = isEdit;
            item.FindControl("TextBox4").Visible = isEdit;
            item.FindControl("TextBox5").Visible = isEdit;
        }
        protected void OnUpdate(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int customerId = int.Parse((item.FindControl("picture_id") as Label).Text);
            string picture_state = (item.FindControl("DropDownList1") as DropDownList).SelectedItem.Value.Trim();
            string activity = (item.FindControl("DropDownList3") as DropDownList).SelectedItem.Value.Trim();
            string commodity = (item.FindControl("DropDownList4") as DropDownList).SelectedItem.Value.Trim();
            string picturename = (item.FindControl("emailtext") as TextBox).Text.Trim();
            string picturedesc = (item.FindControl("TextBox4") as TextBox).Text.Trim();
            string tag = (item.FindControl("TextBox5") as TextBox).Text.Trim();

            sc.Open();

            SqlCommand img = new SqlCommand("UPDATE pictures SET  picture_state=@sate, activity =@activity, commodity=@commodity, picture_name=@pn, picture_description=@pd, tag=@tag WHERE picture_id=@customerId", sc);
            img.Parameters.AddWithValue("@customerId", customerId);
            img.Parameters.AddWithValue("@sate", picture_state);
            img.Parameters.AddWithValue("@activity", activity);
            img.Parameters.AddWithValue("@commodity", commodity);
            img.Parameters.AddWithValue("@pn", picturename);
            img.Parameters.AddWithValue("@pd", picturedesc);
            img.Parameters.AddWithValue("@tag", tag);

            img.ExecuteNonQuery();
            string useractivity = "Modified Picture:"+ picturename + " for "+ picture_state+" State";
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
            int customerId = int.Parse((item.FindControl("picture_id") as Label).Text);

            string query = "DELETE FROM pictures WHERE picture_id=@customerId";


            SqlCommand cmd = new SqlCommand(query);

            cmd.Parameters.AddWithValue("@customerId", customerId);
            cmd.Connection = sc;
            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
            this.bingrepeater();


        }

    }
}