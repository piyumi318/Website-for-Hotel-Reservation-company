using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
namespace HotelWebClient
{
    public partial class HotelReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string AdminId = (string)Session["Admin"];
            if (AdminId == null)
            {

                Response.Redirect("AdminLogin.aspx");

            }

        }

        protected void btnHotelSumbmit_Click(object sender, EventArgs e)
        {
            string path = Path.GetFileName(ImageFile1.FileName);
            path = path.Replace(" ", " ");        
            ImageFile1.SaveAs(Server.MapPath("/Image/") + path);
            string path1 = "/Image/" + path;
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string record2 = obj.HotelUsername(TxtUsername.Text);

            if (record2 != "") { Response.Write("<script>alert('Username is taken')</script>"); }
            else
            {
                if (TxtPassword.Text == TxtCpassword.Text)
                {
                    string HotelId = obj.AutoID();
                    string record = obj.insert(HotelId, TxtHotelName.Text, TxtDescription.Text,
                        TxtNo.Text, TxtCity.Text, TxtCountry.Text, TxtMobileNo.Text, TxtEmail.Text, 
                        TxtUsername.Text,obj.Encrypt (TxtPassword.Text), path1);
                    int record1 = Int32.Parse(record);
                    if (record1 > 0) { Response.Write("<script>alert('Hotel registered succssfully')</script>"); }
                    else { Response.Write("<script>alert('error')</script>"); }

                }
                else { Response.Write("<script>alert('password are not same')</script>"); }
            }
        }
    }
}