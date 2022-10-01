<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelReg.aspx.cs" Inherits="HotelWebClient.HotelReg" %>

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
        
        fetch("./AdminDashboard.aspx")
            .then(response => {
                return response.text()
            })
            .then(data => {
                document.querySelector("header").innerHTML = data;
            });
    </script>

    
    <style>
        body{background-color:darkgray;}
        form table{margin:20px;}
        .table1 {margin-left:500px;}
        .table2,.table3{display:inline-block;
		margin-left:70px;}
        .table4,.table5{display:inline-block;
		margin-left:70px;}
        #btnHotelSumbmit{
        margin-left:400px;
        padding:10px;
        background-color:black;
        color:white;
        }
     
        .auto-style3 {
            width: 115px;
        }

        .auto-style4 {
            margin-right: 2px;
        }header, form{margin:30px;}
        #formHotelReg{  border:outset;
                        background-color:white;
        }

        .auto-style5 {
            height: 56px;
        }
        .auto-style6 {
            height: 39px;
        }
        .auto-style7 {
            height: 57px;
        }
        .auto-style10 {
            width: 574px;
        }
        .auto-style11 {
            width: 279px;
        }
        .auto-style12 {
            height: 48px;
        }
        .auto-style13 {
            width: 485px;
            height: 159px;
        }
        .auto-style16 {
            width: 209px;
        }h3{font-size:28px;}

        .auto-style18 {
            height: 39px;
            width: 209px;
        }
        .auto-style19 {
            height: 43px;
        }
        .auto-style20 {
            height: 43px;
            width: 209px;
        }
        

    </style>
</head>
<body>
    <header></header>
     <h3>Add Hotel</h3> 
     <form id="formHotelReg" runat="server">
         <asp:Label ID="Label16" runat="server" Text="Hotel Id="></asp:Label>
     
         
        <div class="table1">              
            <table>
                <tr>                
                     <td><asp:Image ID="output" runat="server"  width="200px" Height="200px"/></td>
                     <td >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Picture shoul be entered"
                        ControlToValidate="ImageFile1" ForeColor="#FF3300"></asp:RequiredFieldValidator></td> </tr>                 
                <tr> <td> <asp:FileUpload ID="ImageFile1" runat="server" onchange="loadFile(event)"/></td>
                     </tr>
             </table>
        </div>
               
        <div class="table2">
             <asp:Label ID="Label6" runat="server" Text="Basic Details"></asp:Label>

            <table class="auto-style10">
                <tr>
                    <td class="auto-style3"> <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                    <td class="auto-style11"><asp:TextBox ID="TxtHotelName" runat="server" Width="269px" 
                        CssClass="auto-style4" Height="28px"></asp:TextBox></td>
                     <td ><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Hotel Name Must be entered"
                        ControlToValidate="TxtHotelName" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                </tr>
                <tr><td class="auto-style3"> <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label></td>
                      <td class="auto-style11"><asp:TextBox ID="TxtDescription" runat="server" Width="268px"
                          TextMode="multiline" ></asp:TextBox></td>
                    <td ><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Description "
                        ControlToValidate="TxtDescription" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>                                       
                </tr>
            </table>
           </div>
            <div class="table3">            
                 <u><asp:Label ID="Label5" runat="server" Text="Location Details"></asp:Label></u>
                <table class="auto-style13">
                     <tr><td class="auto-style7"> <asp:Label ID="Label4" runat="server" Text="No."></asp:Label></td>
                     <td class="auto-style7"><asp:TextBox ID="TxtNo" runat="server" Width="227px"></asp:TextBox></td>
                    <td class="auto-style7" ><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="No Must be entered"
                        ControlToValidate="TxtNo" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>

                </tr>
                <tr>
                    <td> <asp:Label ID="Label3" runat="server" Text="City"></asp:Label></td>

                    <td><asp:TextBox ID="TxtCity" runat="server" Width="211px" Height="21px"></asp:TextBox></td>
                    <td ><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="CityMust be entered"
                        ControlToValidate="TxtCity" ForeColor="#FF3300" CssClass=" "></asp:RequiredFieldValidator></td>
                    </tr>
                 <tr>
                     <td class="auto-style12"> <asp:Label ID="Label8" runat="server" Text="Country"></asp:Label></td>

                    <td class="auto-style12"><asp:TextBox ID="TxtCountry" runat="server" Width="219px" Height="17px" ></asp:TextBox></td>
                     <td class="auto-style12" ><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                         ErrorMessage="Country Must be entered"
                        ControlToValidate="TxtCountry" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                </tr>
               
            </table>

            </div>
        <div class="table4">
           <u>  <asp:Label ID="Label9" runat="server" Text="Contact Details"></asp:Label></u>

            <table>
                <tr>
                    <td class="auto-style5"> <asp:Label ID="Label10" runat="server" Text="Mobile Number"></asp:Label></td>
                    <td class="auto-style5"><asp:TextBox ID="TxtMobileNo" runat="server" Width="214px" Height="29px" ></asp:TextBox></td>
                    <td class="auto-style5" ><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="Mobile Number Must be entered"
                        ControlToValidate="TxtMobileNo" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>

                </tr>
                <tr><td class="auto-style6"> <asp:Label ID="Label11" runat="server" Text="Email"></asp:Label></td>
                    
                     <td class="auto-style6"><asp:TextBox ID="TxtEmail" runat="server" Width="205px" Height="29px" ></asp:TextBox></td>
                    <td class="auto-style6" ><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                        ErrorMessage="Email Must be entered"
                        ControlToValidate="TxtEmail" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
           </div>
            <div class="table5">            
                 <u><asp:Label ID="Label12" runat="server" Text="Login Details"></asp:Label></u>
                <table>
                <tr>
                    <td class="auto-style6"> <asp:Label ID="Label13" runat="server" Text="Username"></asp:Label></td>

                    <td class="auto-style6"><asp:TextBox ID="TxtUsername" runat="server" Width="222px" Height="26px"></asp:TextBox></td>
                    <td class="auto-style18" ><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                        ErrorMessage="Username Must be entered"
                        ControlToValidate="TxtUsername" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                    </tr>
                 <tr>
                     <td class="auto-style19"> <asp:Label ID="Label14" runat="server" Text="Password"></asp:Label></td>

                     <td class="auto-style19"><asp:TextBox ID="TxtPassword" runat="server" Width="220px" TextMode="Password"
                         Height="27px"></asp:TextBox></td>
                     <td class="auto-style20" ><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                         ErrorMessage="Password Must be entered"
                        ControlToValidate="TxtPassword" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                     
                </tr>
                <tr><td> <asp:Label ID="Label15" runat="server" Text="Comfirm Password"></asp:Label></td>
                        <td><asp:TextBox ID="TxtCpassword" runat="server" Width="219px" TextMode="Password" Height="28px"></asp:TextBox></td>
                    <td class="auto-style16" ><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                        ErrorMessage="Please Comfirm password"
                        ControlToValidate="TxtCpassword" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
                </tr>
             </table>
                
           </div><br />
        
<asp:Button ID="btnHotelSumbmit" runat="server" Text="Register" Width="628px" OnClick="btnHotelSumbmit_Click"  />
    </form>
</body>
</html>
