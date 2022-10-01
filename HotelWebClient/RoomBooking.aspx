<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomBooking.aspx.cs" Inherits="HotelWebClient.RoomBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script>fetch("./DebiNavigationBar.aspx")
            .then(response => {
                return response.text()
            })
            .then(data => {
                document.querySelector("header").innerHTML = data;
            });</script>
    <style>
        .Data{border:inset;
             
        }
        .Data h4{display:inline-flex;
                   margin-left:70px;
        }
     .data2{border:inset;
              margin-left:300px;
              padding:20px;
              width:600px;
        }
        #Btncomfirm{background-color:black;
                    width:350px;
                    color:white;
                    margin-left:100px;
                     padding:10px;
        }
        .auto-style2 {
            height: 100px;
        }
    </style>
</head>
<body>
    <header></header>
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <form id="form1" runat="server">
        <div class="Data">
            <h3>Booking details</h3>
            <asp:HiddenField ID="HotelId" runat="server" />
            <asp:HiddenField ID="RoomId" runat="server"  />
    <h4>checkin:  <asp:Label ID="checkin" runat="server" Text=""></asp:Label></h4>
    <h4>checkout: <asp:Label ID="checkout" runat="server" Text=""></asp:Label></h4>
 <h4>Room type: <asp:Label ID="Roomtype" runat="server" Text=""></asp:Label></h4>
            <h4>Room Size:  <asp:Label ID="Roomsize" runat="server" Text=""></asp:Label></h4>
 <h4>Price:  $ <asp:Label ID="price" runat="server" Text=""></asp:Label></h4>
    <h4>Quantity: <asp:Label ID="quantity" runat="server" Text=""></asp:Label></h4>
             <h4>Total:  $ <asp:Label ID="total" runat="server" Text=""></asp:Label></h4>
        </div>

        <div class="data2"><h2>Personal Details</h2>
            <table>
                <tr>
         <td ><asp:Label ID="Label3" runat="server" Text="Name"></asp:Label></td>
        <td > <asp:TextBox ID="Txtfname" runat="server" Height="29px" Width="222px"></asp:TextBox></td> 
         <td><asp:TextBox ID="Txtlname" runat="server" Height="29px" Width="222px"></asp:TextBox></td>
                    <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Enter First Name" ControlToValidate="Txtfname" ForeColor="Red"></asp:RequiredFieldValidator></td>
            <td>         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Enter Last Name" ControlToValidate="Txtlname" ForeColor="Red"></asp:RequiredFieldValidator></td>
         </tr>
 <tr>
          <td > <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label></td>
         <td ><asp:TextBox ID="Txtadress" runat="server" Height="29px" Width="222px" TextMode="Multiline"></asp:TextBox></td>
       <td>                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="Enter Address" ControlToValidate="Txtadress" ForeColor="Red"></asp:RequiredFieldValidator></td>
     
  </tr>
                <tr> <td > <asp:Label ID="Label2" runat="server" Text="Country"></asp:Label></td>
                    <td><asp:TextBox ID="Txtcountry" runat="server" Height="29px" Width="222px" ></asp:TextBox></td>
               <td>               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="Enter Country" ControlToValidate="Txtcountry" ForeColor="Red"></asp:RequiredFieldValidator></td></tr>
                
                <tr> <td > <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label></td>
                    <td><asp:TextBox ID="TxtEmail" runat="server" Height="29px" Width="222px" ></asp:TextBox></td>
            <td>                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Enter Email" ControlToValidate="TxtEmail" ForeColor="Red"></asp:RequiredFieldValidator></td></tr>
        <tr>
          <td > <asp:Label ID="Label5" runat="server" Text="Mobile"></asp:Label></td>
         <td ><asp:TextBox ID="TxtMobile" runat="server" Height="29px" Width="222px" ></asp:TextBox></td>
         <td>               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="Enter Mobile" ControlToValidate="TxtMobile" ForeColor="Red"></asp:RequiredFieldValidator></td></tr>
        
         
         </table>
            <asp:Button ID="Btncomfirm" runat="server" Text="ComfirmBooking" OnClick="Btncomfirm_Click" />
        </div>
        
        <p>
            &nbsp;</p>
        
    </form>
</body>
</html>
