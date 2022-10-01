using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace HotelWebClient
{
    public partial class RoomsOfHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label5.Visible = false;                    
            string hotelNo=(string)Session["HotelIDFor"];
            if (hotelNo == null) { Response.Redirect("ShowHotelDetails.aspx"); }            
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Roomtypes.Visible = true;
            Price.Visible = false;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Price.Visible = true;
            Roomtypes.Visible = false;
        }
        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string hotelNo = (string)Session["HotelIDFor"];
            DataList2.DataSource = obj.RoomDetailsbyHotelID(hotelNo);
            DataList2.DataBind();
        }

        protected void BtnFillter_Click(object sender, EventArgs e)
        {
            HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
            string hotelNo = (string)Session["HotelIDFor"];
            if (RadioButton1.Checked)
            {
                string data2 = Roomtypes.SelectedItem.ToString();

                DataList2.DataSource = obj.FilterRoomTypeHotel(data2,hotelNo); ;
                DataList2.DataBind();
            }
            else if (RadioButton2.Checked)
            {
               
                string data1 = null;
                string data = Price.SelectedItem.ToString();
                if (data == "10-20") { data1 = "10 AND 20"; }
                else if (data == "20-30") { data1 = "20 AND 30"; }
                else if (data == "30-40") { data1 = "30 AND 40"; }
                else if (data == "40-50") { data1 = "40 AND 50"; }
                else if (data == "50-60") { data1 = "50 AND 60"; }
                else if (data == "60-70") { data1 = "60 AND 70"; }
                else { data1 = "70 AND 100"; }

              DataList2.DataSource = obj.FilterDataHotel(data1, hotelNo);
                DataList2.DataBind();
            }
            else if(RadioButton3.Checked){                               
            }
            else { Response.Write("<script>alert('select filter')</script>"); }
        }

        protected void DataList2_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Check")
                {
                    HiddenField id = (HiddenField)DataList2.Items[e.Item.ItemIndex].FindControl("RoomId");
                    string checkIn = ((TextBox)DataList2.Items[e.Item.ItemIndex].FindControl("txtCheckIn")).Text;
                    string quantity = ((TextBox)DataList2.Items[e.Item.ItemIndex].FindControl("quantity")).Text;
                    string Checkout = ((TextBox)DataList2.Items[e.Item.ItemIndex].FindControl("txtCheckOut")).Text;
                    HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                    int roomcout = obj.Roomcount(id.Value);
                    int bookroomcout = obj.BookedRoomcount(checkIn, Checkout, id.Value);
                    Label5.Visible = true;
                    if (checkIn == "" || Checkout == "") { Label5.Text = "Make sure to enter checkin and check out dates"; }
                    else if (quantity == "") { Label5.Text = "Makr sure to enter quantity"; }
                    else
                    {
                        if (Int32.Parse(quantity) > roomcout) { Label5.Text = "Not Available That much rooms"; }
                        else
                        {
                            if ((bookroomcout + Int32.Parse(quantity)) > roomcout) { Label5.Text = "Exsisting Rooms are booked"; }
                            else { Label5.Text = "Room Available"; }
                        }
                    }
                }
                if (e.CommandName == "Book")
                {
                    HiddenField roomid = (HiddenField)DataList2.Items[e.Item.ItemIndex].FindControl("RoomId");
                    HiddenField hotelid = (HiddenField)DataList2.Items[e.Item.ItemIndex].FindControl("HotelId");
                    string roomtype = ((Label)DataList2.Items[e.Item.ItemIndex].FindControl("Label1")).Text;
                    string price = ((Label)DataList2.Items[e.Item.ItemIndex].FindControl("price")).Text;
                    string roomsize = ((Label)DataList2.Items[e.Item.ItemIndex].FindControl("roomsize")).Text;
                    string quantity = ((TextBox)DataList2.Items[e.Item.ItemIndex].FindControl("quantity")).Text;
                    string checkIn = ((TextBox)DataList2.Items[e.Item.ItemIndex].FindControl("txtCheckIn")).Text;
                    string Checkout = ((TextBox)DataList2.Items[e.Item.ItemIndex].FindControl("txtCheckOut")).Text;
                    Label5.Visible = true;
                    if (checkIn == "" || Checkout == "") { Label5.Text = "Make sure to enter checkin and check out dates"; }
                    else if (quantity == "") { Label5.Text = "Makr sure to enter quantity"; }
                    else
                    {
                        HotelServiceReference1.HotelsWebServiceSoapClient obj = new HotelServiceReference1.HotelsWebServiceSoapClient();
                        HiddenField id = (HiddenField)DataList2.Items[e.Item.ItemIndex].FindControl("RoomId");
                        int roomcout = obj.Roomcount(id.Value);
                        int bookroomcout = obj.BookedRoomcount(checkIn, Checkout, id.Value);

                        if (Int32.Parse(quantity) > roomcout) { Label5.Text = "Not Available That much rooms"; }
                        else
                        {
                            if ((bookroomcout + Int32.Parse(quantity)) > roomcout) { Label5.Text = "Exsisting Room are Booked"; }
                            else
                            {
                                Session["HotelID"] = hotelid.Value;
                                Session["RoomID"] = roomid.Value;
                                Session["checkin"] = checkIn;
                                Session["checkout"] = Checkout;
                                Session["roomtype"] = roomtype;
                                Session["qunatity"] = quantity;
                                Session["price"] = price;
                                Session["roomsize"] = roomsize;
                                Label5.Text = "Room Available";
                                Response.Redirect("RoomBooking.aspx");
                            }
                        }
                        }
                }

            }
            catch (Exception ex)
            {
                Exception E = ex;
            }
        }

    }
}