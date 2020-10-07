using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Windows;
using System.IO;
using System.Threading;
using System.Net;

namespace CBNLMS
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection constr = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                alert.Visible = false;
                Session.RemoveAll();
                Session.Abandon();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            alert.Visible = false;
            //alert.InnerText = "";
            constr.Open();
            SqlCommand loginn = new SqlCommand("select * from users where email='" + TextBox2.Text.ToString().Trim() + "' and password='" + TextBox1.Text.ToString().Trim() + "'", constr);
            SqlDataReader rd;
            rd = loginn.ExecuteReader();
            int count = 0;
            while (rd.Read())
            {
                count += 1;
            }
              if (count == 0)
            {
                alert.Visible = true;
            }

           else if (count == 1)
            {
                DateTime date = DateTime.Now; // 
                

                SqlCommand cmd2 = new SqlCommand("select first_name,last_name,(case when last_login is null then CAST('00:00:00' AS datetime) else last_login end),username,email,(case when user_role is null then '0' else user_role end),(case when phone is null then 'No Number Found' else phone end) from users where email='" + TextBox2.Text.ToString() + "'", constr);
                //SqlDataReader rd2;
                SqlDataReader rd2 = cmd2.ExecuteReader();
                while (rd2.Read())
                {
                    string status = "success";
                    string act = "Login_Dashboard_Session_01ABB_";
                    string name = rd2.GetString(0);
                    string lname = rd2.GetString(1);
                    DateTime lastlog = rd2.GetDateTime(2);
                    string username = rd2.GetString(3);
                    string emails = rd2.GetString(4);
                    string role = rd2.GetString(5).ToString();
                    string phone = rd2.GetString(6).ToString();
                    string FundName = name.ToString();
                    string LName = lname.ToString();
                    string phonenumber = phone.ToString();
                    string lastlogs = lastlog.ToString();
                    
                    
                    
                    SqlCommand updtrec = new SqlCommand("Update users set last_login=@LastName WHERE email='" + TextBox2.Text.ToString().Trim() + "'", constr);
                    updtrec.Parameters.AddWithValue("@LastName", date);
                    updtrec.ExecuteNonQuery();
                    SqlCommand insertactivity = new SqlCommand("insert into login_activites (username,first_name,last_name,email,date_of_login,activity,status) values('"+ username + "','"+ name+"','"+ lname + "','"+ emails + "','" + date + "','"+ act+username + "','"+ status + "')", constr);
                    insertactivity.Parameters.AddWithValue("username", username);
                    insertactivity.Parameters.AddWithValue("first_name", name);
                    insertactivity.Parameters.AddWithValue("last_name", lname);
                    insertactivity.Parameters.AddWithValue("email", emails);
                    insertactivity.Parameters.AddWithValue("date_of_login", date);
                    insertactivity.Parameters.AddWithValue("activity", act);
                    insertactivity.Parameters.AddWithValue("status", status);
                    insertactivity.ExecuteNonQuery();
                      if (role == ""|| role=="0")
                    {
                         
                            alert.Visible = true;


                        this.alert.Style.Add("background-color", "#FF0000");
                        this.alert.InnerText = "Dear " + name + ", " + lname + ". No role/rights have been assigned to you. Kindly contact your Admin to assign a role to you.";
                        
                    }
                    if (role == "SA")
                    {
                        Session["SA"] = FundName;
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Admin/Default.aspx");
                    }
                    if (role == "Admin")
                    {
                        Session["ID"] = FundName;
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Admin/Default.aspx");
                    }
                     if (role == "Inputer_1")
                    {
                        Session["Inputer_1"] = FundName.ToString();
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        //Session["lastlogin"] = lastlogs;
                        Response.Redirect("~/Inputing/1/Default.aspx");
                    }
                     if (role == "Inputer_2")
                    {
                        Session["Inputer_2"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Inputing/2/Default.aspx");
                    }
                     if (role == "Inputer_3")
                    {
                        Session["Inputer_3"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Inputing/3/Default.aspx");
                    }
                     if (role == "Inputer_4")
                    {
                        Session["Inputer_4"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Inputing/4/Default.aspx");
                    }
                     if (role == "Inputer_5")
                    {
                        Session["Inputer_5"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Inputing/5/Default.aspx");
                    }
                     if (role == "Inputer_6")
                    {
                        Session["Inputer_6"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Inputing/6/Default.aspx");
                    }
                     if (role == "Inputer_7")
                    {
                        Session["Inputer_7"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Inputing/7/Default.aspx");
                    }
                     if (role == "Reporter_1")
                    {
                        Session["Reporter_1"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Reporting/1/Default.aspx");
                    }
                     if (role == "Reporter_2")
                    {
                        Session["Reporter_2"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Reporting/2/Default.aspx");
                    }
                     if (role == "Reporter_3")
                    {
                        Session["Reporter_3"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Reporting/3/Default.aspx");
                    }
                    if (role == "Reporter_4")
                    {
                        Session["Reporter_4"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Reporting/4/Default.aspx");
                    }
                    if (role == "Reporter_5")
                    {
                        Session["Reporter_5"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Reporting/5/Default.aspx");
                    }
                    if (role == "Reporter_6")
                    {
                        Session["Reporter_6"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Reporting/6/Default.aspx");
                    }
                    if (role == "Reporter_7")
                    {
                        Session["Reporter_7"] = FundName;
                        Session["LName"] = lname.ToString();
                        Session["Email"] = TextBox2.Text.ToString();
                        Session["lastlogin"] = lastlogs;
                        Session["Phone"] = phonenumber;
                        Session["Role"] = role.ToString();
                        string activity = "Successful Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        Response.Redirect("~/Reporting/7/Default.aspx");
                    }
                    else
                    {
                        alert.Visible = true;

                        string activity = "Failed Login";
                        DateTime now = DateTime.Now;
                        SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", constr);
                        cmd3.Parameters.AddWithValue("@user", TextBox2.Text.ToString());
                        cmd3.Parameters.AddWithValue("@activity", activity);
                        cmd3.Parameters.AddWithValue("@datetime", now);
                        cmd3.ExecuteNonQuery();
                        constr.Close();
                        this.alert.Style.Add("background-color", "#FF0000");
                        this.alert.InnerText = "Dear " + name + ", " + lname + ". The role/rights assigned to you is INVALID. Kindly contact your Administrator.";

                    }


                }
            }
           
        }
    }
}