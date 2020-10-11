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
namespace CBNLMS.Inputing._2
{
    public partial class disbursement1 : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            bybank.Visible = false;
            all.Visible = false;
            interventiongridinner.Visible = false;
            geozone.Visible = false;
            bysector.Visible = false;
            byyear.Visible = false;
            bystate.Visible = false;
            stateana.Visible = false;
            geoana.Visible = false;
            sectorana.Visible = false;
            yearana.Visible = false;
            intana.Visible = false;
            modelana.Visible = false;


            if (!IsPostBack)
            {
                string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                // Add Fake Delay to simulate long running process.
               // System.Threading.Thread.Sleep(5000);
              //  getWhileLoopData();
               // getWhileLoopDatahead();
            }
        }

        protected void upload_btn(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // fillselet();
            // getWhileLoopDatahead2();
            // return htmlStr1;
            // Add Fake Delay to simulate long running process.
            System.Threading.Thread.Sleep(1000);
            string droptext = DropDownList2.Text.ToString();
            if (droptext == "All")
            {
                all.Visible = true;
                stateana.Visible = true;
                geoana.Visible = true;
                sectorana.Visible = true;
                yearana.Visible = true;
                intana.Visible = true;
                modelana.Visible = true;
                bybank.Visible = false;
                interventiongridinner.Visible = false;
                geozone.Visible = false;
                bysector.Visible = false;
                byyear.Visible = false;
                bystate.Visible = false;
                interventiongrid();

            }
            if (droptext == "Intervention")
            {
                interventiongridinner.Visible = true;
                intana.Visible = true;
                stateana.Visible = false;
                geoana.Visible = false;
                sectorana.Visible = false;
                yearana.Visible = false;
                modelana.Visible = false;
                bybank.Visible = false;
                all.Visible = false;
                geozone.Visible = false;
                bysector.Visible = false;
                bystate.Visible = false;
                interventiongrid();
                byyear.Visible = false;

            }
            if (droptext == "Bank")
            {
                bybank.Visible = true;
                all.Visible = false;
                interventiongridinner.Visible = false;
                geozone.Visible = false;
                bysector.Visible = false;
                byyear.Visible = false;
                bystate.Visible = false;
                intana.Visible = false;
                stateana.Visible = false;
                geoana.Visible = false;
                sectorana.Visible = false;
                yearana.Visible = false;
                modelana.Visible = false;
                BindGrid();
            }
           
            else if (droptext == "Geopolitical zone")
            {
                geozone.Visible = true;
                all.Visible = false;
                interventiongridinner.Visible = false;
                bybank.Visible = false;
                bysector.Visible = false;
                byyear.Visible = false;
                bystate.Visible = false;
                intana.Visible = false;
                stateana.Visible = false;
                geoana.Visible = true;
                sectorana.Visible = false;
                yearana.Visible = false;
                modelana.Visible = false;
                geozonegrid();
            }
            else if (droptext == "Sector")
            {
                bysector.Visible = true; ;
                geozone.Visible = false;
                all.Visible = false;
                interventiongridinner.Visible = false;
                bybank.Visible = false;
                byyear.Visible = false;
                bystate.Visible = false;
                intana.Visible = false;
                stateana.Visible = false;
                geoana.Visible = false;
                sectorana.Visible = true;
                yearana.Visible = false;
                modelana.Visible = false;
                sectorgrid();
            }
            else if (droptext == "Commodity")
            {
                droptext = "commodity";
            }
            else if (droptext == "Year")
            {
                byyear.Visible = true;
                bysector.Visible = false; ;
                geozone.Visible = false;
                all.Visible = false;
                interventiongridinner.Visible = false;
                bybank.Visible = false;
                bystate.Visible = false;
                intana.Visible = false;
                stateana.Visible = false;
                geoana.Visible = false;
                sectorana.Visible = false;
                yearana.Visible = true;
                modelana.Visible = false;
                yeargrid();
            }
            else if (droptext == "Anchor")
            {
                droptext = "anchor";
            }
            else if (droptext == "Projects")
            {
                byyear.Visible = false;

                droptext = "project";
            }
            else if (droptext == "State")
            {
                bystate.Visible = true;
                byyear.Visible = false;
                bysector.Visible = false; ;
                geozone.Visible = false;
                all.Visible = false;
                interventiongridinner.Visible = false;
                bybank.Visible = false;
                intana.Visible = false;
                stateana.Visible = true;
                geoana.Visible = false;
                sectorana.Visible = false;
                yearana.Visible = false;
                modelana.Visible = false;
                stategrid();
            }
            

        }
        public string fillselet()
        {
            string droptext = DropDownList2.Text.ToString();
            if (droptext == "Intervention")
            {
                droptext = "intervention";
            }
            else if (droptext == "Bank")
            {
                droptext = "bank";
            }
            else if (droptext == "Geopolitical zone")
            {
                droptext = "goe_z";
            }
            else if (droptext == "Sector")
            {
                droptext = "Commodity";
            }
            else if (droptext == "Commodity")
            {
                droptext = "commodity";
            }
            else if (droptext == "year")
            {
                droptext = "date_dis";
            }
            else if (droptext == "Anchor")
            {
                droptext = "anchor";
            }
            else if (droptext == "Projects")
            {
                droptext = "project";
            }
            string htmlStr3 = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "SELECT " + droptext + ",SUM(CAST(amt_rel as float)) from adp group by " + droptext + " ";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                string state = reader.GetString(0);
                double geo_z = reader.GetDouble(1);
                string geozstr = "₦" + String.Format("{0:#,##0.000}", geo_z.ToString());
                //string anchor = reader.GetString(3);
                //string dof_dis = reader.GetString(4);
                //string due_date = reader.GetString(5);
                //string loan_status = reader.GetString(6);
                //string due_out = reader.GetString(20);
                htmlStr3 += "<tr><td>" + state + "</td><td>" + geozstr + "</td></tr>";
            }

            sc.Close();
            return htmlStr3;

        }
        private void BindGrid()
        {
            using (SqlCommand cmd = new SqlCommand("select bank_name, sum(case when loan_amount is null then 0 else loan_amount end) as amtdis, count(loan_id) as noofrec from [cbndb].[dbo].[all_loans] group by bank_name", sc))
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

        private void geozonegrid()
        {
            using (SqlCommand cmd = new SqlCommand("select bus_geozone, sum(case when loan_amount is null then 0 else loan_amount end) as amtdis, count(loan_id) as noofrec from [cbndb].[dbo].[all_loans] group by bus_geozone", sc))
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
        private void sectorgrid()
        {
            using (SqlCommand cmd = new SqlCommand("select sector, sum(case when loan_amount is null then 0 else loan_amount end) as amtdis, count(loan_id) as noofrec from [cbndb].[dbo].[all_loans] group by sector", sc))
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
        private void stategrid()
        {
            using (SqlCommand cmd = new SqlCommand("select bus_stat, sum(case when loan_amount is null then 0 else loan_amount end) as amtdis, count(loan_id) as noofrec from [cbndb].[dbo].[all_loans] group by bus_stat", sc))
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
        private void yeargrid()
        {
            using (SqlCommand cmd = new SqlCommand(" select (case when DATEPART(YYYY, start_date) is null then DATEPART(YYYY, 1900) else DATEPART(YYYY, start_date) end) as year, sum(case when loan_amount is null then 0 else loan_amount end) as amtdis, count(loan_id) as noofrec from [cbndb].[dbo].[all_loans] group by (case when DATEPART(YYYY, start_date) is null then DATEPART(YYYY, 1900) else DATEPART(YYYY, start_date) end) order by year desc", sc))
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

        private void interventiongrid()
        {
            using (SqlCommand cmd = new SqlCommand("select intervention, sum(case when loan_amount is null then 0 else loan_amount end) as amtdis, count(loan_id) as noofrec from [cbndb].[dbo].[all_loans] where intervention != 'ABP' group by intervention", sc))
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

        public string getWhileLoopData()
        {
            string htmlStr = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "SELECT customer_name, (case when customer_unique_id is null then 'NO ID' else customer_unique_id end) as customer_unique_id,(case when bus_stat is null then 'Not Specified' else bus_stat end) as bus_stat, loan_amount,(case when start_date is null then CAST('00:15' AS datetime) else start_date end) as start_date,(case when exp_date is null then CAST('00:15' AS datetime) else exp_date end) as exp_date,(case when loan_status is null then 'Uknown' else loan_status end) as loan_status, case when customer_type is null then 'NO TYPE' else customer_type end as customer_type,case when bank_name is null then 'NO PFI' else bank_name end as bank_name from cbndb.dbo.all_loans";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();

            while (reader.Read())
            {
                string cname = reader.GetString(0);
                string cid = reader.GetString(1);
                string state = reader.GetString(2);
                double disamt = reader["loan_amount"] == DBNull.Value? 0.00: Convert.ToDouble(reader["loan_amount"]);
                DateTime dof_dis = reader.GetDateTime(4);
                DateTime due_date = reader.GetDateTime(5);
                string loan_status = reader.GetString(6);
                string custype = reader.GetString(7);
                string bank = reader.GetString(8);
                htmlStr += "<tr><td>" + cname + "</td><td>" + custype + "</td><td>" + cid + "</td><td>" + state + "</td><td>" + String.Format("{0:#,##0.00}", disamt) + "</td><td>" + dof_dis.ToString("dd/MM/yyyy") + "</td><td>" + due_date.ToString("dd/MM/yyyy") + "</td><td>" + bank + "</td><td>" + loan_status + "</td></tr>";
            }

            sc.Close();
            return htmlStr;
        }

        public string getWhileLoopDatahead()
        {
            string htmlStr = "";

            htmlStr = "<tr><td> CUSTOMER NAME </td><td> CUSTOMER TYPE  </td><td> CUSTOMERID  </td><td>STATE</td><td>AMOUNT DISBURSED(₦)</td><td>DISBURSEMENT DATE</td><td>EXPIRY DATE</td><td>BANK</td><td>STATUS</td></tr>";


            return htmlStr;
        }

        public string getWhileLoopDatahead2()
        {
            string htmlStr2 = "";
            string header = DropDownList2.Text.ToString();
            htmlStr2 = "<tr><td> " + header + " </td><td>Amount Disbursed</td></tr>";


            return htmlStr2;
        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //    string droptext = DropDownList2.Text.ToString();
            //    if (droptext== "Intervention")
            //    {
            //        droptext = "intervention";
            //    }
            //    else if (droptext == "Bank")
            //        {
            //            droptext = "bank";
            //        }
            //    else if (droptext == "Geopolitical zone")
            //    {
            //        droptext = "goe_z";
            //    }
            //    else if (droptext == "Sector")
            //    {
            //        droptext = "Commodity";
            //    }
            //    else if (droptext == "Commodity")
            //    {
            //        droptext = "commodity";
            //    }
            //    else if (droptext == "year")
            //    {
            //        droptext = "date_dis";
            //    }
            //    else if (droptext == "Anchor")
            //    {
            //        droptext = "anchor";
            //    }
            //    else if (droptext == "Projects")
            //    {
            //        droptext = "project";
            //    }
            //    string htmlStr1 = "";
            //    SqlCommand thisCommand = sc.CreateCommand();
            //    thisCommand.CommandText = "SELECT "+droptext+ ",SUM(CAST(amt_rel as float)) from adp group by " + droptext+" ";
            //    sc.Open();
            //    SqlDataReader reader = thisCommand.ExecuteReader();

            //    while (reader.Read())
            //    {
            //        string state = reader.GetString(1);
            //        string geo_z = reader.GetString(2);
            //        string anchor = reader.GetString(3);
            //        string dof_dis = reader.GetString(4);
            //        string due_date = reader.GetString(5);
            //        string loan_status = reader.GetString(6);
            //        string due_out = reader.GetString(20);
            //        htmlStr1 += "<tr><td>" + state + "</td><td>" + geo_z + "</td><td>" + anchor + "</td><td>" + dof_dis + "</td><td>" + due_date + "</td><td>" + loan_status + "</td><td>" + due_out + "</td></tr>";
            //    }

            //    sc.Close();
            //   // return htmlStr1;
        }

        protected void clear_filter(object sender, EventArgs e)
        {
            getWhileLoopData();
            getWhileLoopDatahead();
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {

        }

        protected void statedetails(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            string customerId = (item.FindControl("lblCustomerId") as Label).Text.Trim();
            string querey = "state=" + customerId;
            Response.Redirect("~/Inputing/2/reportdetails.aspx?" + querey);
        }
        protected void interventiondet(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            string customerId = (item.FindControl("lblCustomerId") as Label).Text.Trim();
            string querey = "intervention=" + customerId;
            Session["Intervention"] = customerId;
            Response.Redirect("~/Inputing/2/intervention_details.aspx?" + querey);
        }
            protected void Repeater1_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Repeater2_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Repeater3_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void Repeater4_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void Repeater5_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Repeater6_OnItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        [WebMethod]
        public static List<object> GetMapData()
        {
            string query = "select bus_stat, sum(case when loan_amount is null then 0 else loan_amount end) as loanamount, count(loan_id) as noofrec from [cbndb].[dbo].[all_loans] group by bus_stat";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "State", "LoanAmount","Beneficiaries"
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
                        sdr["bus_stat"], sdr["loanamount"], sdr["noofrec"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }
        [WebMethod]
        public static List<object> GetBarData()
        {
            string query = "select bus_stat, sum(case when loan_amount is null then 0 else loan_amount end) as loanamount, count(loan_id) as noofrec from [cbndb].[dbo].[all_loans] group by bus_stat order by loanamount desc";

            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "State", "Loan Disbursed(N)"
            });
            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;

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
                            //string newer = textInfo.ToTitleCase(sdr["bank_name"].ToString().ToLower());
                            chartData.Add(new object[]
                            {
                          sdr["bus_stat"], sdr["loanamount"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }
        [WebMethod]
        public static List<object> GetPieZone()
        {
            string query = "select (case when bus_geozone='SOUTH EAST' then 'SE' when bus_geozone='SOUTH WEST' then 'SW' when bus_geozone='SOUTH SOUTH' then 'SS' when bus_geozone='NORTH EAST' then 'NE' when bus_geozone='NORTH WEST' then 'NW' when bus_geozone='NORTH CENTRAL' then 'NC' else bus_geozone end) as bus_geozone, sum(loan_amount) as sumamount from cbndb.dbo.all_loans where bus_geozone is not null group by bus_geozone";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Geo-Zone", "LoanAmount"
            });
            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
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
                            string newer = textInfo.ToTitleCase(sdr["bus_geozone"].ToString().ToLower());
                            chartData.Add(new object[]
                            {

                            sdr["bus_geozone"], sdr["sumamount"]
                            });

                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }

        [WebMethod]
        public static List<object> GetSector()
        {
            string query = "select sector, sum(loan_amount) as sumloan from cbndb.dbo.all_loans group by sector order by sumloan desc";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Sector", "Disbursement Amount"
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
                        sdr["sector"], sdr["sumloan"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }

        [WebMethod]
        public static List<object> GetChartData()
        {
            string query = "select (case when DATEPART(YYYY, start_date) is null then DATEPART(YYYY, 1900) else DATEPART(YYYY, start_date) end) as year, sum(loan_amount) as loanamount from cbndb.dbo.all_loans group by DATEPART(YYYY, start_date)";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Year", "LoanAmount"
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
        [WebMethod]
        public static List<object> GetChartData2()
        {
            string query = "select intervention,sum(loan_amount) as loanamount from cbndb.dbo.all_loans where intervention != 'ABP' group by intervention ";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Intervention", "LoanAmount"
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
                        sdr["Intervention"], sdr["loanamount"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }
        [WebMethod]
        public static List<object> getmodel()
        {
            string query = "select customer_type, sum(loan_amount) as sume from cbndb.dbo.all_loans group by customer_type";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Model", "LoanAmount"
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
                        sdr["customer_type"].ToString(), sdr["sume"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }


    }
}