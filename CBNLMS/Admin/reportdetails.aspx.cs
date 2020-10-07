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
using System.IO;

namespace CBNLMS.Admin
{
    public partial class reportdetails : System.Web.UI.Page
    {
        public static string drop { get; set; }
        public static string statenamesql { get; set; }
        
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                getstateurl();
                drop = DropDownList9.SelectedItem.Value.ToString();
                loanperinervention();
                getbeneficiaries();
                totoutstanding();
                getbanks();
                getWhileLoopDatapfitype();
                getWhileLoopDatabysector();
                getWhileLoopDatabysseason();
                getWhileLoopDatabycommodity();
                loanforallintervention();
                totoutstandingforallintervention();
                countpfiallint();
                countbenefallint();
                getWhileLoopData2all();
                getWhileLoopDatabysectorall();
                getWhileLoopDatabysseasonall();
                getWhileLoopDatabycommodityall();
                getWhileLoopDatabyAnchorall();
                getgeozone();
                getfarmers();
                getcommodity();
                getimage();
                getalbum();
            }
            else
            {
                getstateurl();
                //popbvn();
                drop = DropDownList9.SelectedItem.Value.ToString();
               // statename = DropDownList99.SelectedItem.Value.ToString();
                loanperinervention();
                getbeneficiaries();
                totoutstanding();
                getbanks();
                getWhileLoopDatapfitype();
                getWhileLoopDatabysector();
                getWhileLoopDatabysseason();
                getWhileLoopDatabycommodity();
                loanforallintervention();
                totoutstandingforallintervention();
                countpfiallint();
                countbenefallint();
                getWhileLoopData2all();
                getWhileLoopDatabysectorall();
                getWhileLoopDatabysseasonall();
                getWhileLoopDatabycommodityall();
                getWhileLoopDatabyAnchorall();
                getgeozone();
                getfarmers();
                getcommodity();
                getimage();
                getalbum();
            }
           

        }
        public void getstateurl()
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            int idx = url.IndexOf('?');
            string query = idx >= 0 ? url.Substring(idx) : "";
            statenamesql = HttpUtility.ParseQueryString(query).Get("state");
            test.InnerHtml = statenamesql;
            // state2.InnerHtml = HttpUtility.ParseQueryString(query).Get("state");
            statename.InnerHtml = statenamesql;
            //;
           // div_img.Style.Add("background-image", "url('" + "../images/states/" + statenamesql + ".jpg");
        }
        public void getgeozone()
        {
            string selected = statenamesql;
            //string geozone;
            if (selected == "EKITI" || selected == "EKITI" || selected == "ONDO" || selected == "OSUN" || selected == "OYO" || selected == "LAGOS")
            {
                geozone.InnerHtml = "SOUTH WEST";
            }
            else if (selected == "EDO" || selected == "RIVERS" || selected == "CROSS RIVER" || selected == "DELTA" || selected == "AKWA IBOM" || selected == "BAYELSA")
            {
                geozone.InnerHtml = "SOUTH SOUTH";
            }
            else if (selected == "ANAMBRA" || selected == "ABIA" || selected == "IMO" || selected == "EBONYI" || selected == "ENUGU")
            {
                geozone.InnerHtml = "SOUTH EAST";
            }
            else if (selected == "SOKOTO" || selected == "ZAMFARA" || selected == "JIGAWA" || selected == "KADUNA" || selected == "KANO" || selected == "KATSINA" || selected == "KEBBI")
            {
                geozone.InnerHtml = "NORTH WEST";
            }
            else if (selected == "BAUCHI" || selected == "ADAMAWA" || selected == "BORNO" || selected == "TARABA" || selected == "YOBE" || selected == "GOMBE")
            {
                geozone.InnerHtml = "NORTH EAST";
            }
            else if (selected == "PLATEAU" || selected == "NASSARAWA" || selected == "NIGER" || selected == "BENUE" || selected == "ABUJA-FCT" || selected == "KOGI" || selected == "KWARA")
            {
                geozone.InnerHtml = "NORTH CENTRAL";
            }
        }
        public void loanforallintervention()
        {
           
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select sum(case when loan_amount is null then 0 else loan_amount end) as lamt from abp_intervention where state='" + statenamesql + "'";
                
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                double firstsum = reader["lamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["lamt"]);
                SqlCommand thisCommand2 = sc.CreateCommand();
                thisCommand2.CommandText = "select sum(case when loan_amount is null then 0 else loan_amount end) as lamt2 from all_loans where bus_stat='" + statenamesql + "'";
                SqlDataReader reader2 = thisCommand2.ExecuteReader();
                while (reader2.Read())
                {
                    double secondsum = reader2["lamt2"] == DBNull.Value ? 0 : Convert.ToDouble(reader2["lamt2"]);
                    double totalsum = secondsum + firstsum;
                    string naira = " ₦" + String.Format("{0:#,##0.00}", totalsum);
                    //amtdis.InnerHtml = naira;
                    totloan.InnerHtml = naira;
                }
                
                    
                }
                sc.Close();
            
        }
        public void totoutstandingforallintervention()
        {

            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "select sum(case when loan_outstanding is null then 0 else loan_outstanding end) as totoutstanding from abp_intervention where state='" + statenamesql + "'";

            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            while (reader.Read())
            {
                double firstsum = reader["totoutstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["totoutstanding"]);
                SqlCommand thisCommand2 = sc.CreateCommand();
                thisCommand2.CommandText = "select sum(case when principal_due is null then 0 else principal_due end) as totoutstanding2 from all_loans where bus_stat='" + statenamesql + "'";
                SqlDataReader reader2 = thisCommand2.ExecuteReader();
                while (reader2.Read())
                {
                    double secondsum = reader2["totoutstanding2"] == DBNull.Value ? 0 : Convert.ToDouble(reader2["totoutstanding2"]);
                    double totalsum = secondsum + firstsum;
                    string naira = " ₦" + String.Format("{0:#,##0.00}", totalsum);
                    //amtdis.InnerHtml = naira;
                    Span1.InnerHtml = naira;
                }


            }
            sc.Close();

        }
        public void countpfiallint()
        {

            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "select count(distinct(pfi_name)) as num from abp_intervention where state='" + statenamesql + "'";

            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            while (reader.Read())
            {
                double firstsum = reader["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader["num"]);
                SqlCommand thisCommand2 = sc.CreateCommand();
                thisCommand2.CommandText = "select count(distinct(bank_name)) as num from all_loans where bus_stat='" + statenamesql + "'";
                SqlDataReader reader2 = thisCommand2.ExecuteReader();
                while (reader2.Read())
                {
                    double secondsum = reader2["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader2["num"]);
                    double totalsum = secondsum + firstsum;
                    string naira = String.Format("{0:#,##0}", totalsum);
                    //amtdis.InnerHtml = naira;
                    banks.InnerHtml = naira;
                }


            }
            sc.Close();

        }
        public void countbenefallint()
        {

            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = "select count(loan_guid) as num from abp_intervention where state='" + statenamesql + "'";

            sc.Open();
            SqlDataReader reader = thisCommand.ExecuteReader();
            while (reader.Read())
            {
                double firstsum = reader["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader["num"]);
                SqlCommand thisCommand2 = sc.CreateCommand();
                thisCommand2.CommandText = "select count(*) as num from all_loans where bus_stat='" + statenamesql + "'";
                SqlDataReader reader2 = thisCommand2.ExecuteReader();
                while (reader2.Read())
                {
                    double secondsum = reader2["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader2["num"]);
                    double totalsum = secondsum + firstsum;
                    string naira = String.Format("{0:#,##0}", totalsum);
                    //amtdis.InnerHtml = naira;
                    totbenef.InnerHtml = naira;
                }


            }
            sc.Close();

        }
        public void getcommodity()
        {
           
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select count(DISTINCT (commodity)) as lamt from abp_intervention where state ='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    //double amount = reader.GetDouble(0);
                    string naira =  String.Format("{0:#,##0}", reader["lamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["lamt"]));
                //amtdis.InnerHtml = naira;
                commodityspan.InnerHtml = naira;
                }
                sc.Close();
            }
          public void getfarmers()
        {
           
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select count(DISTINCT (farmer_bvn)) as lamt from abp_intervention where state ='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    //double amount = reader.GetDouble(0);
                    string naira =  String.Format("{0:#,##0}", reader["lamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["lamt"]));
                //amtdis.InnerHtml = naira;
                farmersno.InnerHtml = naira;
                }
                sc.Close();
            }
          
        
        public void loanperinervention()
        {
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select sum(case when loan_amount is null then 0 else loan_amount end) as lamt from abp_intervention where state='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    //double amount = reader.GetDouble(0);
                    string naira = " ₦" + String.Format("{0:#,##0.00}", reader["lamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["lamt"]));
                    //amtdis.InnerHtml = naira;
                    totloanint.InnerHtml = naira;
                }
                sc.Close();
            }
            else
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select sum(case when loan_amount is null then 0 else loan_amount end) as lamt from all_loans where intervention='" + drop + "' and bus_stat='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    //double amount = reader.GetDouble(0);
                    string naira = " ₦" + String.Format("{0:#,##0.00}", reader["lamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["lamt"]));
                    //amtdis.InnerHtml = naira;
                    totloanint.InnerHtml = naira;
                }
            }
            sc.Close();
        }
        public void totoutstanding()
        {
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select sum(case when loan_outstanding is null then 0 else loan_outstanding end) as totoutstanding from abp_intervention where state='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    //double amount = reader.GetDouble(0);
                    string naira = " ₦" + String.Format("{0:#,##0.00}", reader["totoutstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["totoutstanding"]));
                    //amtdis.InnerHtml = naira;
                    Span1int.InnerHtml = naira;
                }
                sc.Close();
            }
            else
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select sum(case when principal_due is null then 0 else principal_due end) as totoutstanding from all_loans where intervention='" + drop + "' and bus_stat='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                    //double amount = reader.GetDouble(0);
                    string naira = " ₦" + String.Format("{0:#,##0.00}", reader["totoutstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["totoutstanding"]));
                    Span1int.InnerHtml = naira;
                }
            }
            sc.Close();
        }

        public void getbeneficiaries()
        {
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select count(loan_guid) as num from abp_intervention where state='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    //double amount = reader.GetDouble(0);
                    string naira = String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"]));
                    //amtdis.InnerHtml = naira;
                    totbenefint.InnerHtml = naira;
                }
                sc.Close();
            }
            else
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select count(*) as num from all_loans where intervention='" + drop + "'  and bus_stat='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                    //int amount = reader.GetInt32(0);
                    string naira = String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader["num"]));
                    totbenefint.InnerHtml = naira;
                }
                sc.Close();
            }
        }
        public void getbanks()
        {
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select  count(distinct(pfi_name)) as num from abp_intervention where state='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    //double amount = reader.GetDouble(0);
                    string naira = String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"]));
                    //amtdis.InnerHtml = naira;
                    banksint.InnerHtml = naira;
                }
                sc.Close();
            }
            else
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select count(distinct(bank_name)) as num from all_loans where intervention='" + drop + "' and bus_stat='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {
                    int amount = reader.GetInt32(0);
                    string naira = String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader["num"]));
                    banksint.InnerHtml = naira;
                }
                sc.Close();
            }
        }

        public string getWhileLoopData2()
        {
            
                string htmlStr = "";
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when pfi_name is null then 'NOT SPECIFIED' else pfi_name end as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount,0.00 as interest_due,sum(case when repayment_to_date is null then 0 else repayment_to_date end) as interest_paid, sum(case when loan_outstanding != 0 then 1 else 0 end) as num,sum(case when loan_outstanding is null then 0 else loan_outstanding end) as outstandingamt from abp_intervention  where state='"+statenamesql+ "' group by pfi_name order by outstandingamt desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                    double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                    double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);
                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0.00}", reader["num"] == DBNull.Value ? 0 : Convert.ToDouble(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";

                }
                sc.Close();
                return htmlStr;
            }
            else
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = " select case when bank_name is null then 'NOT SPECIFIED' else bank_name end as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount, sum(case when interest_due is null then 0 else interest_due end) interest_due, sum(case when interest_paid is null then 0 else interest_paid end) interest_paid, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans where intervention='" + drop + "' and bus_stat='" + statenamesql + "'  group by bank_name ORDER BY outstandingamt desc, case when bank_name is null then 'NOT SPECIFIED' else bank_name end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                    double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                    double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);
                    //int sw = reader.GetInt32(3);
                    //int ss = reader.GetInt32(4);
                    // int nw = reader.GetInt32(5);
                    // int se = reader.GetInt32(6);
                    // int nsp = reader.GetInt32(7);


                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";
                }
                sc.Close();
                return htmlStr;
            }
          
        }
        public string getWhileLoopData2all()
        {
            
                string htmlStr = "";
          
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = " select case when bank_name is null then 'NOT SPECIFIED' else bank_name end as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount, sum(case when interest_due is null then 0 else interest_due end) interest_due, sum(case when interest_paid is null then 0 else interest_paid end) interest_paid, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans where bus_stat='" + statenamesql + "'  group by bank_name ORDER BY outstandingamt desc, case when bank_name is null then 'NOT SPECIFIED' else bank_name end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);


                htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";
                }
                sc.Close();
                return htmlStr;
            
          
        }
        public string getWhileLoopDatapfitype()
        {
            string htmlStr = "";
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when pfi_type is null then 'NOT SPECIFIED' else pfi_type end as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount,0.00 as interest_due,sum(case when repayment_to_date is null then 0 else repayment_to_date end) as interest_paid, sum(case when loan_outstanding != 0 then 1 else 0 end) as num,sum(case when loan_outstanding is null then 0 else loan_outstanding end) as outstandingamt from abp_intervention  where state='" + statenamesql + "' group by pfi_type";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                    double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                    double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);
                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";

                }
                sc.Close();
                return htmlStr;
            }
            else
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when bank is null then 'NOT SPECIFIED' else bank end as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount, sum(case when interest_due is null then 0 else interest_due end) interest_due, sum(case when interest_paid is null then 0 else interest_paid end) interest_paid, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans where intervention='" + drop + "' and bus_stat='" + statenamesql + "'  group by bank ORDER BY num desc, case when bank is null then 'NOT SPECIFIED' else bank end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                    double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                    double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);  
                    //int sw = reader.GetInt32(3);
                    //int ss = reader.GetInt32(4);
                    // int nw = reader.GetInt32(5);
                    // int se = reader.GetInt32(6);
                    // int nsp = reader.GetInt32(7);


                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";
                }
            }
            sc.Close();
            return htmlStr;
        }
        public string getWhileLoopDatapfitypeall()
        {
            string htmlStr = "";
            
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when bank is null or bank='' then 'NOT SPECIFIED' else bank end as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount, sum(case when interest_due is null then 0 else interest_due end) interest_due, sum(case when interest_paid is null then 0 else interest_paid end) interest_paid, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans where bus_stat='" + statenamesql + "'  group by bank ORDER BY num desc, case when bank is null then 'NOT SPECIFIED' else bank end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                    double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                    double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);  
                    //int sw = reader.GetInt32(3);
                    //int ss = reader.GetInt32(4);
                    // int nw = reader.GetInt32(5);
                    // int se = reader.GetInt32(6);
                    // int nsp = reader.GetInt32(7);


                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";
                }
            
            sc.Close();
            return htmlStr;
        }
        public string getWhileLoopDatabysector()
        {
            string htmlStr = "";
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select 'Agriculture' as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount,0.00 as interest_due,sum(case when repayment_to_date is null then 0 else repayment_to_date end) as interest_paid, sum(case when loan_outstanding != 0 then 1 else 0 end) as num,sum(case when loan_outstanding is null then 0 else loan_outstanding end) as outstandingamt from abp_intervention  where state='" + statenamesql + "'";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();
                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                    double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                    double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);
                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";

                }
                sc.Close();
                return htmlStr;
            }
            else
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when sector is null then 'NOT SPECIFIED' else sector end as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount, sum(case when interest_due is null then 0 else interest_due end) interest_due, sum(case when interest_paid is null then 0 else interest_paid end) interest_paid, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans where intervention='" + drop + "' and bus_stat='" + statenamesql + "'  group by sector ORDER BY num desc, case when sector is null then 'NOT SPECIFIED' else sector end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                     double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                    double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);  
                  

                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";
                }
            }
            sc.Close();
            return htmlStr;
        }
        public string getWhileLoopDatabysectorall()
        {
            string htmlStr = "";
           
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when sector is null then 'NOT SPECIFIED' else sector end as tester, count(loan_id) as noofloans,sum(case when loan_amount is null then 0 else loan_amount end) loanamount, sum(case when interest_due is null then 0 else interest_due end) interest_due, sum(case when interest_paid is null then 0 else interest_paid end) interest_paid, sum(case when loan_amount-amt_repaid=0 then 0 else 1 end) as num,(case when sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) is null then 0 else sum(case when loan_amount-amt_repaid=0 then 0 else loan_amount end) - sum(case when loan_amount-amt_repaid=0 then 0 else amt_repaid end) end) as outstandingamt from cbndb.dbo.all_loans where bus_stat='" + statenamesql + "'  group by sector ORDER BY num desc, case when sector is null then 'NOT SPECIFIED' else sector end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string pfi_name = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["interest_due"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_due"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["interest_paid"] == DBNull.Value ? 0 : Convert.ToDouble(reader["interest_paid"]));
                     double numoofout = reader["num"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["num"]);
                    double amountout = reader["outstandingamt"] == DBNull.Value ? 0.00 : Convert.ToDouble(reader["outstandingamt"]);  
                  

                    htmlStr += "<tr><td>" + pfi_name + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestduestr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["num"] == DBNull.Value ? 0 : Convert.ToInt32(reader["num"])) + "</td><td>" + String.Format("{0:#,##0.00}", reader["outstandingamt"] == DBNull.Value ? 0 : Convert.ToDouble(reader["outstandingamt"])) + "</td></tr>";
                
            }
            sc.Close();
            return htmlStr;
        }
        public string getWhileLoopDatabysseason()
        {
            string htmlStr = "";
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when farming_season is null then 'NOT SPECIFIED' else farming_season end as tester, count(loan_id) as noofloans,sum(loan_amount) loanamount, sum(case when loan_outstanding is null then 0 else loan_outstanding end) loan_outstanding , sum(case when repayment_to_date is null then 0 else repayment_to_date end) repayment_td, sum(case when loan_outstanding !=0 then 1 else 0 end) numofout from cbndb.dbo.abp_intervention where state='"+statenamesql+ "'  group by farming_season ORDER BY case when farming_season is null then 'NOT SPECIFIED' else farming_season end desc,loanamount desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string farmin_season = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["loan_outstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loan_outstanding"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["repayment_td"] == DBNull.Value ? 0 : Convert.ToDouble(reader["repayment_td"]));
                    double numoofout = reader["numofout"] == DBNull.Value ? 0.00 : Convert.ToInt32(reader["numofout"]); 
                

                    htmlStr += "<tr><td>" + farmin_season + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["numofout"] == DBNull.Value ? 0 : Convert.ToInt32(reader["numofout"])) + "</td><td>" + interestduestr + "</td></tr>";
                }
                sc.Close();
                return htmlStr;
            }
            else { }
            sc.Close();
            return htmlStr;
        }
        public string getWhileLoopDatabysseasonall()
        {
            string htmlStr = "";
           
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when farming_season is null then 'NOT SPECIFIED' else farming_season end as tester, count(loan_id) as noofloans,sum(loan_amount) loanamount, sum(case when loan_outstanding is null then 0 else loan_outstanding end) loan_outstanding , sum(case when repayment_to_date is null then 0 else repayment_to_date end) repayment_td, sum(case when loan_outstanding !=0 then 1 else 0 end) numofout from cbndb.dbo.abp_intervention where state='"+statenamesql+ "'  group by farming_season ORDER BY case when farming_season is null then 'NOT SPECIFIED' else farming_season end desc,loanamount desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string farmin_season = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["loan_outstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loan_outstanding"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["repayment_td"] == DBNull.Value ? 0 : Convert.ToDouble(reader["repayment_td"]));
                    double numoofout = reader["numofout"] == DBNull.Value ? 0.00 : Convert.ToInt32(reader["numofout"]); 
                

                    htmlStr += "<tr><td>" + farmin_season + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["numofout"] == DBNull.Value ? 0 : Convert.ToInt32(reader["numofout"])) + "</td><td>" + interestduestr + "</td></tr>";
                }
                sc.Close();
                return htmlStr;
      
          
        }
        public string getWhileLoopDatabycommodity()
        {
            string htmlStr = "";
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when commodity is null then 'NOT SPECIFIED' else commodity end as tester, count(loan_id) as noofloans,sum(loan_amount) loanamount, sum(case when loan_outstanding is null then 0 else loan_outstanding end) loan_outstanding , sum(case when repayment_to_date is null then 0 else repayment_to_date end) repayment_td, sum(case when loan_outstanding !=0 then 1 else 0 end) numofout from cbndb.dbo.abp_intervention where state='" + statenamesql + "'  group by commodity ORDER BY loanamount desc, case when commodity is null then 'NOT SPECIFIED' else commodity end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string farmin_season = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["loan_outstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loan_outstanding"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["repayment_td"] == DBNull.Value ? 0 : Convert.ToDouble(reader["repayment_td"]));
                    double numoofout = reader["numofout"] == DBNull.Value ? 0.00 : Convert.ToInt32(reader["numofout"]);


                    htmlStr += "<tr><td>" + farmin_season + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["numofout"] == DBNull.Value ? 0 : Convert.ToInt32(reader["numofout"])) + "</td><td>" + interestduestr + "</td></tr>";
                }
                sc.Close();
                return htmlStr;
            }
            else { }
            sc.Close();
            return htmlStr;
        }
        public string getWhileLoopDatabycommodityall()
        {
            string htmlStr = "";
           
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when commodity is null then 'NOT SPECIFIED' else commodity end as tester, count(loan_id) as noofloans,sum(loan_amount) loanamount, sum(case when loan_outstanding is null then 0 else loan_outstanding end) loan_outstanding , sum(case when repayment_to_date is null then 0 else repayment_to_date end) repayment_td, sum(case when loan_outstanding !=0 then 1 else 0 end) numofout from cbndb.dbo.abp_intervention where state='" + statenamesql + "'  group by commodity ORDER BY loanamount desc, case when commodity is null then 'NOT SPECIFIED' else commodity end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string farmin_season = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["loan_outstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loan_outstanding"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["repayment_td"] == DBNull.Value ? 0 : Convert.ToDouble(reader["repayment_td"]));
                    double numoofout = reader["numofout"] == DBNull.Value ? 0.00 : Convert.ToInt32(reader["numofout"]);


                    htmlStr += "<tr><td>" + farmin_season + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["numofout"] == DBNull.Value ? 0 : Convert.ToInt32(reader["numofout"])) + "</td><td>" + interestduestr + "</td></tr>";
                }
                sc.Close();
                return htmlStr;
  
        }
        public string getWhileLoopDatabyAnchor()
        {
            string htmlStr = "";
            if (drop == "ABP")
            {
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when name_of_anchor is null then 'NOT SPECIFIED' else name_of_anchor end as tester, count(loan_id) as noofloans,sum(loan_amount) loanamount, sum(case when loan_outstanding is null then 0 else loan_outstanding end) loan_outstanding , sum(case when repayment_to_date is null then 0 else repayment_to_date end) repayment_td, sum(case when loan_outstanding !=0 then 1 else 0 end) numofout from cbndb.dbo.abp_intervention where state='" + statenamesql + "'  group by name_of_anchor ORDER BY loanamount desc, case when name_of_anchor is null then 'NOT SPECIFIED' else name_of_anchor end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string farmin_season = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["loan_outstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loan_outstanding"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["repayment_td"] == DBNull.Value ? 0 : Convert.ToDouble(reader["repayment_td"]));
                    double numoofout = reader["numofout"] == DBNull.Value ? 0.00 : Convert.ToInt32(reader["numofout"]);


                    htmlStr += "<tr><td>" + farmin_season + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["numofout"] == DBNull.Value ? 0 : Convert.ToInt32(reader["numofout"])) + "</td><td>" + interestduestr + "</td></tr>";
                }
                sc.Close();
                return htmlStr;
            }
            else { }
            sc.Close();
            return htmlStr;
        }
        public string getWhileLoopDatabyAnchorall()
        {
            string htmlStr = "";
           
                SqlCommand thisCommand = sc.CreateCommand();
                thisCommand.CommandText = "select case when name_of_anchor is null then 'NOT SPECIFIED' else name_of_anchor end as tester, count(loan_id) as noofloans,sum(loan_amount) loanamount, sum(case when loan_outstanding is null then 0 else loan_outstanding end) loan_outstanding , sum(case when repayment_to_date is null then 0 else repayment_to_date end) repayment_td, sum(case when loan_outstanding !=0 then 1 else 0 end) numofout from cbndb.dbo.abp_intervention where state='" + statenamesql + "'  group by name_of_anchor ORDER BY loanamount desc, case when name_of_anchor is null then 'NOT SPECIFIED' else name_of_anchor end desc";
                sc.Open();
                SqlDataReader reader = thisCommand.ExecuteReader();


                while (reader.Read())
                {

                    string farmin_season = reader.GetString(0);
                    int numofloans = Convert.ToInt32(reader["noofloans"]);
                    string naira = String.Format("{0:#,##0}", reader["noofloans"] == DBNull.Value ? 0 : Convert.ToInt32(reader["noofloans"]));
                    string loanamountstr = String.Format("{0:#,##0.00}", reader["loanamount"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loanamount"]));
                    string interestduestr = String.Format("{0:#,##0.00}", reader["loan_outstanding"] == DBNull.Value ? 0 : Convert.ToDouble(reader["loan_outstanding"]));
                    string interestpaidstr = String.Format("{0:#,##0.00}", reader["repayment_td"] == DBNull.Value ? 0 : Convert.ToDouble(reader["repayment_td"]));
                    double numoofout = reader["numofout"] == DBNull.Value ? 0.00 : Convert.ToInt32(reader["numofout"]);


                    htmlStr += "<tr><td>" + farmin_season + "</td><td>" + naira + "</td><td>" + loanamountstr + "</td><td>" + interestpaidstr + "</td><td>" + String.Format("{0:#,##0}", reader["numofout"] == DBNull.Value ? 0 : Convert.ToInt32(reader["numofout"])) + "</td><td>" + interestduestr + "</td></tr>";
                }
                sc.Close();
                return htmlStr;
       
          
        }
        [WebMethod]
        public static List<object> GetPieloanstat()
        {
            string query = "select case when loan_status is null then 'No Status' else loan_status end as loanstatus, count(case when loan_status is null then 0 else 1 end) as numberofloans from cbndb.dbo.all_loans where bus_stat='" + statenamesql + "' group by loan_status";
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
        public static List<object> disvsout()
        {
            string query = "select (case when DATEPART(YYYY, start_date) is null then DATEPART(YYYY, 1900) else DATEPART(YYYY, start_date) end) as year, sum(case when loan_amount is null then 0 else loan_amount end) as loanamt, sum(case when principal_due is null then 0 else principal_due end) as prindue from [cbndb].[dbo].[all_loans] where DATEPART(YYYY, start_date) is not null and bus_stat='" + statenamesql + "' group by DATEPART(YYYY, start_date) order by year asc";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Year", "Dis.","Due"
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
        public static List<object> seasondisvsout()
        {
            string query = "select top 5 farming_season as year, sum(loan_amount) as loanamt, sum(case when loan_outstanding is null then 0 else loan_outstanding end) as prindue from abp_intervention where state='" + statenamesql + "' group by farming_season order by year asc";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Season", "Disbursed","Outstanding"
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
        public static List<object> getmodel()
        {
            string query = "select customer_type, sum(loan_amount) as sume from cbndb.dbo.all_loans where bus_stat='"+statenamesql+"' group by customer_type";
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
        public static List<object> getseason()
        {
            string query = "select distinct TOP 10 (CASE WHEN farming_season is null then 'Not Specified' else farming_season end) as seasons, count(*) as cct from abp_intervention where statE='"+statenamesql+"' group by  farming_season order by seasons asc";

            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Season", "No. of Farmers"
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
                          sdr["seasons"], sdr["cct"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }
        [WebMethod]
        public static List<object> factype()
        {
            string query = "select case when facility_type is null then 'Unspecified' when facility_type='term loan' then 'Term Loan' when facility_type='WORKING CAPITAL' then 'Working Capital' else facility_type end as facilitytype, count(*) numberofloans from cbndb.dbo.all_loans where bus_stat ='" + statenamesql + "' group by facility_type";

            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Facility Type", "No. of Loans"
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
                          sdr["facilitytype"], sdr["numberofloans"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }
        [WebMethod]
        public static List<object> Getanchor()
        {
            string query = "select distinct top 10 name_of_anchor, sum(case when loan_amount is null then 0 else loan_amount end) as sumloan from abp_intervention  where name_of_anchor is not null and state='"+statenamesql+"' group by name_of_anchor order by sum(case when loan_amount is null then 0 else loan_amount end) desc";

            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Anchor", "Loan Disbursed(N)"
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
                          sdr["name_of_anchor"], sdr["sumloan"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }
        [WebMethod]
        public static List<object> Getanchor2()
        {
            string query = "select distinct top 10 name_of_anchor, sum(case when loan_outstanding is null then 0 else loan_outstanding end) as outst from abp_intervention  where name_of_anchor is not null and state='"+statenamesql+"' group by name_of_anchor order by sum(case when loan_outstanding is null then 0 else loan_outstanding end) desc";

            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Anchor", "Outstanding(N)"
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
                          sdr["name_of_anchor"], sdr["outst"]
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
            string query = "select (case when commodity = '' or commodity is null then 'NOT SPECIFIED' else commodity end) as commodity,sum(case when loan_amount is null then 0 else loan_amount end) as sumloan from abp_intervention where commodity != '' and state='"+statenamesql+"' group by commodity";
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
        "Commodity", "Disbursement Amount"
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
                        sdr["commodity"], sdr["sumloan"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }

        public void getimage()
        {
           // string query = "SELECT Passport_Data FROM Applicant WHERE Applicant_ID = @ID";
            using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM pictures where picture_state='"+statenamesql+"'", con))
                {
                   
                    DataTable dt = new DataTable();
                            sda.Fill(dt);
                            Repeater1.DataSource = dt;
                            Repeater1.DataBind();
                           
                        }
                    }
                }
        public void getalbum()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM pictures where picture_state='" + statenamesql + "'", con))
                {

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater2.DataSource = dt;
                    Repeater2.DataBind();

                }
            }
        }

        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList9.SelectedItem.Value == "ABP")
            {
                getWhileLoopDatabysseason();
            }
        }
    }
}