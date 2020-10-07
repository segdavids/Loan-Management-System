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


namespace CBNLMS.Inputing._1
{
    public partial class abp_newcustomer : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                commudpop();
                popanchor();
                popcommassoc();
            }
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
                //INSERT ACTIVITY IN DB
                string activity = "State Gov. Customer Creation";
                DateTime now = DateTime.Now;
                SqlCommand insertactivity = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                insertactivity.Parameters.AddWithValue("@user", Session["Email"].ToString());
                insertactivity.Parameters.AddWithValue("@activity", activity);
                insertactivity.Parameters.AddWithValue("@datetime", now);
                insertactivity.ExecuteNonQuery();
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

        protected void add_corp(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(phoneb.Value))
            {
                Response.Write("<script>alert('Phone Number Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(TextBox1.Value))
            {
                Response.Write("<script>alert('Association Name Required!');</script>");
                goto end;
            }

            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            sc.Open();
            SqlCommand check = new SqlCommand("select * from all_customer where phone=@phone", sc);
            // check.Parameters.AddWithValue("@sn", TextBox1.Value);
            check.Parameters.AddWithValue("@phone", phoneb.Value);
            SqlDataReader rd;
            rd = check.ExecuteReader();
            int count = 0;
            while (rd.Read())
            {
                count += 1;
            }
            if (count >= 1)
            {
                Response.Write("<script>alert('This Customer already Exist!');</script>");
            }

            else if (count == 0)
            {
                string custype = "COMMODITY ASSOCIATION";
                SqlCommand cmd3 = new SqlCommand("insert into all_customer (customer_type,assoc_name,phone,association_pres_email,email_add) values(@ctype,@an,@ph,@ape,@em)", sc);
                cmd3.Parameters.AddWithValue("@ctype", custype);
                cmd3.Parameters.AddWithValue("@an", TextBox1.Value.ToString());
                cmd3.Parameters.AddWithValue("@ph", phoneb.Value.ToString());
                cmd3.Parameters.AddWithValue("@ape", Email3.Value.ToString());
                cmd3.Parameters.AddWithValue("@em", Email1.Value.Trim());
                cmd3.ExecuteNonQuery();
                //INSERT ACTIVITY IN DB
                string activity = "Commodity Assoc. Customer Creation";
                DateTime now = DateTime.Now;
                SqlCommand insertactivity = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                insertactivity.Parameters.AddWithValue("@user", Session["Email"].ToString());
                insertactivity.Parameters.AddWithValue("@activity", activity);
                insertactivity.Parameters.AddWithValue("@datetime", now);
                insertactivity.ExecuteNonQuery();
                sc.Close();
                Response.Write("<script>alert('Customer Record Added Successfully');</script>");
                phoneb.Value = string.Empty;
                Email3.Value = string.Empty;
                phoneb.Value = string.Empty;
                Email1.Value = string.Empty;
                TextBox1.Value = string.Empty;
                
            }
            end:
            { }
        }

        protected void clear_corp(object sender, EventArgs e)
        {
            phoneb.Value = string.Empty;
            Email3.Value = string.Empty;
            phoneb.Value = string.Empty;
            Email1.Value = string.Empty;
        }

        protected void save_data(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void upload_record(object sender, EventArgs e)
        {

        }

        protected void download_template(object sender, EventArgs e)
        {

        }

        protected void add_pri_anchor(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Text3.Value))
            {
                Response.Write("<script>alert('Organization Name is Required!');</script>");
                goto end;
            }
            if (string.IsNullOrWhiteSpace(Text5.Value))
            {
                Response.Write("<script>alert('TIN is Required!');</script>");
                goto end;
            }


            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            sc.Open();
            SqlCommand check = new SqlCommand("select * from all_customer where anchor_type = @sn and organization_name=@orgname", sc);
            check.Parameters.AddWithValue("@sn", DropDownList1.SelectedItem.Text);
            check.Parameters.AddWithValue("@orgname", Text3.Value);
            SqlDataReader rd;
            rd = check.ExecuteReader();
            int count = 0;
            while (rd.Read())
            {
                count += 1;
            }
            if (count >= 1)
            {
                Response.Write("<script>alert('This Customer already Exist!');</script>");
            }

            else if (count == 0)
            {
                string custype = "ANCHOR";
                SqlCommand cmd3 = new SqlCommand("insert into all_customer (customer_type,anchor_type,anchor_name,organization_name,tin_no,phone,email_add) values(@ctype,@at,@an,@on,@tin,@ph,@em)", sc);
                cmd3.Parameters.AddWithValue("@ctype", custype);
                cmd3.Parameters.AddWithValue("@at", DropDownList1.SelectedItem.Value.ToString());
                cmd3.Parameters.AddWithValue("@an", DropDownList1.SelectedItem.Value.ToString());
                cmd3.Parameters.AddWithValue("@on", Text3.Value.ToString());
                cmd3.Parameters.AddWithValue("@tin", Text5.Value.Trim());
                cmd3.Parameters.AddWithValue("@ph", Number1.Value.Trim());
                cmd3.Parameters.AddWithValue("@em", Email2.Value.Trim());
                cmd3.ExecuteNonQuery();
                //INSERT ACTIVITY IN DB
                string activity = "Anchor. Customer Creation";
                DateTime now = DateTime.Now;
                SqlCommand insertactivity = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                insertactivity.Parameters.AddWithValue("@user", Session["Email"].ToString());
                insertactivity.Parameters.AddWithValue("@activity", activity);
                insertactivity.Parameters.AddWithValue("@datetime", now);
                insertactivity.ExecuteNonQuery();
                sc.Close();
                Response.Write("<script>alert('Customer Record Added Successfully');</script>");
                Text3.Value = string.Empty;
                Text5.Value = string.Empty;
                Number1.Value = string.Empty;
                Email2.Value = string.Empty;

            }
            end:
            { }
        }

        protected void clr_pri_anchor(object sender, EventArgs e)
        {
            Text3.Value = string.Empty;
            Text5.Value = string.Empty;
            Number1.Value = string.Empty;
            Email2.Value = string.Empty;
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
        public void popanchor()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [anchor_types]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "anchor_type_name";
            DropDownList1.DataValueField = "anchor_type_name";

            DropDownList1.DataBind();
            sc.Close();
        }
        public void popcommassoc()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [commodity_association]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
                          // DropDownList2.DataSource = ds;
                          // DropDownList2.DataBind();
                          // DropDownList2.DataTextField = "comm_association";
                          // DropDownList2.DataValueField = "comm_association";

            // DropDownList2.DataBind();
            sc.Close();
        }
    }
}
