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
namespace CBNLMS.Inputing._3
{
    public partial class all_loans1 : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                interventionfilter();
               // this.BindGrid();

                //degree.Visible = false;
                //university.Visible = false;
                //workexp.Visible = true;


            }
        }

        private void BindGrid()
        {
            using (SqlCommand cmd = new SqlCommand("select * from all_loans ", sc))
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

        protected void clear_filter(object sender, EventArgs e)
        {

        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           // GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string querey = "loanid=" + e.CommandArgument.ToString();
                string loandetails = e.CommandArgument.ToString();
                Session["Details"] = loandetails;
                Response.Redirect("~/Inputing/3/loan_details.aspx?" + querey);
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
        private void interventionfilter()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select a.acronym from [cbndb].[dbo].[interventions] as a UNION  select  b.acronym from [cbndb].[dbo].[intervention_filter] as b", sc);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList2.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList2.DataTextField = "acronym";
            DropDownList2.DataValueField = "acronym";

            DropDownList2.DataBind();
            sc.Close();

        }
        private void dointerventions()
        {
            string drop = DropDownList2.SelectedItem.Value;
            using (SqlCommand cmd = new SqlCommand("select * from all_loans where intervention = '" + drop + "'", sc))
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
                Session["Details"] = loandetails;
                Response.Redirect("~/Inputing/3/loan_details.aspx?" + querey);
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string droptext = DropDownList2.SelectedItem.Value.ToString();
            if (droptext == "ALL INTERVENTIONS")
            {
                BindGrid();
            }
            else
            {
                dointerventions();
            }
        }
    }
}