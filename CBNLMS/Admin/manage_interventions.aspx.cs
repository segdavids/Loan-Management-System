using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CBNLMS
{
    public partial class manageintervention : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else

            if (!this.IsPostBack)
            {
                {
                    String welcomename = String.Empty;
                    string emailz = string.Empty;
                    string lastlogins = string.Empty;
                    emailz = Session["Email"].ToString();
                    welcomename = Session["ID"].ToString();
                    lastlogins = Session["lastlogin"].ToString();
                    this.BindGrid();
                }
            }
        }


        public string getWhileLoopData()
        {
            string htmlStr = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "SELECT acronym,intervention_name as Intervention_Name from [interventions]";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                string state = reader.GetString(0);
                string geo_z = reader.GetString(1);

                htmlStr += "<tr><td>" + state + "</td><td>" + geo_z + "</td></tr>";
            }

            sc.Close();
            return htmlStr;
        }







        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void download_template(object sender, EventArgs e)
        {

        }

        private void BindGrid()
        {
            sc.Open();
            SqlCommand cmd = new SqlCommand("Select * from interventions order by acronym asc", sc);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            sc.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                example.DataSource = ds;
                example.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                example.DataSource = ds;
                example.DataBind();
                int columncount = example.Rows[0].Cells.Count;
                example.Rows[0].Cells.Clear();
                example.Rows[0].Cells.Add(new TableCell());
                example.Rows[0].Cells[0].ColumnSpan = columncount;
                example.Rows[0].Cells[0].Text = "No Records Found";
            }
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)example.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            sc.Open();
            SqlCommand cmd = new SqlCommand("delete FROM detail where id='" + Convert.ToInt32(example.DataKeys[e.RowIndex].Value.ToString()) + "'", sc);
            cmd.ExecuteNonQuery();
            sc.Close();
            BindGrid();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            example.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            example.EditIndex = -1;
            this.BindGrid();
        }



        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int customerId = Convert.ToInt32(example.DataKeys[e.RowIndex].Values[0]);
            string dfo = (example.DataKeys[e.RowIndex].Values[0]).ToString();
            string query = "DELETE FROM interventions WHERE sn=@dfo";
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@dfo", customerId);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
                    sc.Close();
                }
            }

            this.BindGrid();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            example.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = example.Rows[e.RowIndex];
            int customerId = Convert.ToInt32(example.DataKeys[e.RowIndex].Values[0]);
            string dfo = (row.FindControl("txtacronym") as TextBox).Text;
            string state = (row.FindControl("txtintervention") as TextBox).Text;
            //string geozone = (row.FindControl("txtgeozone") as TextBox).Text;
            string query = "Update interventions set acronym='" + (row.FindControl("txtacronym") as TextBox).Text.ToString() + "', intervention_name=@state WHERE sn=@userid";
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@dfo", (row.FindControl("txtacronym") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@userid", customerId);
                    cmd.Parameters.AddWithValue("@state", state);
                    //  cmd.Parameters.AddWithValue("@geozone", geozone);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
                    sc.Close();
                }
            }
            example.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != example.EditIndex)
            {
                (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void download_list(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Interventions.xls"));
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
                SqlCommand cmd = new SqlCommand("select * from interventions", sc);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sc.Close();
            }
            return dt;
        }

        protected void Insert(object sender, EventArgs e)
        {
            string dfo = txtacronym.Text;
            string country = txtintervention.Text;
            //string geo_zone = DropDownList2.SelectedItem.Text;

            string query = "INSERT INTO interventions VALUES(@dfo, @state)";
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@dfo", dfo);
                    cmd.Parameters.AddWithValue("@state", country);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
                    sc.Close();
                }
            }
            txtacronym.Text = "";
            txtintervention.Text = "";
            this.BindGrid();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

      
    }
}