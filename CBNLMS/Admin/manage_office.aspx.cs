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
    public partial class manageoffice : System.Web.UI.Page
    {
        string useremail;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {
                Div1.Visible = false;
                String welcomename = String.Empty;
                string emailz = string.Empty;
                string lastlogins = string.Empty;
                emailz = Session["Email"].ToString();
                welcomename = Session["ID"].ToString();
                lastlogins = Session["lastlogin"].ToString();
               
            }
            if (!this.IsPostBack)
            {
                Div1.Visible = false;
                this.BindGrid();
                officedrop();
                getstate();
            }
            useremail = Session["Email"].ToString();
        }

        private void BindGrid()
        {
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            string query = "SELECT * FROM dfos";
            using (sc)
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, sc))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        private void getstate()
        {
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            string query = "SELECT * FROM dfos order by state asc";
            using (sc)
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, sc))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        DropDownList1.DataSource = dt;
                        DropDownList1.DataBind();
                        DropDownList1.DataTextField = "state";
                        DropDownList1.DataValueField = "state";
                        DropDownList1.DataBind();

                    }
                }
            }
        }

        public void officedrop()
        {
            //     sc.Open();
            //     SqlCommand com = new SqlCommand("SELECT * from geo_political_zone", sc); // table name 
            //     SqlDataAdapter da = new SqlDataAdapter(com);
            //     DataTable ds = new DataTable();
            //     da.Fill(ds);  // fill dataset
            //   DropDownList2.DataSource = ds;
            //  DropDownList2.DataBind();
            //DropDownList2.DataTextField = "geo_zone";
            //  DropDownList2.DataValueField = "geo_zone";

            //    DropDownList2.DataBind();
            //     sc.Close();
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int customerId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string dfo = (GridView1.DataKeys[e.RowIndex].Values[0]).ToString();
            string query = "DELETE FROM dfos WHERE sn=@customerId";
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@dfo", dfo);
                    cmd.Parameters.AddWithValue("@customerId", customerId);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
                    string useractivity = "DFO Deletion:" + dfo + " State";
                    DateTime now = DateTime.Now;
                    SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                    cmd3.Parameters.AddWithValue("@user", useremail);
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
            int customerId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string dfo = (row.FindControl("txtdfo") as TextBox).Text;
            string state = (row.FindControl("txtstate") as TextBox).Text;
            string geozone = (row.FindControl("txtgeozone") as TextBox).Text;
            string query = "UPDATE dfos SET dfo=@dfo, state=@state, geo_zone =@geozone WHERE sn=@customerId";
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            using (sc)
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@dfo", dfo);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@geozone", geozone);
                    cmd.Parameters.AddWithValue("@customerId", customerId);
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
                    string useractivity = "Upate on DFO:" + dfo + " for " + state + " State";
                    DateTime now = DateTime.Now;
                    SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                    cmd3.Parameters.AddWithValue("@user", useremail);
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
                (e.Row.Cells[4].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this Office Location?');";
            }

        }

        protected void Insert(object sender, EventArgs e)
        {
             string dfo = txtdfo.Text;
            // string country = txtstate.Text;
            string state = DropDownList1.SelectedItem.Text;
            string geo_zone = TextBox1.Text;

            string query = "INSERT INTO dfos VALUES(@dfo, @state, @geozone)";
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            using (sc)
              {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@dfo", dfo);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@geozone", geo_zone);
                    
                    cmd.Connection = sc;
                    sc.Open();
                    cmd.ExecuteNonQuery();
                    string useractivity = "DFO Creation:" + dfo + " for " + state + " State";
                    DateTime now = DateTime.Now;
                    SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                    cmd3.Parameters.AddWithValue("@user", useremail);
                    cmd3.Parameters.AddWithValue("@activity", useractivity);
                    cmd3.Parameters.AddWithValue("@datetime", now);
                    cmd3.ExecuteNonQuery();
                    sc.Close();
                }
            }
            Div1.Visible = true;
            successtxt.InnerHtml = "Office Created Successfully";
            txtdfo.Text = "";
            TextBox1.Text = "";
            this.BindGrid();
        }



        protected void download_list(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Offices.xls"));
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
                SqlCommand cmd = new SqlCommand("select * from dfos", sc);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                sc.Close();
            }
            return dt;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selected = DropDownList1.SelectedItem.Value;
            string geozone = string.Empty;
            
            if (selected == "EKITI" || selected == "EKITI" || selected == "OGUN" || selected == "ONDO" || selected == "OSUN" || selected == "OYO" || selected == "LAGOS")
            {
                geozone = "SOUTH WEST";
                TextBox1.Text = geozone;
            }
            else if (selected == "EDO" || selected == "RIVERS" || selected == "CROSS RIVER" || selected == "DELTA" || selected == "AKWA IBOM" || selected == "BAYELSA")
            {
                geozone = "SOUTH SOUTH";
                TextBox1.Text = geozone;
            }
            else if (selected == "ANAMBRA" || selected == "ABIA" || selected == "IMO" || selected == "EBONYI" || selected == "ENUGU")
            {
                geozone = "SOUTH EAST";
                TextBox1.Text = geozone;
            }
            else if (selected == "SOKOTO" || selected == "ZAMFARA" || selected == "JIGAWA" || selected == "KADUNA" || selected == "KANO" || selected == "KATSINA" || selected == "KEBBI")
            {
                geozone = "NORTH WEST";
                TextBox1.Text = geozone;
            }
            else if (selected == "BAUCHI" || selected == "ADAMAWA" || selected == "BORNO" || selected == "TARABA" || selected == "YOBE" || selected == "GOMBE")
            {
                geozone = "NORTH EAST";
                TextBox1.Text = geozone;
            }
            else if (selected == "PLATEAU" || selected == "NASSARAWA" || selected == "NIGER" || selected == "BENUE" || selected == "ABUJA-FCT" || selected == "KOGI" || selected == "KWARA")
            {
                geozone = "NORTH CENTRAL";
                TextBox1.Text = geozone;
            }
            else
            {
                Response.Write("<script>alert('Selected State of business is not valid');</script>");
                return;
            }
        }
        static void getgeozone()
        {

        }
    }
}