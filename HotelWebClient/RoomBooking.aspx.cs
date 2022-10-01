using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class RoomBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string customerID = (string)Session["CustomerID"];
            if (customerID ==null) { Response.Write("<script>alert('Make sure to Login Before make booking')</script>");
                Response.Redirect("CustomerLogin.aspx");
            }
            else
            {              
                checkin.Text = (string)Session["checkin"];
                checkout.Text = (string)Session["checkout"];
                Roomtype.Text = (string)Session["roomtype"];
                quantity.Text = (string)Session["qunatity"];
                price.Text = (string)Session["price"];
                int price1 = Convert.ToInt32(Session["price"]);
                int qunatity1 = Convert.ToInt32(Session["qunatity"]);
               
                DateTime day1 = Convert.ToDateTime(Session["checkout"]);
                DateTime day2= Convert.ToDateTime(Session["checkin"]);
               string day= (day1 - day2).TotalDays.ToString();
                int total1 = price1 * qunatity1 * Convert.ToInt32(day);
                total.Text = total1.ToString();
                Roomsize.Text = (string)Session["roomsize"];
                string hotelid = (string)Session["HotelID"];
                string roomid = (string)Session["RoomID"];

            }
        }

        protected void Btncomfirm_Click(object sender, EventArgs e)
        {
            string hotelid = (string)Session["HotelID"];
            string roomid = (string)Session["RoomID"];
            string customerID = (string)Session["CustomerID"];
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();

            string record=    obj.BookingDetails(obj.AutoBookingID(),Txtfname.Text,Txtlname.Text,Txtadress.Text,
                Txtcountry.Text,TxtEmail.Text,TxtMobile.Text,checkin.Text,checkout.Text, customerID, hotelid,
                roomid, quantity.Text, Convert.ToInt32( total.Text));
            int record1 = Int32.Parse(record);
            if (record1 > 0) { Response.Write("<script>alert('You have sucessfulyy made booking')</script>");
                Server.Transfer("ShowHotelDetails.aspx");
            }
            else { Response.Write("<script>alert('error')</script>"); }

        }
    }
}