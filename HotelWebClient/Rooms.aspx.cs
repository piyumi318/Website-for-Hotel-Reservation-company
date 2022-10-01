using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HotelWebClient
{
    public partial class Rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string HotelId = (string)Session["HotelNumber"];
            if (HotelId == null)
           {

                Response.Redirect("HotelLogin.aspx");

            }
        }

        protected void btnAddRoom_Click(object sender, EventArgs e)
        {
            string HotelId = (string)Session["HotelNumber"];
            string roomtype = null;
            if (standard.Checked)
            {
                roomtype = "Standard";
            }
            else if (Deluxe.Checked) { roomtype = "Deluxe"; }
            else { roomtype = "Suite"; }
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string path = Path.GetFileName(ImageFile1.FileName);
            path = path.Replace(" ", " ");
            ImageFile1.SaveAs(Server.MapPath("/Room/") + path);
            string path1 = "/Room/" + path;
            string roomId = obj.AutoRoomID();

            string record = obj.insertRoom(roomId, roomtype, dlSize.SelectedItem.ToString(),
                Convert.ToInt32(txtprice.Text), Convert.ToInt32(txtQunatity.Text), path1, HotelId);
            int record1 = Int32.Parse(record); if (record1 > 0) { Response.Write("<script>alert('Room is added sucessfully')</script>"); }
            else { Response.Write("<script>alert('error')</script>"); }
        }
        
        
    }
}