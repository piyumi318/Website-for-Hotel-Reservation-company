using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {                   
                HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                string record = obj.AdminLoginData(Uname.Text, obj.Encrypt( Pword.Text));
                if (record != "") {
                    Session["Admin"]=record;
                    Response.Write("<script>alert('you login sucessfully')</script>");
                Server.Transfer("ManageAllHotels.aspx");
                } 
            else { Response.Write("<script>alert('incorrect username or password')</script>"); }           
        }
      
    }
}