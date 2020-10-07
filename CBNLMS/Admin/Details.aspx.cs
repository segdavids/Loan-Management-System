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
using System.Web.Services;
using System.Web.Script.Services;

namespace CBNLMS
{
    public partial class Details1 : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {
                string welcomename = String.Empty;
                string emailz = string.Empty;
                emailz = Session["Email"].ToString();
                welcomename = Session["ID"].ToString();
                string lastlogins = Session["lastlogin"].ToString();
               
            }
            if (Session["Amor_details"] == null)
            {
                Response.Redirect("~/amortization.aspx");
            }
            else
            {

            }
            string amortid = Session["Amor_details"].ToString();

            if (!IsPostBack)
            {
                sc.Open();
                SqlCommand img = new SqlCommand("SELECT * from adp WHERE sn = @ID", sc);
                SqlParameter paramID = new SqlParameter();
                img.CommandType = CommandType.Text;
                img.Parameters.AddWithValue("@ID", amortid);
                SqlDataReader sdrpopulate = img.ExecuteReader();
                sdrpopulate.Read();
                obligname.InnerHtml = sdrpopulate["anchor"].ToString();
                state.InnerHtml = sdrpopulate["state"].ToString();
                season.InnerHtml = sdrpopulate["season"].ToString();
                paymode.InnerHtml = sdrpopulate["commodity"].ToString();
                pfi.InnerHtml = sdrpopulate["pfi"].ToString();
                intervention.InnerHtml = sdrpopulate["goe_z"].ToString();
                due.InnerHtml = "₦" + sdrpopulate["due_out"].ToString() + "";
                sd.InnerHtml = sdrpopulate["dof_dis"].ToString();
                ed.InnerHtml = sdrpopulate["due_date"].ToString();
                stat.InnerHtml = sdrpopulate["loan_status"].ToString();
                loanamt.InnerHtml = "₦" + String.Format("{0:N}", sdrpopulate["amt_repaid"].ToString()) + "";
                payamt.InnerHtml = "₦" + String.Format("{0:N}", sdrpopulate["amt_rel"].ToString()) + "";
                factype.InnerHtml = "" + sdrpopulate["models"].ToString() + "";

                sc.Close();

            }
        }


       
    }
}