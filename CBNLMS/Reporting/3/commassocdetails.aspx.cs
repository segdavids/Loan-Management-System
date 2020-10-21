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
    public partial class commassocdetails : System.Web.UI.Page
    {
        string amortid;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {
                //string welcomename = String.Empty;
                //string emailz = string.Empty;
                //emailz = Session["Email"].ToString();
                //welcomename = Session["ID"].ToString();
                //string lastlogins = Session["lastlogin"].ToString();

            }
            if (Session["CommodityAssociation"] == null)
            {
                Response.Redirect("~/Reporting/3/customerlist.aspx");
            }
            else
            {

            }
            amortid = Session["CommodityAssociation"].ToString();

            if (!IsPostBack)
            {


                BindGrid();



            }
        }

        public void BindGrid()
        {
            sc.Open();
            SqlCommand getallloans = new SqlCommand("select * from all_loans where customer_unique_id = @bvn ", sc);
            getallloans.Parameters.AddWithValue("@bvn", amortid);
            using (SqlDataAdapter sda = new SqlDataAdapter(getallloans))
            {
                getallloans.Connection = sc;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    SqlCommand getcdet = new SqlCommand("select phone,customer_type,(case when email_add is null then 'No Email' else email_add end) as email_add, (case when assoc_name is null then 'No assoc. Name' else assoc_name end) as assoc_name,(case when association_pres_email is null then 'Not Provided' else association_pres_email end) as association_pres_email from all_customer where phone = @bvn ", sc);
                    getcdet.Parameters.AddWithValue("@bvn", amortid);
                    SqlDataReader sdrpopulate = getcdet.ExecuteReader();
                    sdrpopulate.Read();
                   string assocname = sdrpopulate["assoc_name"].ToString();
                    string assocpresem = sdrpopulate["association_pres_email"].ToString();
                    string customertype = sdrpopulate["customer_type"].ToString();
                    //string anchortype = sdrpopulate["anchor_type"].ToString();
                    //string anchorname = sdrpopulate["anchor_name"].ToString();
                    obligname.InnerHtml = "" + assocname + "";
                    state.InnerHtml = "<b>Customer Type:</b> " + customertype + " </br> <b>Phone:</b> " + sdrpopulate["phone"].ToString() + " </br> <b>Association Pres Email:</b> " + assocpresem + "";
                    season.InnerHtml = sdrpopulate["phone"].ToString();
                    pfi.InnerHtml = sdrpopulate["email_add"].ToString();




                    sc.Close();
                }
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Details")
            {
                string querey = "loan_id=" + e.CommandArgument.ToString();
                string amortdet = e.CommandArgument.ToString();
                Session["ViewSchedule"] = amortdet;
                Response.Redirect("~/Reporting/3/viewschedule.aspx?" + querey);
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

            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

        }
    }
}