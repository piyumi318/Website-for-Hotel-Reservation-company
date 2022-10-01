using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.IO;


namespace HotelWebServer
{
    /// <summary>
    /// Summary description for HotelsWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class HotelsWebService : System.Web.Services.WebService
    {


        SqlConnection conn = null;
        public SqlConnection getConnection()
        {
            try
            {
                conn = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog= DebiDatabase;user id=piyumi; password=soc15;");
                conn.Open();
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return conn;
        }
        [WebMethod]
        public string AutoID()
        {
            string catId = null;
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select HotelId from HotelDetails", conn);
                SqlDataReader dr = com.ExecuteReader();
                string Id = "";
                bool records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        Id = dr[0].ToString();
                    }
                    string idString = Id.Substring(3);
                    int CTR = Int32.Parse(idString);
                    if (CTR >= 1 && CTR < 9)
                    {
                        CTR = CTR + 1;
                        catId = "HRI000" + CTR;
                    }
                    else if (CTR >= 10 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        catId = "HRI00" + CTR;
                    }
                    else if (CTR >= 10 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        catId = "HRI0" + CTR;
                    }
                    else if (CTR > 999)
                    {
                        CTR = CTR + 1;
                        catId = "HRI" + CTR;
                    }
                }
                else { catId = "HRI0001"; }
                dr.Close();
            }
            catch (Exception ex) { catId = ex.ToString(); }


            return catId;
        }
        [WebMethod]
        public string insert(string ID, string Name, string Description, string No, string City,
            string Country, string mobile, string Email, string username, string password, string Image)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("insert into HotelDetails values('" + ID + "','" + Name + "'," +
                    "'" + Description + "','" + No + "','" + City + "','" + Country + "','" + mobile + "','" + Email + "'," +
                    "'" + username + "','" + password + "','" + Image + "');", conn);

                Norecord = com1.ExecuteNonQuery();
            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public string AutoCustomerID()
        {
            string catId = null;
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select CustomerId from CustomerDetails", conn);
                SqlDataReader dr = com.ExecuteReader();
                string Id = "";
                bool records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        Id = dr[0].ToString();
                    }
                    string idString = Id.Substring(3);
                    int CTR = Int32.Parse(idString);
                    if (CTR >= 1 && CTR < 9)
                    {
                        CTR = CTR + 1;
                        catId = "CUS000" + CTR;
                    }
                    else if (CTR >= 9 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        catId = "CUS00" + CTR;
                    }
                    else if (CTR >= 99 && CTR < 999)
                    {
                        CTR = CTR + 1;
                        catId = "CUS0" + CTR;
                    }
                    else if (CTR >=999)
                    {
                        CTR = CTR + 1;
                        catId = "CUS" + CTR;
                    }
                }
                else { catId = "CUS0001"; }
                dr.Close();
            }
            catch (Exception ex) { catId = ex.ToString(); }


            return catId;
        }

        [WebMethod]
        public string AddCustomerData(string customerid, string fname, string lastname, string address,
            string gender, string bday, string mobile, string email, string uname, string pword)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("insert into CustomerDetails values('" + customerid + "','" + fname + "'," +
                    "'" + lastname + "','" + address + "','" + gender + "','" + bday + "','" + mobile + "'," +
                    "'" + email + "','" + uname + "','" + pword + "');", conn);

                Norecord = com1.ExecuteNonQuery();

            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public DataSet getHotelData()
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("Select * from HotelDetails", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds);
            }
            catch (Exception ex) { Console.WriteLine("error hotel seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public string AutoRoomID()
        {
            string catId = null;
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select RoomId from RoomDetails", conn);
                SqlDataReader dr = com.ExecuteReader();
                string Id = "";
                bool records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        Id = dr[0].ToString();
                    }
                    string idString = Id.Substring(3);
                    int CTR = Int32.Parse(idString);
                    if (CTR >= 1 && CTR < 9)
                    {
                        CTR = CTR + 1;
                        catId = "ROM000" + CTR;
                    }
                    else if (CTR >= 9 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        catId = "ROM00" + CTR;
                    }
                    else if (CTR >= 99 && CTR < 999)
                    {
                        CTR = CTR + 1;
                        catId = "ROM0" + CTR;
                    }
                    else if (CTR >= 999)
                    {
                        CTR = CTR + 1;
                        catId = "ROM" + CTR;
                    }
                }
                else { catId = "ROM0001"; }
                dr.Close();
            }
            catch (Exception ex) { catId = ex.ToString(); }


            return catId;
        }
        [WebMethod]
        public string insertRoom(string ID, string Type, string Size, int price, int quantity, string Image, string hotelId)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("insert into RoomDetails values('" + ID + "','" + Size + "','" + price + "'," +
                    "'" + quantity + "','" + Image + "','" + Type + "','" + hotelId + "');", conn);

                Norecord = com1.ExecuteNonQuery();

            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }

        [WebMethod]
        public string HotelLoginData(string Username, string password)
        {
            string id = "";
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select HotelId from HotelDetails where Username = " +
                    "'" + Username + "'AND Password = '" + password + "'", conn);
                SqlDataReader dr = com.ExecuteReader();
                Boolean record = dr.HasRows;
                if (record) { while (dr.Read()) { id = dr["HotelId"].ToString(); } }
                dr.Close();
            }
            catch (Exception ex) { Console.WriteLine("error hotel seraching" + ex); }
            return id;
        }

        [WebMethod]
        public string customerLoginData(string Username, string password)
        {
            string id = "";
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select CustomerId from CustomerDetails" +
                    " where Username = '" + Username + "'AND Password = '" + password + "'", conn);
                SqlDataReader dr = com.ExecuteReader();
                Boolean record = dr.HasRows;
                if (record) { while (dr.Read()) { id = dr["CustomerId"].ToString(); } }
                dr.Close();
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return id;
        }
        [WebMethod]
        public string AutoAdminID()
        {
            string catId = null;
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select AdminId from AdminDetails", conn);
                SqlDataReader dr = com.ExecuteReader();
                string Id = "";
                bool records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        Id = dr[0].ToString();
                    }
                    string idString = Id.Substring(5);
                    int CTR = Int32.Parse(idString);
                    if (CTR >= 1 && CTR < 9)
                    {
                        CTR = CTR + 1;
                        catId = "Admin0" + CTR;
                    }
                    else if (CTR >=9 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        catId = "Admin" + CTR;
                    }
                }
                else { catId = "Admin01"; }
                dr.Close();
            }
            catch (Exception ex) { catId = ex.ToString(); }
            return catId;
        }
        [WebMethod]
        public string AddAdmin(string ID, string username, string pass)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("insert into AdminDetails values('" + ID + "','" + username + "','" + pass + "');", conn);

                Norecord = com1.ExecuteNonQuery();

            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public string AdminLoginData(string Username, string password)
        {
            string id = "";
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select AdminId from  AdminDetails  where" +
                    " Username = '" + Username + "'AND Password = '" + password + "'", conn);
                SqlDataReader dr = com.ExecuteReader();
                Boolean record = dr.HasRows;
                if (record) { while (dr.Read()) { id = dr["AdminId"].ToString(); } }
                dr.Close();
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return id;
        }
        [WebMethod]
        public DataSet FilterData(string data)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM RoomDetails where price BETWEEN  " + data + " ", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds);
            }
            catch (Exception ex) { Console.WriteLine("error Room seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet FilterRoomType(string data)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM RoomDetails where roomtype='" + data + "' ", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds);
            }
            catch (Exception ex) { Console.WriteLine("error Room seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet RoomDetails()
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM RoomDetails ", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds);
            }
            catch (Exception ex) { Console.WriteLine("error Room seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet CountryOfHotels()
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT Country FROM HotelDetails GROUP BY Country", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "HotelDetails");
            }
            catch (Exception ex) { Console.WriteLine("error seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet CityOfHotels()
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT City FROM HotelDetails GROUP BY City", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "HotelDetails");
            }
            catch (Exception ex) { Console.WriteLine("error seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet HotelsToCity(string city)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT Name FROM HotelDetails where City='" + city + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "HotelDetails");
            }
            catch (Exception ex) { Console.WriteLine("error Room seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet HotelsToCountry(string country)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT Name FROM HotelDetails where Country='" + country + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "HotelDetails");
            }
            catch (Exception ex) { Console.WriteLine("error seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet HotelsDetailsAccordingToName(string name)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM HotelDetails where Name='" + name + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "HotelDetails");
            }
            catch (Exception ex) { Console.WriteLine("error seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public string BookingDetails(string ID, string FirstName, string LastName,
            string address, string country, string email, string mobile, string checkin,
            string checkout, string customerId, string hotelId, string roomId, string quantity, int total)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("insert into BookingDetails values('" + ID + "','" + FirstName + "','" + LastName + "'," +
                    "'" + address + "','" + country + "','" + email + "','" + mobile + "','" + checkin + "','" + checkout + "'," +
                    "'" + customerId + "','" + hotelId + "','" + roomId + "','" + quantity + "','" + total + "');", conn);
                Norecord = com1.ExecuteNonQuery();
            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public int Roomcount(string ID)
        {
            int Roomcount = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("select Quantity from RoomDetails where RoomId='" + ID + "'", conn);
                SqlDataReader dr = com1.ExecuteReader();
                Boolean records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    { Roomcount = (int)dr[0]; }
                }
                dr.Close();


            }
            catch (Exception ex) { ex.ToString(); }
            return Roomcount;
        }
        [WebMethod]
        public int BookedRoomcount(string Checkin, string checkout, string Id)
        {
            int Bookingcount = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("Select Sum(Quantity) from BookingDetails" +
                    "  where RoomId='" + Id + "'AND (CheckIn BETWEEN  '" + Checkin + "'AND '" + checkout + "'" +
                    " OR Checkout BETWEEN  '" + Checkin + "'AND '" + checkout + "')", conn);
                SqlDataReader dr = com1.ExecuteReader();
                Boolean records = dr.HasRows;
                if (records) { while (dr.Read()) { Bookingcount = (int)dr[0]; } }
                dr.Close();

            }
            catch (Exception ex) { ex.ToString(); }
            return Bookingcount;
        }
        [WebMethod]
        public string AutoBookingID()
        {
            string catId = null;
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select BookingId from BookingDetails", conn);
                SqlDataReader dr = com.ExecuteReader();
                string Id = "";
                bool records = dr.HasRows;
                if (records)
                {
                    while (dr.Read())
                    {
                        Id = dr[0].ToString();
                    }
                    string idString = Id.Substring(4);
                    int CTR = Int32.Parse(idString);
                    if (CTR >= 1 && CTR < 9)
                    {
                        CTR = CTR + 1;
                        catId = "BKNo000" + CTR;
                    }
                    else if (CTR >= 9 && CTR < 99)
                    {
                        CTR = CTR + 1;
                        catId = "BKNo00" + CTR;
                    }
                    else if (CTR >=99 && CTR < 999)
                    {
                        CTR = CTR + 1;
                        catId = "BKNo0" + CTR;
                    }
                    else if (CTR >=999)
                    {
                        CTR = CTR + 1;
                        catId = "BKNo" + CTR;
                    }

                }
                else { catId = "BKNo0001"; }
                dr.Close();
            }
            catch (Exception ex) { catId = ex.ToString(); }


            return catId;
        }
        [WebMethod]
        public DataSet MyHotelsDetails(string hotelId)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM HotelDetails where HotelId='" + hotelId + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "HotelDetails");
            }
            catch (Exception ex) { Console.WriteLine("error seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet MyhotelBooking(string hotelId)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM BookingDetails where HotelId='" + hotelId + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "BookingDetails");
            }
            catch (Exception ex) { Console.WriteLine("error" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet MyBooking(string customerId)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM BookingDetails where CustomerId='" + customerId + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "BookingDetails");
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet Room(string RoomId)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM RoomDetails where RoomId='" + RoomId + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "RoomDetails");
            }
            catch (Exception ex) { Console.WriteLine("error Room seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public string CancelBooking(string bookingID)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("DELETE FROM BookingDetails WHERE BookingId='" + bookingID + "';", conn);

                Norecord = com1.ExecuteNonQuery();

            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public DataSet AllBooking()
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM BookingDetails", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "BookingDetails");
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet CustomertoID(string customerId)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM CustomerDetails where CustomerId='" + customerId + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "BookingDetails");
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return ds;
        }
        [WebMethod]
        public string AdminUsername(string Username)
        {
            string id = "";
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select AdminId from  AdminDetails  where Username = '" + Username + "'", conn);
                SqlDataReader dr = com.ExecuteReader();
                Boolean record = dr.HasRows;
                if (record) { while (dr.Read()) { id = dr["AdminId"].ToString(); } }
                dr.Close();
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return id;
        }
        [WebMethod]
        public string HotelUsername(string Username)
        {
            string id = "";
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select HotelId from" +
                    "  HotelDetails  where Username = '" + Username + "'", conn);
                SqlDataReader dr = com.ExecuteReader();
                Boolean record = dr.HasRows;
                if (record) { while (dr.Read()) { id = dr["HotelId"].ToString(); } }
                dr.Close();
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return id;
        }
        [WebMethod]
        public string CustomerUsername(string Username)
        {
            string id = "";
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("select CustomerId from" +
                    " CustomerDetails where Username = '" + Username + "'", conn);
                SqlDataReader dr = com.ExecuteReader();
                Boolean record = dr.HasRows;
                if (record) { while (dr.Read()) { id = dr["CustomerId"].ToString(); } }
                dr.Close();
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return id;
        }
        [WebMethod]
        public string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[]
                { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
        [WebMethod]
        public DataSet RoomDetailsbyHotelID(string HotelID)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM RoomDetails where HotelId='" + HotelID + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "RoomDetails");
            }
            catch (Exception ex) { Console.WriteLine("error Room seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public string DeleteHotel(string HotelID)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("DELETE FROM HotelDetails WHERE HotelId='" + HotelID + "';", conn);

                Norecord = com1.ExecuteNonQuery();

            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public string DeleteRoomByHotelId(string HotelID)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("DELETE FROM RoomDetails WHERE HotelId='" + HotelID + "';", conn);

                Norecord = com1.ExecuteNonQuery();

            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public DataSet FilterDataHotel(string data, string hotelid)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM RoomDetails " +
                    "where price BETWEEN  " + data + "AND hotelId='"+hotelid+"' ", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds);
            }
            catch (Exception ex) { Console.WriteLine("error Room seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public DataSet FilterRoomTypeHotel(string data, string hotelid)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM RoomDetails " +
                    "where roomtype='" + data + "'AND HotelId='"+hotelid+"' ", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds);
            }
            catch (Exception ex) { Console.WriteLine("error Room seraching" + ex); }
            return ds;
        }
        [WebMethod]
        public string DeleteRoom(string RoomID)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("DELETE FROM RoomDetails WHERE RoomId='" + RoomID + "';", conn);

                Norecord = com1.ExecuteNonQuery();

            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public string UpdateRoom(string RoomID,string Image, int quantity,int price)
        {
            int Norecord = 0;
            try
            {
                getConnection();
                SqlCommand com1 = new SqlCommand("Update RoomDetails Set" +
                    " Image='"+Image+"',Quantity='" + quantity + "',Price='"+price+"'" +
                    " WHERE RoomId='" + RoomID + "';", conn);

                Norecord = com1.ExecuteNonQuery();

            }
            catch (Exception ex) { ex.ToString(); }
            return Norecord.ToString();
        }
        [WebMethod]
        public DataSet customerDetailsbyID(string customerID)
        {
            DataSet ds = new DataSet();
            try
            {
                getConnection();
                SqlCommand com = new SqlCommand("SELECT * FROM CustomerDetails " +
                    "where CustomerId='" + customerID + "'", conn);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                adapter.Fill(ds, "CustomerDetails");
            }
            catch (Exception ex) { Console.WriteLine("error " + ex); }
            return ds;
        }
    }
}
