<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowHotelDetails.aspx.cs" Inherits="HotelWebClient.ShowHotelDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        fetch("./DebiNavigationBar.aspx")
            .then(response => {
                return response.text()
            })
            .then(data => {
                document.querySelector("header").innerHTML = data;
            });</script>
     <style>
        .table1 {margin-left:170px;
                 border:inset;
                     width:300px;
                     padding:10px;
        }
         .auto-style1 {
             width: 115px;
         }
         .auto-style2 {
             width: 130px;
         }
         .auto-style3 {
             margin-left: 98px;
         }
  </style>
</head>
<body>
    <header></header>
    <form id="form1" runat="server">
         <div>
         <table>
            <tr> <td><h3>Select Category</h3></td></tr>
               
                <tr> <td><asp:RadioButton ID="country" GroupName="radio" runat="server" Text="Country" 
                    AutoPostBack="true" OnCheckedChanged="country_CheckedChanged"   />
                    <asp:RadioButton ID="city" GroupName="radio" runat="server" Text="City" 
                        AutoPostBack="true" OnCheckedChanged="city_CheckedChanged"  />
                </td>
        </tr>
 <tr><td><h3>Search Hotel</h3></td>
        <td class="auto-style1"><asp:DropDownList ID="dlhotels" runat="server" ></asp:DropDownList> </td>
        <td><asp:DropDownList ID="dlhotels1" runat="server" Width="108px" ></asp:DropDownList></td>
        <td><asp:Button runat="server" Text="findout hotels" OnClick="Unnamed1_Click"  /></td>
       <td class="auto-style2"><asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style3" ></asp:DropDownList></td>
        <td> <asp:Button ID="search" runat="server" Text="Search" OnClick="Search_Click" Width="115px"  /></td>
    </tr>              
        </table>
        </div>

        <div >
            <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" CellPadding="2" OnItemCommand="DataList2_ItemCommand">
            <ItemTemplate>
                  <div class="table1">
                <table >
                      <tr><td>  <asp:Image ID="Image1" runat="server" Height="250px" Width="300px" ImageUrl='<%#Eval("Image")%>'/></td></tr>  
                    <tr> <td>Hotel Name: <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>' ></asp:Label></td>
                         <td>  <asp:HiddenField ID="hf1" runat="server" Value='<%# Eval("HotelId") %>' /></td></tr>
                    <tr><td>About: <%#Eval("Description") %></td></tr>
                    <tr><td>No: <%#Eval("No") %></td> </tr>
                      <tr><td>City: <%#Eval("City") %></td> </tr> 
                     <tr> <td>Country: <%#Eval("Country") %></td> </tr>
                      <tr><td>Mobile:<%#Eval("Mobile") %></td></tr>
                     <tr><td>Email: <%#Eval("Email") %></td> </tr>
                   <tr><td><asp:linkbutton id="Linkbutton1" runat="server" commandname="View" text="View" ></asp:linkbutton></td>  </tr>
                    </table>
                        </div>
            </ItemTemplate>
                </asp:DataList>
        </div>
    </form>
</body>
</html>
