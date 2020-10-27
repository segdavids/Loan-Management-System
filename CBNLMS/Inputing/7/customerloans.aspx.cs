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
using System.IO;
using System.Drawing;

namespace CBNLMS.Inputing._7
{
    public partial class customerloans : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               
                this.BindGrid();
                this.BindGrid2();
                this.BindGrid_commassoc();
                this.BindGrid_state();
                //degree.Visible = false;
                //university.Visible = false;
                //workexp.Visible = true;


            }
        }

        private void BindGrid()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_customer where customer_type='INDIVIDUAL' ", sc))
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



        protected void Button6_Click(object sender, EventArgs e)
        {

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "All_Customers.xls"));
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
                SqlCommand cmd = new SqlCommand("Select * from all_customer", sc);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sc.Close();
            }
            return dt;
        }

        protected void clear_filter(object sender, EventArgs e)
        {

        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string querey = "bvn=" + e.CommandArgument.ToString();
                string loandetails = e.CommandArgument.ToString();
                Session["CustomerDetails"] = loandetails;
                Session["customertype"] = "Individual";
                Response.Redirect("~/Inputing/7/customerdetails.aspx?" + querey);
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                (e.Row.FindControl("lblRowNumber") as Label).Text = (e.Row.RowIndex + 1).ToString();
                //e.Row.Cells[0].Text = Regex.Replace(e.Row.Cells[0].Text, txtSearch.Text.Trim(), delegate(Match match)
                //{
                //    return string.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value);
                //}, RegexOptions.IgnoreCase);
            }
        }

      

        protected void OnPageIndexChanging_corp(object sender, GridViewPageEventArgs e)
        {
           // GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid2();
        }

        protected void GridView1_RowCommand_corp(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string querey = "uid=" + e.CommandArgument.ToString();
                string loandetails = e.CommandArgument.ToString();
                Session["CorporateDetails"] = loandetails;
                Session["customertype"] = "Corporate";
                Response.Redirect("~/Inputing/7/corporatedetails.aspx?" + querey);
            }
        }

        protected void GridView1_SelectedIndexChanged1_corp(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound_corp(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                (e.Row.FindControl("lblRowNumber") as Label).Text = (e.Row.RowIndex + 1).ToString();
                //e.Row.Cells[0].Text = Regex.Replace(e.Row.Cells[0].Text, txtSearch.Text.Trim(), delegate(Match match)
                //{
                //    return string.Format("<span style = 'background-color:#D9EDF7'>{0}</span>", match.Value);
                //}, RegexOptions.IgnoreCase);
            }
        }

        private void BindGrid2()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_customer where customer_type='CORPORATE' or customer_type='ANCHOR'", sc))
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

        private void BindGrid_commassoc()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_customer where customer_type='COMMODITY ASSOCIATION'", sc))
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

        private void BindGrid_state()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_customer where customer_type='STATE GOVERNMENT'", sc))
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

        protected void Button6_Click_corp(object sender, EventArgs e)
        {

        }

        protected void Button6_Click_cass(object sender, EventArgs e)
        {

        }

        protected void OnPageIndexChanging_cass(object sender, GridViewPageEventArgs e)
        {
            
        }

        protected void GridView1_RowCommand_cass(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged1_cass(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound_cass(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                (e.Row.FindControl("lblRowNumber") as Label).Text = (e.Row.RowIndex + 1).ToString();
               
            }
        }

        protected void Button6_Click_state(object sender, EventArgs e)
        {

        }

        protected void OnPageIndexChanging_state(object sender, GridViewPageEventArgs e)
        {
            GridView4.PageIndex = e.NewPageIndex;
            this.BindGrid_state();
        }

        protected void GridView1_RowCommand_state(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged1_state(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound_state(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                (e.Row.FindControl("lblRowNumber") as Label).Text = (e.Row.RowIndex + 1).ToString();

            }
        }

        protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string querey = "bvn=" + e.CommandArgument.ToString();
                string loandetails = e.CommandArgument.ToString();
                Session["CustomerDetails"] = loandetails;
                Session["customertype"] = "Individual";
                Response.Redirect("~/Inputing/7/customerdetails.aspx?" + querey);
            }
        }

        protected void Repeater2_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string querey = "uid=" + e.CommandArgument.ToString();
                string loandetails = e.CommandArgument.ToString();
                Session["CorporateDetails"] = loandetails;
                Session["customertype"] = "Corporate";
                Response.Redirect("~/Inputing/7/corporatedetails.aspx?" + querey);
            }
        }

        protected void Repeater3_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string querey = "uid=" + e.CommandArgument.ToString();
                string loandetails = e.CommandArgument.ToString();
                Session["CommodityAssociation"] = loandetails;
                Session["customertype"] = "CommodityAssociation";
                Response.Redirect("~/Inputing/7/commassocdetails.aspx?" + querey);
            }
        }

        protected void Repeater4_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string querey = "uid=" + e.CommandArgument.ToString();
                string loandetails = e.CommandArgument.ToString();
                Session["State"] = loandetails;
                Session["customertype"] = "State";
                Response.Redirect("~/Inputing/7/statedetails.aspx?" + querey);
            }
        }
    }
}