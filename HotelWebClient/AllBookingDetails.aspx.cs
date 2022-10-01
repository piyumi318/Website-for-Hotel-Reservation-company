using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class AllBookingDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string adminID = (string)Session["Admin"];
            if (adminID == null)
            {
                Response.Write("<script>alert('Make sure to Login show your bookings')</script>");
                Server.Transfer("AdminLogin.aspx");
            }
            else
            {
                BookingDetails.DataSource = obj.AllBooking();
                BookingDetails.DataBind();
                if (obj.AllBooking().Tables[0].Rows.Count == 0)
                {

                }
            }
        }
        protected void My_ItemCommand(object sender, DataListCommandEventArgs e)
        {

            try
            {

                if (e.CommandName == "Check")
                {
                    string adminID = (string)Session["Admin"];
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                    HiddenField roomId = (HiddenField)BookingDetails.Items[e.Item.ItemIndex].FindControl("RoomId");
                    HiddenField hotelid = (HiddenField)BookingDetails.Items[e.Item.ItemIndex].FindControl("HotelId");
                    HiddenField Customerid = (HiddenField)BookingDetails.Items[e.Item.ItemIndex].FindControl("CusID");
                     Session["BookedHotelId"] = hotelid.Value;
                    Session["BookedRoomId"] = roomId.Value;
                      Session["Admin"] = adminID;
                    Session["BookedCustomerId"] = Customerid.Value;
                    Response.Redirect("BookedHotelAndRoom.aspx");

                }
                if (e.CommandName == "Cancel")
                {
                    string id = ((Label)BookingDetails.Items[e.Item.ItemIndex].FindControl("bookingId")).Text;
                  
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                    string record = obj.CancelBooking(id);
                    int record1 = Int32.Parse(record);
                    if (record1 > 0) {
                        Response.Write("<script> alert('The Booking Is canceled')</script>"); Server.Transfer("AllBookingDetails.aspx");

                    }
                    else { Response.Write("<script>alert('error')</script>"); }
                }
            }
            catch (Exception ex)
            {
                Exception E = ex;
            
        }
    }
}
    
}