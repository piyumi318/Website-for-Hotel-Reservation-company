using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class MyBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string customerID = (string)Session["CustomerID"];
            if (customerID == null)
            {
                Response.Write("<script>alert('Make sure to Login show your bookings')</script>");
                Server.Transfer("DebiNavigationBar.aspx");
            }
            else  { Mybooking1.DataSource = obj.MyBooking(customerID);
                     Mybooking1.DataBind();
                if (obj.MyBooking(customerID).Tables[0].Rows.Count == 0)
                {
                    Response.Write("<script> alert('There is no booking')</script>");
                }
            }

        }
        protected void My_ItemCommand(object sender, DataListCommandEventArgs e)
        {

            try
            {

                if (e.CommandName == "Check")
                {
                    string customerID = (string)Session["CustomerID"];
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                    HiddenField roomId = (HiddenField)Mybooking1.Items[e.Item.ItemIndex].FindControl("RoomId");
                    HiddenField hotelid = (HiddenField)Mybooking1.Items[e.Item.ItemIndex].FindControl("HotelId");
                    HiddenField Customerid = (HiddenField)Mybooking1.Items[e.Item.ItemIndex].FindControl("CusID");
                    Session["BookedCustomerId"] = Customerid.Value;
                    Session["BookedHotelId"]=hotelid.Value;
                   Session["BookedRoomId"]=roomId.Value;
                    Session["CustomerID"] = customerID;
                    Response.Redirect("BookedHotelAndRoom.aspx");
                    
                }
                if (e.CommandName == "Cancel")
                {
                    string id = ((Label)Mybooking1.Items[e.Item.ItemIndex].FindControl("bookingId")).Text;
                    
                   
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
               string record= obj.CancelBooking(id);
                    int record1 = Int32.Parse(record);
                   
                    if (record1 > 0) { Response.Write("<script> alert('Your Booking Is canceled')</script>"); Server.Transfer("MyBooking.aspx"); }
                    else { Response.Write("<script>alert('error')</script>"); }
                }
            }
            catch (Exception ex)
            {
                Exception E = ex;
            }
        } } }