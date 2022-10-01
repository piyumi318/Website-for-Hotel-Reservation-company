using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class HotelLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string record = obj.HotelLoginData(hotelUname.Text,obj.Encrypt( hotelPword.Text));
            if (record != "")
            {
                Session["HotelNumber"] = record;
                Response.Write("<script>alert('you login sucessfully')</script>");
                Server.Transfer("ShowMyHotel.aspx");
            }          
            else { Response.Write("<script>alert('incorrect username or password')</script>"); }
        
        } 
    }
}