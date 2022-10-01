using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class AdminReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string AdminId = (string)Session["Admin"];
            if (AdminId == null)
            {

                Response.Redirect("AdminLogin.aspx");

            
        }
        }
        protected void btnreg_Click(object sender, EventArgs e)

        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string record1=obj.AdminUsername(TxtUsername.Text);

            if (record1!="") { Response.Write("<script>alert('there is already user with this username')</script>"); }
            else
            {
                if (TxtPass.Text == TxtCpass.Text) { 
                     string record = obj.AddAdmin(obj.AutoAdminID(), TxtUsername.Text, obj.Encrypt( TxtPass.Text));
                    if (record != null) { Response.Write("<script>alert('Admin is registered sucessfully')</script>"); }
                    else { Response.Write("<script>alert('error')</script>"); }
                }
                else { Response.Write("<script>alert('password are not same')</script>"); }
            }
        }
        
    }
}