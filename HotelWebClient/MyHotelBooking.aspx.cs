using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class MyHotelBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string HotelId = (string)Session["HotelNumber"];
            if (HotelId == null)
            { Response.Redirect("HotelLogin.aspx");}
            else
            {
                 Mybooking1.DataSource = obj.MyhotelBooking(HotelId);
                Mybooking1.DataBind();
            }
        }
        protected void My_ItemCommand(object sender, DataListCommandEventArgs e)
        {

            try
            {

                if (e.CommandName == "Check")
                {
                    string HotelId = (string)Session["HotelNumber"];
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                    HiddenField roomId1 = (HiddenField)Mybooking1.Items[e.Item.ItemIndex].FindControl("RoomId");
                    HiddenField hotelid1 = (HiddenField)Mybooking1.Items[e.Item.ItemIndex].FindControl("HotelId");
                    HiddenField Customerid = (HiddenField)Mybooking1.Items[e.Item.ItemIndex].FindControl("CusID");
                    Session["BookedCustomerId"] = Customerid.Value;
                    Session["BookedHotelId"] = hotelid1.Value;
                    Session["BookedRoomId"] = roomId1.Value;
                    Session["HotelNumber"] = HotelId;
                    Response.Redirect("BookedHotelAndRoom.aspx");

                }
              
            }
            catch (Exception ex)
            {
                Exception E = ex;
            }
        }
    }
}
