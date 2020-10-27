using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CBNLMS.Inputing._7
{
    public partial class manage__ictures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("<script>alert('You do not have permission to view this page!');</script>");
            Response.Redirect("~/Inputing/7/");
        }
    }
}