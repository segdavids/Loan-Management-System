using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;

namespace CBNLMS.Admin
{
    public partial class all_summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {
                String welcomename = String.Empty;
                string emailz = string.Empty;
                emailz = Session["Email"].ToString();
                welcomename = Session["ID"].ToString();
                string lastlogins = Session["lastlogin"].ToString();
            
            }
        }




        [WebMethod]
        public static List<object> GetBarData()
        {
            string query = "select intervention, count(*) as numberofLoan from [cbndb].[dbo].[all_loans] group by intervention";

            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Intervention", "No. of Loan Disbursed"
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
                          sdr["intervention"], sdr["numberofLoan"]
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
            string query = "select intervention,sum(loan_amount) as loanamount from cbndb.dbo.all_loans group by intervention";
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
        public static List<object> GetMapData()
        {
            string query = "select bus_stat, sum(loan_amount) as loanamount, count(*) as noofbenef from cbndb.dbo.all_loans group by bus_stat";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "State", "LoanAmount","No. Of Beneficiaries"
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
                        sdr["bus_stat"], sdr["loanamount"], sdr["noofbenef"]
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
            string query = "select bus_geozone, sum(loan_amount) as sumamount from cbndb.dbo.all_loans where bus_geozone is not null group by bus_geozone";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Geo-Zone", "LoanAmount"
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
        public static List<object> GetComboData()
        {
            string query = "select intervention, sum(case when interest_paid is null then 0 else interest_paid end) as interestpaid, sum(case when interest_due is null then 0 else interest_due end) as interestdue from cbndb.dbo.all_loans group by intervention";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Intervention", "Interest Paid","Interest Due"
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
                        sdr["intervention"], sdr["interestpaid"], sdr["interestdue"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }

        [WebMethod]
        public static List<object> GetComboData1()
        {
            string query = "select intervention, sum(case when principal_repaid is null then 0 else principal_repaid end) as principalpaid, sum(case when principal_due is null then 0 else principal_due end) as principaldue from cbndb.dbo.all_loans group by intervention";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Intervention", "Principal Repaid","Principal Due"
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
                        sdr["intervention"], sdr["principalpaid"], sdr["principaldue"]
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
            string query = "select sector, sum(loan_amount) as sumloan from cbndb.dbo.all_loans group by sector";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Sector", "Loan Amount"
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
        public static List<object> GetPieData()
        {
            string query = "select (case when loan_status is null then 'No Status' else loan_status end) as loan_status, count(*) as number from cbndb.dbo.all_loans group by loan_status";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Loan Status", "No. of Loans"
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
                        sdr["loan_status"], sdr["number"]
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