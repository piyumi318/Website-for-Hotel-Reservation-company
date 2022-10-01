using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class CustomerRegaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnreg_Click(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string record2 = obj.CustomerUsername(TxtUsername.Text);
            string gender = null;
            if (rbmale.Checked)
            {
                gender = "male";
            }
            else if (rbfmale.Checked) { gender = "Female"; }
            else { gender = ""; }
            if (record2 != "")
            { Response.Write("<script>alert('Username is Taken already')</script>"); }

            else
            {
                if (TxtPass.Text == TxtCpass.Text)
                {

                    string customerid = obj.AutoCustomerID();
                    string record = obj.AddCustomerData(customerid, txtFName.Text, TxtLName.Text, txtAddress.Text,
                        gender, txtBday.Text, txtMobile.Text, txtEmail.Text, TxtUsername.Text, obj.Encrypt(TxtPass.Text));
                    int record1 = Int32.Parse(record);
                    if (record1 > 0)
                    {
                        Response.Write("<script>alert('Data registered sucessfully')</script>");
                        Server.Transfer("CustomerLogin.aspx");
                    }
                    else { Response.Write("<script>alert('error')</script>"); }
                }
                else { Response.Write("<script>alert('Passwords are not same')</script>"); }
            }
        }

    } 
}