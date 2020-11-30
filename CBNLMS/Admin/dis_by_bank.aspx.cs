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
using System.Globalization;
using System.IO;

namespace CBNLMS.Admin
{
    public partial class dis_by_bank : System.Web.UI.Page
    {
        public static string drop { get; set; }
        public static string statenamesql { get; set; }
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                getstateurl();
                drop = DropDownList9.SelectedItem.Value.ToString();
                //loanperinervention();
                //getbeneficiaries();
                //totoutstanding();
                //getbanks();
                //getWhileLoopDatapfitype();
                //getWhileLoopDatabysector();
                //getWhileLoopDatabysseason();
                //getWhileLoopDatabycommodity();
                //loanforallintervention();
                //totoutstandingforallintervention();
                //countpfiallint();
                //countbenefallint();
                getWhileLoopData2all();
                //getWhileLoopDatabysectorall();
                //getWhileLoopDatabysseasonall();
                //getWhileLoopDatabycommodityall();
                //getWhileLoopDatabyAnchorall();
                //getgeozone();
                //getfarmers();
                //getcommodity();
                //getimage();
                //getalbum();
            }
            else
            {
                getstateurl();
                //popbvn();
                drop = DropDownList9.SelectedItem.Value.ToString();
                // statename = DropDownList99.SelectedItem.Value.ToString();
                //loanperinervention();
                //getbeneficiaries();
                //totoutstanding();
                //getbanks();
                //getWhileLoopDatapfitype();
                //getWhileLoopDatabysector();
                //getWhileLoopDatabysseason();
                //getWhileLoopDatabycommodity();
                //loanforallintervention();
                //totoutstandingforallintervention();
                //countpfiallint();
                //countbenefallint();
                getWhileLoopData2all();
                //getWhileLoopDatabysectorall();
                //getWhileLoopDatabysseasonall();
                //getWhileLoopDatabycommodityall();
                //getWhileLoopDatabyAnchorall();
                //getgeozone();
                //getfarmers();
                //getcommodity();
                //getimage();
                //getalbum();
            }
        }

        public void getstateurl()
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            int idx = url.IndexOf('?');
            string query = idx >= 0 ? url.Substring(idx) : "";
            statenamesql = HttpUtility.ParseQueryString(query).Get("bank");
            test.InnerHtml = statenamesql;
            // state2.InnerHtml = HttpUtility.ParseQueryString(query).Get("state");
            statename.InnerHtml = statenamesql;
            //;
            // div_img.Style.Add("background-image", "url('" + "../images/states/" + statenamesql + ".jpg");
        }

        private void getWhileLoopData2all()
        {
            using (SqlCommand cmd = new SqlCommand("select intervention, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount, sum(case when interest_due is null then 0 else interest_due end) interest_due, sum(case when interest_paid is null then 0 else interest_paid end) interest_paid, (case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num from cbndb.dbo.all_loans where bank_name='" + statenamesql + "'  group by intervention ORDER BY outstandingamt desc, intervention desc", sc))

            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater3.DataSource = dt;
                        Repeater3.DataBind();
                        return;
                    }
                }
            }
        }
        protected void interbybank(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            string customerId = (item.FindControl("lblCustomerId") as Label).Text.Trim();
            string querey = "state=" + customerId;
            Response.Redirect("~/Admin/reportdetails.aspx?" + querey);
        }

        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}