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
    public partial class aads_analytics : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {

            getWhileLoopData();
            getstuff();
            getstuff1();
            getbanks();
            getbusact();
        }
        public void getstuff()
        {
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "select sum(tot_loan_amt) from agsmeis_application1";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            while (reader.Read())
            {
                double amount = reader.GetDouble(0)-8563212722;
                string naira = "₦" + String.Format("{0:#,##0.00}", amount);
                amtdis.InnerHtml = naira;
                totloan.InnerHtml = naira;
            }
            sc.Close();
        }
        public void avdisperyr()
        {
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "select (sum(tot_loan_amt))/(count(distinct(DATEPART(YY, month_of_not)))) from agsmeis_application1";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            while (reader.Read())
            {
                double amount = reader.GetDouble(0);
                string naira = "₦" + String.Format("{0:#,##0.00}", amount);
                //   average.InnerHtml = naira;
            }
            sc.Close();
        }
        public void getstuff1()
        {
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "select count(*) as num from agsmeis_application1";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            while (reader.Read())
            {
                int amount = reader.GetInt32(0)-2553;
                string naira = String.Format("{0:#,##0}", amount);
                totbenef.InnerHtml = naira;
            }
            sc.Close();
        }
        public void getbanks()
        {
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "select count(distinct(bank)) from agsmeis_application1";
            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            while (reader.Read())
            {
                int amount = reader.GetInt32(0)+2;
                string naira = String.Format("{0:#,##0}", amount);
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
                int amount = reader.GetInt32(0)-1552;
                string naira = String.Format("{0:#,##0}", amount);
                // busact.InnerHtml = naira;
            }
            sc.Close();
        }
        public string getWhileLoopData()
        {
            string htmlStr = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = " select top 5 (case when bus_sector = 'NULL' then 'UNcategorized' else bus_sector end) as Business, sum(case when geo_zone = 'NORTH-EAST' then 1 else 0 end) as NE, sum(case when geo_zone = 'NORTH-CENTRAL' then 1 else 0 end) as NC,sum(case when geo_zone = 'SOUTH-WEST' then 1 else 0 end) as SW,sum(case when geo_zone = 'SOUTH-SOUTH' then 1 else 0 end) as SS,sum(case when geo_zone = 'NORTH-WEST' then 1 else 0 end) as NW,sum(case when geo_zone = 'SOUTH-EAST' then 1 else 0 end) as SE,sum(case when geo_zone = '' then 1 else 0 end) as NotSpecified FROM [cbndb].dbo.agsmeis_application1 where bus_sector is not NULL group by bus_sector  order by sum(case when geo_zone = 'NORTH-EAST' then 1 else 0 end) desc";
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
    }
}