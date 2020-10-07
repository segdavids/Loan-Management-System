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

namespace CBNLMS.Admin
{
    public partial class seasons : System.Web.UI.Page
    {
        string test;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }


            if (!this.IsPostBack)
            {
                string lastlogins = string.Empty;
                String welcomename = String.Empty;
                string emailz = string.Empty;
                emailz = Session["Email"].ToString();
                welcomename = Session["ID"].ToString();
                lastlogins = Session["lastlogin"].ToString();

                this.BindGrid();

            }
            test = Session["Email"].ToString();

        }
        private void BindGrid()
        {
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");

            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * from [season]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = sc;
                        sda.SelectCommand = cmd;
                        sc.Open();
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                        }
                        sc.Close();
                    }
                }
            }
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
          //  int customerId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string customerId = (GridView1.DataKeys[e.RowIndex].Values[0]).ToString();
            string query = "DELETE FROM [season] WHERE farm_season=@dfo";
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@dfo", customerId);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
                    string useractivity = "Deleted Season:" + customerId + "";
                    DateTime now = DateTime.Now;
                    SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                    cmd3.Parameters.AddWithValue("@user", test);
                    cmd3.Parameters.AddWithValue("@activity", useractivity);
                    cmd3.Parameters.AddWithValue("@datetime", now);
                    cmd3.ExecuteNonQuery();
                    sc.Close();
                }
            }

            this.BindGrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string customerId = (GridView1.DataKeys[e.RowIndex].Values[0]).ToString();
            string dfo = (row.FindControl("txtdfo") as TextBox).Text;
            // string state = (row.FindControl("txtstate") as TextBox).Text;
            //string geozone = (row.FindControl("txtgeozone") as TextBox).Text;
            string query = "UPDATE [season] SET farm_season = '" + dfo + "' WHERE farm_season = @sn";
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@dfo", dfo);
                    cmd.Parameters.AddWithValue("@sn", customerId);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
                    string useractivity = "Updated Season:" + customerId + "";
                    DateTime now = DateTime.Now;
                    SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                    cmd3.Parameters.AddWithValue("@user", test);
                    cmd3.Parameters.AddWithValue("@activity", useractivity);
                    cmd3.Parameters.AddWithValue("@datetime", now);
                    cmd3.ExecuteNonQuery();
                    sc.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.BindGrid();


        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[2].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this Season?');";
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd3 = new SqlCommand("insert into season (farm_season) values('" + TextBox3.Text + "')", sc);
            cmd3.Parameters.AddWithValue("farm_season", TextBox3.Text);
            sc.Open();
            cmd3.ExecuteNonQuery();
            string useractivity = "Created Season:" + TextBox3.Text + "";
            DateTime now = DateTime.Now;
            SqlCommand cmd4 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
            cmd4.Parameters.AddWithValue("@user", test);
            cmd4.Parameters.AddWithValue("@activity", useractivity);
            cmd4.Parameters.AddWithValue("@datetime", now);
            cmd4.ExecuteNonQuery();
            sc.Close();
            Response.Write("<script>alert('Season Created Successfully');</script>");
            TextBox3.Text = string.Empty;
            this.BindGrid();

        }

        protected void download_list(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "seasons.xls"));
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
                SqlCommand cmd = new SqlCommand("select * from [season]", sc);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sc.Close();
            }
            return dt;
        }


        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}