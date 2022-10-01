using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class BookedHotelAndRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customerid = (string)Session["BookedCustomerId"];
            string hotelId = (string)Session["BookedHotelId"];
            string RoomId = (string)Session["BookedRoomId"];
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            
                DataList2.DataSource = obj.MyHotelsDetails(hotelId);
                DataList2.DataBind();
                DataList1.DataSource = obj.Room(RoomId);
                DataList1.DataBind();
                DataList3.DataSource = obj.customerDetailsbyID(customerid);
                DataList3.DataBind();
            
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            string customerID = (string)Session["CustomerID"];
            string AdminID = (string)Session["Admin"];
            string HotelId = (string)Session["HotelNumber"];
            if (customerID !=null) { 
                
                Response.Redirect("MyBooking.aspx");
                }
            
            else if (HotelId !=null) { Response.Redirect("MyHotelBooking.aspx"); }
            else if (AdminID != null) { Response.Redirect("AllBookingDetails.aspx"); }
            else { Response.Write("<script>alert('Error')</script>"); }
        }
    }
}