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

namespace CBNLMS.Management
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                // this.BindGrid();
                dointerventions();
                dointerventi();
                totaloutstanding();
                currenty();
                totaldisburse();
                analysis3();
                filter();
                //degree.Visible = false;
                //university.Visible = false;
                //workexp.Visible = true;


            }
        }
        private void BindGrid()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_loans where loan_id=2344", sc))
            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                        return;
                    }
                }
            }
        }


        protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {

                string querey = "loanid=" + e.CommandArgument.ToString();

                string loandetails = e.CommandArgument.ToString();
                sc.Open();
                SqlCommand img = new SqlCommand("select start_date from all_loans where loan_guid='" + loandetails + "'", sc);
                SqlParameter paramID = new SqlParameter();
                img.CommandType = CommandType.Text;
                img.Parameters.AddWithValue("@ID", loandetails);
                SqlDataReader sdrpopulate = img.ExecuteReader();
                sdrpopulate.Read();
                if (sdrpopulate["start_date"] == DBNull.Value)
                {
                    Response.Write("<script>alert('The Loan you have selected does not have a Start Date: Schedule for this Loan cannot be Generated!');</script>");
                }
                else
                {

                    Session["Details"] = loandetails;
                    string amortdet = e.CommandArgument.ToString();
                   // string obligor = (Repeater1.FindControl("lblContactName") as Label).Text.Trim();
                    Session["ViewSchedule"] = amortdet;
                  //  Session["Obligor"] = amortdet;
                    Response.Redirect("~/Management/viewschedule.aspx?" + querey);
                }
                sc.Close();

            }
        }
        private void dointerventions()
        {
            // string drop = DropDownList2.SelectedItem.Value;
            using (SqlCommand cmd = new SqlCommand("select case when bank_name is null then 'NOT SPECIFIED' else bank_name end as tester, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans group by bank_name ORDER BY outstandingamt desc, case when bank_name is null then 'NOT SPECIFIED' else bank_name end desc", sc))
            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater2.DataSource = dt;
                        Repeater2.DataBind();
                        return;
                    }
                }
            }

        }
        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
        }


        private void dointerventi()
        {
            // string drop = DropDownList2.SelectedItem.Value;
            using (SqlCommand cmd = new SqlCommand("select case when intervention is null then 'NOT SPECIFIED' else intervention end as tester, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans group by intervention ORDER BY outstandingamt desc, case when intervention is null then 'NOT SPECIFIED' else intervention end desc", sc))
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
        private void currenty()
        {
            // string drop = DropDownList2.SelectedItem.Value;
            using (SqlCommand cmd = new SqlCommand("select COALESCE(SUM(loan_amount ),0) as currentyr from all_loans where  YEAR(start_date) = YEAR(CURRENT_TIMESTAMP)", sc))
            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater5.DataSource = dt;
                        Repeater5.DataBind();
                        return;
                    }
                }
            }
        }
        private void totaldisburse()
        {
            // string drop = DropDownList2.SelectedItem.Value;
            using (SqlCommand cmd = new SqlCommand("select COALESCE(SUM(loan_amount ),0) as totaldisbursed from all_loans", sc))
            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater6.DataSource = dt;
                        Repeater6.DataBind();
                        return;
                    }
                }
            }
        }
        private void totaloutstanding()
        {
            // string drop = DropDownList2.SelectedItem.Value;
            using (SqlCommand cmd = new SqlCommand("select count(distinct(bank_name)) as totpfi, count(*) as bene, sum(case when principal_due is null then 0 else principal_due end) as totoutstanding from all_loans", sc))
            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater4.DataSource = dt;
                        Repeater4.DataBind();
                        return;
                    }
                }
            }

        }
        private void analysis3()
        {
            // string drop = DropDownList2.SelectedItem.Value;
            using (SqlCommand cmd = new SqlCommand("select count(distinct(intervention)) as inter, sum(case when loan_amount is null then 0 else loan_amount end) as dis, sum(case when principal_due is null then 0 else principal_due end) as out from all_loans", sc))
            {
                string ok = cmd.ToString();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = sc;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Repeater7.DataSource = dt;
                        Repeater7.DataBind();
                        return;
                    }
                }
            }

        }
        protected void Repeater3_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
        }


        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            //    RepeaterItem item = e.Item;
            //    Label lbldate = item.FindControl("Label3") as Label;
            //    if (lbldate.Text.ToString() == "Active")
            //    {

            //        lbldate.CssClass = "badge-primary";
            //    }
            //    if (lbldate.Text.ToString() == "Pending")
            //    {

            //        lbldate.CssClass = "badge-warning";
            //    }
            //    if (lbldate.Text.ToString() == "Due")
            //    {

            //        lbldate.CssClass = "badge-danger";
            //    }
            //    if (lbldate.Text.ToString() == "Repaid")
            //    {

            //        lbldate.CssClass = "badge-info";
            //    }
            //    if (lbldate.Text.ToString() == "Denied")
            //    {

            //        lbldate.CssClass = "badge-danger";
            //    }

            //}
        }
        protected DataTable GetDatafromDatabase()
        {
            DataTable dt = new DataTable();
            using (sc)
            {
                sc.Open();
                SqlCommand cmd = new SqlCommand("Select * from all_loans", sc);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sc.Close();
            }
            return dt;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "All_Loans.xls"));
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

        [WebMethod]
        public static List<object> GetChartData()
        {
            string query = "select (case when DATEPART(YYYY, start_date) is null then DATEPART(YYYY, 1900) else DATEPART(YYYY, start_date) end) as year, sum(loan_amount) as loanamount from cbndb.dbo.all_loans group by DATEPART(YYYY, start_date) order by DATEPART(YYYY, start_date) asc";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Year", "Amount Disbursed"
            });
            using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true"))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            chartData.Add(new object[]
                            {
                        sdr["year"].ToString(), sdr["loanamount"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }

        private void filter()
        {
            string constr = ConfigurationManager.ConnectionStrings["cbndbConnectionString"].ConnectionString;
            string query = "SELECT * from [cbndb].[dbo].[all_loans] WHERE loan_guid is not null";

            string condition = string.Empty;
            string condition2 = string.Empty;
            string condition3 = string.Empty;
            string condition4 = string.Empty;
            foreach (ListItem item in CheckBoxList1.Items)
            {
                condition += item.Selected ? string.Format("'{0}',", item.Value) : string.Empty;
            }
            foreach (ListItem item in CheckBoxList2.Items)
            {
                condition2 += item.Selected ? string.Format("'{0}',", item.Value) : string.Empty;
            }
            if (RadioButtonList1.SelectedIndex > -1)
            {
                condition3 = string.Format("'{0}',", RadioButtonList1.SelectedItem.Value);
            }
            foreach (ListItem item in CheckBoxList3.Items)
            {
                condition4 += item.Selected ? string.Format("'{0}',", item.Value) : string.Empty;
            }



            if (!string.IsNullOrEmpty(condition))
            {
                label1.Visible = true;
                string temp = condition.Remove(condition.Length - 1);
                label1.InnerHtml = "Intervention:" + temp.Replace("'","")+"";
                condition = string.Format(" AND intervention IN ({0})", condition.Substring(0, condition.Length - 1));
                
            }
            else
            {
                label1.Visible = false;
            }
            if (!string.IsNullOrEmpty(condition2))
            {
                Span2.Visible = true;
                string temp = condition2.Remove(condition2.Length - 1);
                Span2.InnerHtml = "State:" + temp.Replace("'", "") + "";
                condition2 = string.Format(" AND bus_stat IN ({0})", condition2.Substring(0, condition2.Length - 1));
            }
            else
            {
                Span2.Visible = false;
            }
            if (!string.IsNullOrEmpty(condition3))
            {
                Span3.Visible = true;
                string temp = condition3.Remove(condition3.Length - 1);
                Span3.InnerHtml = "PFI:" + temp.Replace("'", "") + "";
                condition3 = string.Format(" AND bank_name IN ({0})", condition3.Substring(0, condition3.Length - 1));
            }
            else
            {
                Span3.Visible = false;
            }
            if (!string.IsNullOrEmpty(condition4))
            {
                Span4.Visible = true;
                string temp = condition4.Remove(condition4.Length - 1);
                Span4.InnerHtml = "Geo-Zone:" + temp.Replace("'", "") + "";
                condition4 = string.Format(" AND bus_geozone IN ({0})", condition4.Substring(0, condition4.Length - 1));
            }
            else
            {
                Span4.Visible = false;
            }


            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query + condition + condition2 + condition3 + condition4))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        cmd.Connection = con;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            Repeater1.DataSource = dt;
                            Repeater1.DataBind();
                        }
                    }
                }
            }
        }

                 
                    

               
         
        protected void Repeater2_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void Repeater3_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            filter();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            RadioButtonList1.SelectedIndex = -1;
            filter();
        }
        protected void clear_intervention(object sender, EventArgs e)
        {
            CheckBoxList1.SelectedIndex = -1;
            filter();
        }
        protected void clear_state(object sender, EventArgs e)
        {
            CheckBoxList2.SelectedIndex = -1;
            filter();
        }
        protected void clear_geozone(object sender, EventArgs e)
        {
            CheckBoxList3.SelectedIndex = -1;
            filter();
        }
        protected void clear_all(object sender, EventArgs e)
        {
            CheckBoxList1.SelectedIndex = -1;
            CheckBoxList2.SelectedIndex = -1;
            CheckBoxList3.SelectedIndex = -1;
            RadioButtonList1.SelectedIndex = -1;
            filter();
        }
    }
}