using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace HotelWebClient
{
    public partial class ManageAllHotels : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string AdminId = (string)Session["Admin"];
            if (AdminId == null)
            {

                Response.Redirect("AdminLogin.aspx");

            }
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            DataList2.DataSource = obj.getHotelData();
            DataList2.DataBind();
            if (!IsPostBack) { 
                DataSet ds = obj.CountryOfHotels();
                dlhotels1.DataSource = ds;
                dlhotels1.DataBind();
                dlhotels1.DataValueField = "Country";
                dlhotels1.DataBind();
                DataSet ds1 = obj.CityOfHotels();
                dlhotels.DataSource = ds1;
                dlhotels.DataBind();
                dlhotels.DataValueField = "City";
                dlhotels.DataBind();
            }
        }

        protected void DataList2_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Removes")
                {
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                    HiddenField id1 = (HiddenField)DataList2.Items[e.Item.ItemIndex].FindControl("hf1");
                    string record=  obj.DeleteHotel(id1.Value);
                    string result = obj.DeleteRoomByHotelId(id1.Value);
                    int record1=Int32.Parse(record);
                    int result1=Int32.Parse(result);
                    if (record1 > 0 || result1>0) { Response.Redirect(Request.RawUrl, true); }
                   
                }
                if (e.CommandName == "View")
                {
                    HiddenField id1 = (HiddenField)DataList2.Items[e.Item.ItemIndex].FindControl("hf1");
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                    
                    
                    Session["HotelIDFor"] = id1.Value;

                      Response.Redirect("HotelsRooms.aspx");
                }
            
            }
            catch (Exception ex)
            {
                Exception E = ex;
            }
        }
        protected void country_CheckedChanged(object sender, EventArgs e)
        {
            dlhotels.Visible = false;
            dlhotels1.Visible = true;
        }

        protected void city_CheckedChanged(object sender, EventArgs e)
        {

            dlhotels1.Visible = false;
            dlhotels.Visible = true;
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            if (country.Checked)
            {

                DataSet ds = obj.HotelsToCountry(dlhotels1.SelectedItem.ToString());
                DropDownList1.DataSource = ds;
                DropDownList1.DataBind();
                DropDownList1.DataValueField = "Name";
                DropDownList1.DataBind();
                
            }
            else if (city.Checked)
            {
                DataSet ds = obj.HotelsToCity(dlhotels.SelectedItem.ToString());
                DropDownList1.DataSource = ds;
                DropDownList1.DataBind();
                DropDownList1.DataValueField = "Name";
                DropDownList1.DataBind();
            }
            else { Response.Write("<script>alert('Select city or country to search')</script>"); }

        }

        protected void Search_Click(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();

            DataList2.DataSource = obj.HotelsDetailsAccordingToName(DropDownList1.SelectedItem.ToString());
            DataList2.DataBind();
        }

    }
}