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
using System.Data;

namespace CBNLMS.Inputing._7
{
    public partial class Default : System.Web.UI.Page
    {
         SqlConnection constr = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        string emailz = string.Empty;
        string lastlogins = string.Empty;
        string lname = string.Empty;
        string phone = string.Empty;
        string welcomename = string.Empty;
        string role = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Inputer_7"] == null || Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
           if (!this.IsPostBack)
            {

                string lastlogins = string.Empty;
                string lname = string.Empty;
                string phone = string.Empty;
                string welcomename = string.Empty;
                string emailz = string.Empty;
                string role = string.Empty;
                //username.InnerHtml = string.Empty;
                role = Session["Role"].ToString();
                emailz = Session["Email"].ToString();
                welcomename = Session["Inputer_7"].ToString();
                lastlogins = Session["lastlogin"].ToString();
                lname = Session["LName"].ToString();
                phone = Session["Phone"].ToString();
                user.InnerHtml += "<strong>" + welcomename + ", " + lname + " </strong>";
                emailspan.InnerHtml = emailz;

                // getactivities();
                //GET ACTIVITES
                constr.Open();
                SqlCommand com = new SqlCommand("select top 10 a.activity_id,a.user_id, b.first_name, a.activity, case when (DATEDIFF(hh,a.date_time,getdate())<1) then CAST(cast(DATEDIFF(MINUTE,a.date_time,getdate()) as varchar) + cast (' Minutes Ago' as varchar) as varchar)  when (DATEDIFF(hh,a.date_time,getdate())>24) then CAST(cast(DATEDIFF(DAY,a.date_time,getdate()) as varchar) + cast (' Days Ago' as varchar) as varchar) else cast(cast(DATEDIFF(HOUR,a.date_time,getdate()) as varchar)+ cast (' Hours Ago' as varchar) as varchar) end as timdiff from user_activity a inner join users b on a.user_id = b.email where user_id='" + emailz + "' order by a.activity_id desc", constr); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                //GET COUNT OF LOANS ENTRD
                SqlCommand img = new SqlCommand("select sum(case when activity like '%loan%' then 1 else 0 end) as loancreation, sum(case when activity like '%customer creation%' then 1 else 0 end) as customercreated, sum(case when activity like '%Upload%' then 1 else 0 end) as picsuploaded from cbndb.dbo.user_activity where user_id='" + emailz + "'", constr);
                SqlParameter paramID = new SqlParameter();
                img.CommandType = CommandType.Text;
                SqlDataReader sdrpopulate = img.ExecuteReader();
                sdrpopulate.Read();
                loansentered.InnerHtml = " " + String.Format("{0:#,##0}", sdrpopulate["loancreation"] == DBNull.Value ? 0 : Convert.ToInt32(sdrpopulate["loancreation"]));
                custreg.InnerHtml = " " + String.Format("{0:#,##0}", sdrpopulate["customercreated"] == DBNull.Value ? 0 : Convert.ToInt32(sdrpopulate["customercreated"]));
                picupl.InnerHtml = " " + String.Format("{0:#,##0}", sdrpopulate["picsuploaded"] == DBNull.Value ? 0 : Convert.ToInt32(sdrpopulate["picsuploaded"]));

                constr.Close();


            }
        }

      

        protected void update_profile(object sender, EventArgs e)
        {
            if (pass2.Value == passre.Value)
            {
                SqlCommand updtrec = new SqlCommand("Update users set password=@newPass WHERE email='" + emailupd.Text.ToString().Trim() + "'", constr);
                updtrec.Parameters.AddWithValue("@newPass", passre.Value.ToString());
                constr.Open();
                updtrec.ExecuteNonQuery();
                constr.Close();
                Response.Write("<script>alert('Profile Updated Successfully');</script>");
                pass2.Value = "";
                passre.Value = "";

            }
            else
            {
                Response.Write("<script>alert('Passwords do not Match');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Session["LName"] = lname.ToString();
            Session["Email"] = emailz.ToString();
            Session["Role"] = role.ToString();
            Response.Redirect("~/Reporting/lockscreen.aspx");
        }
    }
}