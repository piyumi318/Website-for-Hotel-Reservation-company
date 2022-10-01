using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace HotelWebClient
{
    public partial class ManageRoomDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string HotelId = (string)Session["HotelNumber"];
            if (HotelId == null)
            {
                
                Response.Redirect("HotelLogin.aspx");
               
            }
            else { string roomId = (string)Session["HotelRoomID"];
                Roomid.Text = roomId;
            }
        }
        
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string roomId = (string)Session["HotelRoomID"];
           
            string path = Path.GetFileName(ImageFile1.FileName);
            path = path.Replace(" ", " ");
            ImageFile1.SaveAs(Server.MapPath("/Room/") + path);
            string path1 = "/Room/" + path;
           string record= obj.UpdateRoom(roomId,path1,Convert.ToInt32(txtQunatity.Text),Convert.ToInt32(txtPrice.Text));
            int record1 = Int32.Parse(record); if (record1 > 0)
            { Response.Write("<script>alert('Room is updated sucessfully')</script>");
                Server.Transfer("ShowMyHotel.aspx"); }
            else { Response.Write("<script>alert('error')</script>"); }

        }
    }
}