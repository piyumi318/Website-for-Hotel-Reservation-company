using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class ShowMyHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string HotelId = (string)Session["HotelNumber"];
            if (HotelId == null) { Response.Redirect("HotelLogin.aspx"); }
            else
            {
                HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                DataList2.DataSource = obj.MyHotelsDetails(HotelId);
                DataList2.DataBind();
                DataList1.DataSource = obj.RoomDetailsbyHotelID(HotelId);
                DataList1.DataBind();
            }
        }
        protected void DataList1_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Update")
                {
                 HiddenField roomid1 = (HiddenField)DataList1.Items[e.Item.ItemIndex].FindControl("RoomId");
                  Session["HotelRoomID"] = roomid1.Value;
                     Response.Redirect("ManageRoomDetails.aspx");
                }

                if (e.CommandName == "Delete")
                {
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                    HiddenField roomid1 = (HiddenField)DataList1.Items[e.Item.ItemIndex].FindControl("RoomId");
                  string record= obj.DeleteRoom(roomid1.Value);
                    int record1 = Int32.Parse(record);
                    if (record1 > 0) { Response.Write("<script>alert('The room is removed')</script>"); Server.Transfer("ShowMyHotel.aspx"); }
                    else if(record=="0") { Response.Write("<script>alert('there is already Booking appoinments cant delete')</script>"); }
                }
            
            }
            catch (Exception ex)
            {
                Exception E = ex;
            }
        }
    }
}