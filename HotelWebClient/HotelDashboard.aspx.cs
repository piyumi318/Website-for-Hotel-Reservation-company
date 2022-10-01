using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class HotelDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string HotelId = (string)Session["HotelNumber"];        
            if (HotelId ==null) { Response.Redirect("HotelLogin.aspx"); }
            else {
                DataList2.DataSource = obj.MyHotelsDetails(HotelId);
                DataList2.DataBind();
                HotelID.Text = HotelId; }
        
    }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["HotelNumber"] =null;
            Response.Redirect("HotelLogin.aspx");
        }
    }
}