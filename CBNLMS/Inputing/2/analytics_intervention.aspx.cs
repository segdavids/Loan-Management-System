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
    public partial class analytics_all : System.Web.UI.Page
    {
       

            public static string drop { get; set; }
            //string drop;
            SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
            protected void Page_Load(object sender, EventArgs e)
            {
                if (IsPostBack)
                {
                    drop = DropDownList9.SelectedItem.Value.ToString();
                    getWhileLoopData();
                    getWhileLoopData2();
                    getstuff();
                    getstuff1();
                    getbanks();
                    getbusact();
                    totoutstanding();
                    getsyear();
                }
                else
                {
                    //popbvn();
                    drop = DropDownList9.SelectedItem.Value.ToString();
                    // string select = DropDownList99.SelectedItem.Value.ToString();
                    getWhileLoopData();
                    getWhileLoopData2();
                    getstuff();
                    getstuff1();
                    getbanks();
                    getbusact();
                    totoutstanding();
                    getsyear();
                }
            }

            public void getsyear()
            {

                DateTime now = DateTime.Now;
                string noww = now.ToString("yyyy");
                yearnow.InnerHtml = noww;

            }
            public void getstuff()
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select sum(case when loan_amount is null then 0 else loan_amount end) as lamt from all_loans where intervention='" + drop + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    //double amount = reader.GetDouble(0);
                    string naira = " ₦" + String.Format("{0:#,##0.00}", reader["lamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["lamt"]));
                    //amtdis.InnerHtml = naira;
                    totloan.InnerHtml = naira;
                }
                sc.Close();
            }
            public void totoutstanding()
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select sum(case when principal_due is null then 0 else principal_due end) as totoutstanding from all_loans where intervention='" + drop + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                    //double amount = reader.GetDouble(0);
                    string naira = " ₦" + String.Format("{0:#,##0.00}", reader["totoutstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["totoutstanding"]));
                    Span1.InnerHtml = naira;
                }
                sc.Close();
            }
            public void totoutstanding1()
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select (sum(tot_loan_amt))/(count(distinct(DATEPART(YY, month_of_not)))) from agsmeis_application1";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                    double amount = reader.GetDouble(0);
                    string naira = "₦" + String.Format("{0:#,##0.00}", amount);
                    Span1.InnerHtml = naira;
                }
                sc.Close();
            }
            public void getstuff1()
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select count(*) as num from all_loans where intervention='" + drop + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                    //int amount = reader.GetInt32(0);
                    string naira = String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader["num"]));
                    totbenef.InnerHtml = naira;
                }
                sc.Close();
            }
            public void getbanks()
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select count(distinct(bank_name)) as num from all_loans where intervention='" + drop + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                    int amount = reader.GetInt32(0);
                    string naira = String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader["num"]));
                    banks.InnerHtml = naira;
                }
                sc.Close();
            }

            public void getbusact()
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select count(bus_act) as num from agsmeis_application1";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                    int amount = reader.GetInt32(0);
                    string naira = String.Format("{0:#,##0}", amount);
                    // busact.InnerHtml = naira;
                }
                sc.Close();
            }
            public string getWhileLoopData()
            {
                string htmlStr = "";
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = " select top 5 (case when sector = 'NULL' then 'UNcategorized' else sector end) as Business, sum(case when bus_geozone = 'NORTH EAST' then 1 else 0 end) as NE, sum(case when bus_geozone = 'NORTH CENTRAL' then 1 else 0 end) as NC,sum(case when bus_geozone = 'SOUTH WEST' then 1 else 0 end) as SW,sum(case when bus_geozone = 'SOUTH SOUTH' then 1 else 0 end) as SS,sum(case when bus_geozone = 'NORTH WEST' then 1 else 0 end) as NW,sum(case when bus_geozone = 'SOUTH EAST' then 1 else 0 end) as SE,sum(case when bus_geozone = '' then 1 else 0 end) as NotSpecified FROM [cbndb].dbo.all_loans where sector is not NULL and intervention='" + drop + "' group by sector  order by sum(case when bus_geozone = 'NORTH EAST' then 1 else 0 end) desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {
                    string bussec = reader.GetString(0);
                    int ne = reader.GetInt32(1);
                    int nc = reader.GetInt32(2);
                    int sw = reader.GetInt32(3);
                    int ss = reader.GetInt32(4);
                    int nw = reader.GetInt32(5);
                    int se = reader.GetInt32(6);
                    int nsp = reader.GetInt32(7);


                    htmlStr += "<tr><td>" + bussec + "</td><td>" + ne + "</td><td>" + nc + "</td><td>" + sw + "</td><td>" + ss + "</td><td>" + nw + "</td><td>" + se + "</td><td>" + nsp + "</td></tr>";
                }

                sc.Close();
                return htmlStr;
            }
            public string getWhileLoopData2()
            {
                string htmlStr = "";
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select distinct top 10 case when bank_name is null then 'NOT SPECIFIED' else bank_name end as tester, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans where intervention='" + drop + "' group by bank_name ORDER BY num desc, case when bank_name is null then 'NOT SPECIFIED' else bank_name end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {
                    string pfi_name = reader.GetString(0);
                    double numoofout = Convert.ToDouble(reader["num"]);
                    double amountout = Convert.ToDouble(reader["outstandingamt"]);
                    //int sw = reader.GetInt32(3);
                    //int ss = reader.GetInt32(4);
                    // int nw = reader.GetInt32(5);
                    // int se = reader.GetInt32(6);
                    // int nsp = reader.GetInt32(7);


                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + String.Format("{0:#,##0.00}", reader["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";
                }

                sc.Close();
                return htmlStr;
            }
            public void popbvn()
            {
                sc.Open();
                SqlCommand com = new SqlCommand("select * from interventions order by acronym asc", sc); // table name 
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataTable ds = new DataTable();
                da.Fill(ds);  // fill dataset
                DropDownList9.DataSource = ds;
                DropDownList9.DataBind();
                DropDownList9.DataTextField = "acronym";
                DropDownList9.DataValueField = "acronym";

                DropDownList9.DataBind();
                sc.Close();
            }

            [WebMethod]
            public static List<object> GetMapData()
            {
                string query = "select bus_stat, sum(loan_amount) as loanamount, count(*) as noofbenef from cbndb.dbo.all_loans where intervention='" + drop + "' group by bus_stat";
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
            public static List<object> GetMap2Data()
            {
                string query = "select bus_stat, sum(case when principal_due is null then 0 else principal_due end) as prindue,count(*) as noofbenef  from [cbndb].[dbo].[all_loans] where intervention='" + drop + "' group by bus_stat";
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "State", "Principal Due","No. Of Beneficiaries"
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
                        sdr["bus_stat"], sdr["prindue"], sdr["noofbenef"]
                                });
                            }
                        }
                        con.Close();
                        return chartData;
                    }
                }
            }
            [WebMethod]
            public static List<object> disvsout()
            {
                string query = "select (case when DATEPART(YYYY, start_date) is null then DATEPART(YYYY, 1900) else DATEPART(YYYY, start_date) end) as year, sum(case when loan_amount is null then 0 else loan_amount end) as loanamt, sum(case when principal_due is null then 0 else principal_due end) as prindue from [cbndb].[dbo].[all_loans] where intervention='" + drop + "' group by DATEPART(YYYY, start_date)";
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "Year", "Disbursed(N)","Due(N)"
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
                        sdr["year"].ToString(), sdr["loanamt"], sdr["prindue"]
                                });
                            }
                        }
                        con.Close();
                        return chartData;
                    }
                }
            }
            [WebMethod]
            public static List<object> disvsrecovery()
            {
                string query = "  select (case when DATEPART(YYYY, start_date) is null then DATEPART(YYYY, 1900) else DATEPART(YYYY, start_date) end) as year, sum(case when loan_amount is null then 0 else loan_amount end) as loanamt, sum(case when amt_repaid is null then 0 else amt_repaid end) as recovered from [cbndb].[dbo].[all_loans] where intervention='" + drop + "' group by DATEPART(YYYY, start_date) ORDER BY year asc";
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "Year", "Disbursed(N)","Recovered(N)"
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
                        sdr["year"].ToString(), sdr["loanamt"], sdr["recovered"]
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
                string query = "select (case when bus_geozone='SOUTH EAST' then 'SE' when bus_geozone='SOUTH WEST' then 'SW' when bus_geozone='SOUTH SOUTH' then 'SS' when bus_geozone='NORTH EAST' then 'NE' when bus_geozone='NORTH WEST' then 'NW' when bus_geozone='NORTH CENTRAL' then 'NC' else bus_geozone end) as bus_geozone, sum(loan_amount) as sumamount from cbndb.dbo.all_loans where bus_geozone is not null and intervention='" + drop + "' group by bus_geozone";
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
            public static List<object> GetPieloanstat()
            {
                string query = "select case when loan_status is null then 'No Status' else loan_status end as loanstatus, count(loan_status) as numberofloans from cbndb.dbo.all_loans where intervention='" + drop + "' group by loan_status";
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "Status", "Number of Loans"
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
                                string newer = textInfo.ToTitleCase(sdr["loanstatus"].ToString().ToLower());
                                chartData.Add(new object[]
                                {

                            newer, sdr["numberofloans"]
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
                string query = "select sector, sum(loan_amount) as sumloan from cbndb.dbo.all_loans where intervention='" + drop + "' group by sector";
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
                string query = "select (case when DATEPART(YYYY, start_date) is null then DATEPART(YYYY, 1900) else DATEPART(YYYY, start_date) end) as year, sum(loan_amount) as loanamount from cbndb.dbo.all_loans where intervention='" + drop + "' group by DATEPART(YYYY, start_date)";
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
            public static List<object> getmodel()
            {
                string query = "select customer_type, sum(loan_amount) as sume from cbndb.dbo.all_loans where intervention='" + drop + "' group by customer_type";
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

            [WebMethod]
            public static List<object> GetPieData()
            {
                string query = "		select (case when bus_geozone = 'SOUTH WEST' then 'SW' when bus_geozone='SOUTH EAST' then 'SE' when bus_geozone='SOUTH SOUTH' then 'SS' when bus_geozone='NORTH WEST' then 'NW' when bus_geozone='NORTH EAST' then 'NE' when bus_geozone='NORTH CENTRAL' then 'NC' else bus_geozone end ) as bus_geozone,count(*) as noofbene from cbndb.dbo.all_loans where intervention='" + drop + "'  group by bus_geozone";
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "Geo-Zone", "No. of Beneficiaries"
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
                        sdr["bus_geozone"], sdr["noofbene"]
                                });
                            }
                        }
                        con.Close();
                        return chartData;
                    }
                }
            }
            [WebMethod]
            public static List<object> GetPieDatagender()
            {
                string query = "select b.gender as gender, (case when count(a.loan_id) = 0 then 0 else count(a.loan_id) end) as counter from cbndb.dbo.all_loans a inner join cbndb.dbo.all_customer b on a.customer_unique_id=b.BVN where a.intervention='" + drop + "' group by b.gender order by b.gender desc";
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "Gender", "No. of Beneficiaries"
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
                            if (sdr.HasRows)
                            {
                                while (sdr.Read())
                                {
                                    chartData.Add(new object[]
                             {
                        sdr["gender"], sdr["counter"]
                             });
                                }
                            }
                            else
                            {
                                chartData.Add(new object[]
                                {
                        "MALE", 0
                                });
                                chartData.Add(new object[]
                                {
                                               "FEMALE", 0
                                });
                            }
                        }
                        con.Close();
                        return chartData;
                    }
                }
            }

            [WebMethod]
            public static List<object> Getqdate()
            {
                string query = "SELECT 'Q'+CONVERT(VARCHAR(5),DATEPART(QUARTER, start_date)) as quarterman ,sum(loan_amount) as sumloan from cbndb.dbo.all_loans where intervention='" + drop + "' and DATEPART(YYYY,getdate()) = DATEPART(YYYY,start_date) group by DATEPART(QUARTER, start_date)";
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "Quarter", "Amount Disbursed"
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
                        sdr["quarterman"], sdr["sumloan"]
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
                string query = "select distinct top 10 bank_name, sum(case when loan_amount is null then 0 else loan_amount end) as sumloan from cbndb.dbo.all_loans where intervention='" + drop + "' group by bank_name order by sumloan desc";

                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "PFI Name", "Loan Disbursed(N)"
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
                                string newer = textInfo.ToTitleCase(sdr["bank_name"].ToString().ToLower());
                                chartData.Add(new object[]
                                {
                          sdr["bank_name"], sdr["sumloan"]
                                });
                            }
                        }
                        con.Close();
                        return chartData;
                    }
                }
            }
            [WebMethod]
            public static List<object> GetBarData2()
            {
                string query = "select distinct top 10 bank_name, (sum(loan_amount)-sum(case when amt_repaid is null then 0 else amt_repaid end)) as outst from cbndb.dbo.all_loans where intervention='" + drop + "' group by bank_name order by outst desc";

                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "PFI Name", "Outstanding(N)"
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
                          sdr["bank_name"], sdr["outst"]
                                });
                            }
                        }
                        con.Close();
                        return chartData;
                    }
                }
            }
            [WebMethod]
            public static List<object> Getcollection()
            {
                string query = "select (case when bank is null then 'Uspecified' else bank end) year , sum(loan_amount) as sumamount ,ABS(sum(loan_amount)-sum(amt_repaid)) as allout from cbndb.dbo.all_loans where intervention='" + drop + "' group by bank order by bank asc ";
                List<object> chartData = new List<object>();
                chartData.Add(new object[]
                {
        "PFI Type", "Disbursed", "Repaid"
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
                        sdr["year"].ToString(), sdr["sumamount"],sdr["allout"]
                                });
                            }
                        }
                        con.Close();
                        return chartData;
                    }
                }
            }
            protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (DropDownList9.SelectedItem.Value == "ABP")
                {
                    Response.Redirect("~/inputing/2/abp_analytics.aspx");
                }
            }
        }
    }