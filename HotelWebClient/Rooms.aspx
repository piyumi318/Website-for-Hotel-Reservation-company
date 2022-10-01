<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="HotelWebClient.Rooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <script>
    var loadFile = function (event) {
         var output = document.getElementById('output');
         output.src = URL.createObjectURL(event.target.files[0]);
         output.onload = function () {
             URL.revokeObjectURL(output.src) 
         }
     };
     fetch("./HotelDashboard.aspx")
            .then(response => {
                return response.text()
            })
            .then(data => {
                document.querySelector("header").innerHTML = data;
            });
 </script>
    <style type="text/css">
     
         
        #Label1{font-size:28px;}
       body{ background-color:darkgrey;}

       #formAddRoom{border:inset;
               width:630px;
               height:500px;
               padding:40px;
               margin-left:450px;
                background-color:white;
              
        }
        #ImageFile1 {
            margin-left: 100px;
        }
        #btnAddRoom { margin-left: 140px;
                   width:350px;
                   color:white;
                   background-color:black;
     }
        h4{font-size:18px;}

    #output {margin-left:100px;}
#standard #Deluxe #Suite {font-size:16px;}
        
    .types{font-size:16px;}
       
      
    
        .auto-style1 {
            width: 101px;
        }
       
      
    
    </style>
</head>
<body>
<header></header>
      <asp:Label ID="Label1" runat="server" Text="Add Room Details"></asp:Label><br />

     <form id="formAddRoom" runat="server">                     
                      <asp:Image ID="output" runat="server"  width="200px" Height="200px"/><br />
                  
                 <asp:FileUpload ID="ImageFile1" runat="server" onchange="loadFile(event)"/>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Image should be entered" 
                        ControlToValidate="ImageFile1" ForeColor="#FF6600"></asp:RequiredFieldValidator>                     
        <div><table class="auto-style5">
             
    <tr>
        <td class="auto-style1" ><h4>Room Type</h4></td>
      
        <td class="types">
            <asp:RadioButton ID="standard" GroupName="radio" runat="server" Text="Standard" Checked="true" />
            <asp:RadioButton ID="Deluxe" GroupName="radio" runat="server" text="Deluxe"/>
              <asp:RadioButton ID="Suite" GroupName="radio" runat="server" text="Suite"/>
        </td> </tr>
        <tr>
        <td class="auto-style1"  ><h4>Price</h4></td>
        <td  ><asp:TextBox ID="txtprice" runat="server" style="margin-left: 0px" Width="275px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Price should be entered" 
            ControlToValidate="txtprice" ForeColor="#FF6600"></asp:RequiredFieldValidator></td>                                  
    </tr>
    <tr>
        <td class="auto-style1"><h4>Quantity</h4></td>
        <td><asp:TextBox ID="txtQunatity" runat="server" style="margin-left: 0px" Width="275px"  TextMode="Number" Height="16px" ></asp:TextBox></td>
       <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Quantuity should be entered" 
           ControlToValidate="txtQunatity" ForeColor="#FF6600"></asp:RequiredFieldValidator></td>            
    </tr>
    
    <tr><td class="auto-style1"><h4>Room Size</h4></td>
        
        <td><asp:DropDownList ID="dlSize" runat="server" >
            <asp:ListItem>Single</asp:ListItem>
            <asp:ListItem>Double</asp:ListItem>
            <asp:ListItem>Family</asp:ListItem>
          
            </asp:DropDownList></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Room Size should be entered"
            ControlToValidate="dlSize" ForeColor="#FF6600"></asp:RequiredFieldValidator></td>                         
    </tr>   
</table>
       <asp:Button ID="btnAddRoom" runat="server" Text="Add Room" style="height: 29px" OnClick="btnAddRoom_Click"  />    
            
        </div>
    </form>
</body>
</html>