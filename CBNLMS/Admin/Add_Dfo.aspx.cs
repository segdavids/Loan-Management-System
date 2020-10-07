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

namespace CBNLMS
{
    public partial class Add_Dfo1 : System.Web.UI.Page
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
                String welcomename = String.Empty;
                string emailz = string.Empty;
                emailz = Session["Email"].ToString();
                welcomename = Session["ID"].ToString();
                string lastlogins = Session["lastlogin"].ToString();
                
            }
            commudpop();
            commass();
            seasonpop();
            getpaymentmode();
            popoffice();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            source.Value = string.Empty;
            nof.Value = string.Empty;
            eop.Value = string.Empty;
            ad.Value = string.Empty;
            yield.Value = string.Empty;
            eout.Value = string.Empty;
            ld.Value = string.Empty;
            bp.Value = string.Empty;
            erep.Value = string.Empty;
        }

        protected void save_data(object sender, EventArgs e)
        {
            DateTime entrydate = DateTime.Now;
            TimeSpan entrytim = DateTime.Now.TimeOfDay;
            double src = Convert.ToDouble(source.Value);
            double eop1 = Convert.ToDouble(eop.Value);
            double nof1 = Convert.ToDouble(nof.Value);
            //double eout1 = Convert.ToDouble(eout.Value);
            double yield1 = Convert.ToDouble(yield.Value);
            double bpval = Convert.ToDouble(bp.Value);
            //double expout = Convert.ToDouble(eout.Value);

            double adis = eop1 * nof1;
            double eoutput = yield1 * nof1;
            double exrep = eoutput * bpval;





            sc.Open();
            SqlCommand cmd3 = new SqlCommand("insert into abp_commudity_summary (entry_date,entry_time,office,commodity,commodity_ass,farming_season,no_of_farmer,total_hectres,eop_amount,loan_amt_dis,yield_p_hectr,exp_out,loan_duration,buying_price,exp_rep,rep_structure) values('" + entrydate + "','" + entrytim + "','" + DropDownList5.SelectedItem.Text + "','" + DropDownList1.SelectedItem.Text + "','" + DropDownList4.SelectedItem.Text + "','" + DropDownList3.SelectedItem.Text + "','" + Convert.ToDouble(source.Value) + "','" + Convert.ToDouble(nof.Value) + "','" + Convert.ToDouble(eop.Value) + "', '" + adis + "','" + Convert.ToDouble(yield.Value) + "','" + eoutput + "','" + Convert.ToDouble(ld.Value) + "','" + Convert.ToDouble(bp.Value) + "','" + exrep + "','" + DropDownList2.SelectedItem.Text + "')", sc);
            cmd3.Parameters.AddWithValue("entry_date", entrydate);
            cmd3.Parameters.AddWithValue("entry_time", entrytim);
            cmd3.Parameters.AddWithValue("office", DropDownList5.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("commodity", DropDownList1.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("commodity_ass", DropDownList4.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("farming_season", DropDownList3.SelectedItem.Text);
            cmd3.Parameters.AddWithValue("no_of_farmer", Convert.ToDouble(source.Value));
            cmd3.Parameters.AddWithValue("total_hectres", Convert.ToDouble(nof.Value));
            cmd3.Parameters.AddWithValue("eop_amount", Convert.ToDouble(eop.Value));
            cmd3.Parameters.AddWithValue("loan_amt_dis", adis);
            cmd3.Parameters.AddWithValue("yield_p_hectr", Convert.ToDouble(yield.Value));
            cmd3.Parameters.AddWithValue("exp_out", eoutput);
            cmd3.Parameters.AddWithValue("loan_duration", Convert.ToDouble(ld.Value));
            cmd3.Parameters.AddWithValue("buying_price", Convert.ToDouble(bp.Value));
            cmd3.Parameters.AddWithValue("exp_rep", exrep);
            cmd3.Parameters.AddWithValue("rep_structure", DropDownList2.SelectedItem.Text);
            cmd3.ExecuteNonQuery();
            sc.Close();
            Response.Write("<script>alert('BP Record Added Successfully');</script>");
            source.Value = string.Empty;
            nof.Value = string.Empty;
            eop.Value = string.Empty;
            ad.Value = string.Empty;
            yield.Value = string.Empty;
            eout.Value = string.Empty;
            ld.Value = string.Empty;
            bp.Value = string.Empty;
            erep.Value = string.Empty;

        }


        public void commudpop()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [commodities]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "commodities";
            DropDownList1.DataValueField = "commodities";

            DropDownList1.DataBind();
            sc.Close();
        }
        public void popoffice()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [dfos]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList5.DataSource = ds;
            DropDownList5.DataBind();
            DropDownList5.DataTextField = "dfo";
            DropDownList5.DataValueField = "dfo";

            DropDownList5.DataBind();
            sc.Close();
        }

        public void commass()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [commodity_association]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList4.DataSource = ds;
            DropDownList4.DataBind();
            DropDownList4.DataTextField = "comm_association";
            DropDownList4.DataValueField = "comm_association";

            DropDownList4.DataBind();
            sc.Close();
        }

        public void getpaymentmode()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [payment_mode]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList2.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList2.DataTextField = "payment_mode";
            DropDownList2.DataValueField = "payment_mode";

            DropDownList2.DataBind();
            sc.Close();
        }

        public void seasonpop()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select * from [season]", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList3.DataSource = ds;
            DropDownList3.DataBind();
            DropDownList3.DataTextField = "farm_season";
            DropDownList3.DataValueField = "farm_season";

            DropDownList3.DataBind();
            sc.Close();
        }

        protected void upload_record(object sender, EventArgs e)
        {

        }

        protected void download_template(object sender, EventArgs e)
        {

        }
    }
}