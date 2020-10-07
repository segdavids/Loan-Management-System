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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null || Session["Email"] == null)
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
            getWhileLoopData();


        }

        public string getWhileLoopData()
        {
            string htmlStr = "";
            SqlCommand thisCommand = sc.CreateCommand();
            thisCommand.CommandText = " select (case when bus_sector = 'NULL' then 'UNcategorized' else bus_sector end) as Business, sum(case when geo_zone = 'NORTH-EAST' then 1 else 0 end) as NE, sum(case when geo_zone = 'NORTH-CENTRAL' then 1 else 0 end) as NC,sum(case when geo_zone = 'SOUTH-WEST' then 1 else 0 end) as SW,sum(case when geo_zone = 'SOUTH-SOUTH' then 1 else 0 end) as SS,sum(case when geo_zone = 'NORTH-WEST' then 1 else 0 end) as NW,sum(case when geo_zone = 'SOUTH-EAST' then 1 else 0 end) as SE,sum(case when geo_zone = '' then 1 else 0 end) as NotSpecified FROM [cbndb].dbo.agsmeis_application1 where bus_sector is not NULL group by bus_sector  order by sum(case when geo_zone = 'NORTH-EAST' then 1 else 0 end) desc";
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