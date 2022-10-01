using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace HotelWebClient
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {
            
                HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                string record = obj.customerLoginData(customerUname.Text, obj.Encrypt(customerPword.Text));
                if (record != "")
                {   Response.Write("<script>alert('you login sucessfully')</script>");
                    Session["CustomerID"] = record;
                Server.Transfer("ShowHotelDetails.aspx");

                }
                else
            {     Response.Write("<script>alert('Incorrect username or password')</script>"); }                             
        }
        
    }
}