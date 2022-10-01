using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelWebClient
{
    public partial class HotelsRooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string hotelNo = (string)Session["HotelIDFor"];
            DataList2.DataSource = obj.RoomDetailsbyHotelID(hotelNo);
            DataList2.DataBind();

        }    
    }
}