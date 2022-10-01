using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string AdminId = (string)Session["Admin"];
            if (AdminId ==null)
            {

                Response.Redirect("AdminLogin.aspx");

            }

            else { Label1.Text = AdminId; }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["Admin"] = null;
            Response.Redirect("ShowHotelDetails.aspx");
        }
    }
}