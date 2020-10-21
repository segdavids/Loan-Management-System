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

namespace CBNLMS.Reporting._3
{
    public partial class loan_details1 : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Details"] == null)
            {
                Response.Redirect("~/Reporting/3/all_loans.aspx");
            }
            else
            { }
            string loanid = Session["Details"].ToString();

            if (!IsPostBack)
            {
                sc.Open();
                SqlCommand img = new SqlCommand("SELECT * from all_loans WHERE loan_id = @ID", sc);
                SqlParameter paramID = new SqlParameter();
                img.CommandType = CommandType.Text;
                img.Parameters.AddWithValue("@ID", loanid);
                SqlDataReader sdrpopulate = img.ExecuteReader();
                sdrpopulate.Read();
                obligname.InnerHtml = sdrpopulate["customer_name"].ToString();
                intervention.InnerHtml = sdrpopulate["intervention"].ToString();
                paymode.InnerHtml = sdrpopulate["payment_mode"].ToString();
                factype.InnerHtml = sdrpopulate["facility_type"].ToString();
                sd.InnerHtml = sdrpopulate["start_date"].ToString();
                ed.InnerHtml = sdrpopulate["exp_date"].ToString();
                // stat.InnerHtml = sdrpopulate["obligo_name"].ToString();
                loanamt.InnerHtml = "₦" + String.Format("{0:N}", sdrpopulate["loan_amount"].ToString()) + "";
                Span2.InnerHtml = "" + sdrpopulate["num_of_yrs"].ToString() + "Yrs";
                Span1.InnerHtml = "" + sdrpopulate["interest_rate"].ToString() + "%";
                payamt.InnerHtml = "" + String.Format("{0:N}", sdrpopulate["payment_amt"].ToString()) + "";
                mora.InnerHtml = "" + sdrpopulate["moratorium"].ToString() + "";
                numofins.InnerHtml = "" + sdrpopulate["num_of_inst"].ToString() + "";

                sc.Close();

            }
        }
    }
}