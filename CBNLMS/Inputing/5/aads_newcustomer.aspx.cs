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

namespace CBNLMS.Inputing._5
{
    public partial class aads_newcustomer : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { commudpop(); }
                
        }

        protected void upload_record(object sender, EventArgs e)
        {

        }

        protected void download_template(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox3.Text = string.Empty;
            TextBox1.Value = string.Empty;
            TextBox2.Value = string.Empty;
            TextBox4.Value = string.Empty;
            TextBox5.Value = string.Empty;
            TextBox9.Value = string.Empty;
        }

        protected void save_data(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextBox3.Text))
            {
                Response.Write("<script>alert('First Name Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(TextBox1.Value))
            {
                Response.Write("<script>alert('Last Name Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(TextBox5.Value))
            {
                Response.Write("<script>alert('BVN Required!');</script>");
                goto end;
            }
           
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            string custype = "INDIVIDUAL";
            sc.Open();
            SqlCommand check = new SqlCommand("select * from all_customer where bvn = @bvn", sc);
            check.Parameters.AddWithValue("@bvn", TextBox5.Value.Trim());
            SqlDataReader rd;
            rd = check.ExecuteReader();
            int count = 0;
            while (rd.Read())
            {
                count += 1;
            }
            if (count >= 1)
            {
                Response.Write("<script>alert('This Individual Customer already Exist!');</script>");
            }

            else if (count == 0)
            {

                SqlCommand cmd3 = new SqlCommand("insert into all_customer (customer_type,first_name,last_name,other_name,BVN,phone,email_add) values(@ctype,@fn,@ln,@on,@bvn,@ph,@em)", sc);
                cmd3.Parameters.AddWithValue("@ctype", custype);
                cmd3.Parameters.AddWithValue("@fn", TextBox3.Text.ToString());
                cmd3.Parameters.AddWithValue("@ln", TextBox1.Value.ToString());
                cmd3.Parameters.AddWithValue("@on", TextBox2.Value.ToString());
                cmd3.Parameters.AddWithValue("@bvn", TextBox5.Value.ToString());
                cmd3.Parameters.AddWithValue("@ph", TextBox9.Value.ToString());
                cmd3.Parameters.AddWithValue("em", TextBox4.Value.Trim());
                cmd3.ExecuteNonQuery();
                sc.Close();
                Response.Write("<script>alert('Customer Record Added Successfully');</script>");
                TextBox3.Text = string.Empty;
                TextBox1.Value = string.Empty;
                TextBox2.Value = string.Empty;
                TextBox4.Value = string.Empty;
                TextBox5.Value = string.Empty;
                TextBox9.Value = string.Empty;

            }
             end:
            {

            }
        }

        protected void add_corp(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Text2.Value))
            {
                Response.Write("<script>alert('Organization Name Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Text1.Value))
            {
                Response.Write("<script>alert('CAC No. Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(TextBox10.Value))
            {
                Response.Write("<script>alert('TIN Required!');</script>");
                goto end;
            }
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            sc.Open();
            SqlCommand check = new SqlCommand("select * from all_customer where tin_no = @tin", sc);
            check.Parameters.AddWithValue("@tin", TextBox10.Value.Trim());
            SqlDataReader rd;
            rd = check.ExecuteReader();
            int count = 0;
            while (rd.Read())
            {
                count += 1;
            }
            if (count >= 1)
            {
                Response.Write("<script>alert('This Business already Exist!');</script>");
            }

            else if (count == 0)
            {
                string custype = "CORPORATE";
                SqlCommand cmd3 = new SqlCommand("insert into all_customer (customer_type,organization_name,cac_no,tin_no,phone,email_add) values(@ctype,@on,@cac,@tn,@ph,@em)", sc);
                cmd3.Parameters.AddWithValue("@ctype", custype);
                cmd3.Parameters.AddWithValue("@on", Text2.Value.ToString());
                cmd3.Parameters.AddWithValue("@cac", Text1.Value.ToString());
                cmd3.Parameters.AddWithValue("@tn", TextBox10.Value.ToString());
                cmd3.Parameters.AddWithValue("@ph", phoneb.Value.ToString());
                cmd3.Parameters.AddWithValue("em", Email1.Value.Trim());
                cmd3.ExecuteNonQuery();
                sc.Close();
                Response.Write("<script>alert('Customer Record Added Successfully');</script>");
                Text2.Value = string.Empty;
                Text1.Value = string.Empty;
                TextBox10.Value = string.Empty;
                phoneb.Value = string.Empty;
                Email1.Value = string.Empty;

            }
            end:
            { }
        }

        protected void clear_corp(object sender, EventArgs e)
        {
            Text2.Value = string.Empty;
            Text1.Value = string.Empty;
            TextBox10.Value = string.Empty;
            phoneb.Value = string.Empty;
            Email1.Value = string.Empty;
        }

        protected void add_state(object sender, EventArgs e)
        {
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            sc.Open();
            SqlCommand check = new SqlCommand("select * from all_customer where state_name = @sn", sc);
            check.Parameters.AddWithValue("@sn", DropDownList10.SelectedItem.Text);
            SqlDataReader rd;
            rd = check.ExecuteReader();
            int count = 0;
            while (rd.Read())
            {
                count += 1;
            }
            if (count >= 1)
            {
                Response.Write("<script>alert('This State already Exist!');</script>");
            }

            else if (count == 0)
            {
                string custype = "STATE GOVERNMENT";
                SqlCommand cmd3 = new SqlCommand("insert into all_customer (customer_type,state_name,phone,email_add) values(@ctype,@sn,@ph,@em)", sc);
                cmd3.Parameters.AddWithValue("@ctype", custype);
                cmd3.Parameters.AddWithValue("@sn", DropDownList10.SelectedItem.Value.ToString());
                cmd3.Parameters.AddWithValue("@ph", TextBox17.Text.ToString());
                cmd3.Parameters.AddWithValue("@em", TextBox18.Text.ToString());

                cmd3.ExecuteNonQuery();
                sc.Close();
                Response.Write("<script>alert('Customer Record Added Successfully');</script>");

                TextBox17.Text = string.Empty;
                TextBox18.Text = string.Empty;



            }
        }

        protected void clear_state(object sender, EventArgs e)
        {
            TextBox17.Text = string.Empty;
            TextBox18.Text = string.Empty;
        }
        public void commudpop()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [states]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList10.DataSource = ds;
            DropDownList10.DataBind();
            DropDownList10.DataTextField = "state";
            DropDownList10.DataValueField = "state";

            DropDownList10.DataBind();
            sc.Close();
        }

        
    }
}