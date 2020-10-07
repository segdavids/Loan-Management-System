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
    public partial class ManageCacs : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            this.BindGrid();
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }

        }
        private void BindGrid()
        {
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");

            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand("SELECT farm_season from [season]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = sc;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
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
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");

            //int customerId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string farm_season = (GridView1.DataKeys[e.RowIndex].Values[0]).ToString();
            using (sc)
            {
                
                using (SqlCommand cmd = new SqlCommand("DELETE FROM season WHERE farm_season = @farm_season"))
                {
                    cmd.Parameters.AddWithValue("@farm_season", farm_season);
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
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");

            GridViewRow row = GridView1.Rows[e.RowIndex];
            // int farm_season = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string farm_season = (GridView1.DataKeys[e.RowIndex].Values[0]).ToString();

          string farm_season1 = (row.Cells[2].Controls[0] as TextBox).Text;
         //   string country = (row.Cells[3].Controls[0] as TextBox).Text;
            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE [season] SET farm_season = @farm_season WHERE farm_season = @farm_season"))
                {
                    cmd.Parameters.AddWithValue("@farm_season", farm_season);
                  //  cmd.Parameters.AddWithValue("@Name", name);
                 //   cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
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
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
    }
}