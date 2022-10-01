using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HotelWebClient
{
    public partial class DebiNavigationBar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string customerID = (string)Session["CustomerID"];
            string res = (string)Session["Response"];
            Label1.Text=customerID;
            Logout.Visible = false;
            Response.Text = res;
            if (customerID == null)
            {
                Logout.Visible = false;
                DataList2.Visible = false;
                Label1.Visible = false;
            }
            else
            { 
                DataList2.DataSource = obj.CustomertoID(customerID);
                DataList2.DataBind();
                Logout.Visible = true;
            }      
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            
            Session["CustomerID"] = null;           
            HttpContext.Current.Response.Redirect("ShowHotelDetails.aspx");
          
        }
    }
}