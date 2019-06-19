<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut1.aspx.cs" Inherits="CheckOut1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Game Jungle Checkout</title>
    <link href="HomeStyle.css" rel="stylesheet" type="text/css" />
    <link href="Styles/CheckOut1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="topBanner">
        <img alt="Game Jungle Banner" src="images/BannerGJCopy.jpg" width="1000" height="200" />
    </div>

    <div class="topMenu">
        <ul>
            <li class="item1"><a href="Default.aspx">Home</a></li>
            <li class="item2"><a href="AboutUs.aspx">About Us</a></li>
            <li class="item3"><a href="Products.aspx">Inventory</a></li>
            <li class="item4"><a href="Cart.aspx">My Cart</a></li>
            <li class="item5"><a href="/MyAccount/MyAccount.aspx">My Account</a></li>
            <li class="item6"><a href="ContactUs.aspx">Contact Us</a></li>
        </ul>
    </div>

    <form id="form1" runat="server">

    <div id="page">
        <div class="mainContentAlternate">
            <p>Please enter the following information:</p>
            <p class="label">Email:</p>
            <p class="entry">
                <asp:TextBox ID="txtEmail" runat="server" Width="150px" MaxLength="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is a required field." CssClass="validator"></asp:RequiredFieldValidator>
            </p>
            <p class="label">First name:</p>
            <p class="entry">
                <asp:TextBox ID="txtFirstName" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName"
                    ErrorMessage="First name is a required field." CssClass="validator"></asp:RequiredFieldValidator>
            </p>
            <p class="label">Last name:</p>
            <p class="entry">
                <asp:TextBox ID="txtLastName" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName"
                    ErrorMessage="Last name is a required field." CssClass="validator"></asp:RequiredFieldValidator>
            </p>
            <p class="label">Address:</p>
            <p class="entry">
                <asp:TextBox ID="txtAddress" runat="server" Width="250px" MaxLength="40"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Address is a required field." CssClass="validator"></asp:RequiredFieldValidator>
            </p>
            <p class="label">City:</p>
            <p class="entry">
                <asp:TextBox ID="txtCity" runat="server" Width="180px" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCity"
                    ErrorMessage="City is a required field." CssClass="validator"></asp:RequiredFieldValidator>
            </p>
            <p class="label">State:</p>
            <p class="entry">
                <asp:TextBox ID="txtState" runat="server" Width="25px" MaxLength="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtState"
                    ErrorMessage="State is a required field." CssClass="validator"></asp:RequiredFieldValidator>
            </p>
            <p class="label">Zip code:</p>
            <p class="entry">
                <asp:TextBox ID="txtZipCode" runat="server" Width="75px" MaxLength="9"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtZipCode"
                    ErrorMessage="Zip code is a required field." CssClass="validator"></asp:RequiredFieldValidator>
            </p>
            <p class="label">Phone:</p>
            <p class="entry">
                <asp:TextBox ID="txtPhone" runat="server" Width="150px" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPhone"
                    Display="Dynamic" ErrorMessage="Phone is a required field." CssClass="validator"></asp:RequiredFieldValidator>
            </p>
   
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" 
                DeleteCommand="DELETE FROM [customer] WHERE [Email] = ?" 
                InsertCommand="INSERT INTO [customer] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (@Email, @LastName, @FirstName, @Address, @City, @State, @ZipCode, @PhoneNumber)" 
                SelectCommand="SELECT cus_code, LastName, FirstName, cus_initial, Address, ZipCode, State, PhoneNumber, Email, City FROM customer WHERE (Email = @Email)" 
                UpdateCommand="UPDATE [customer] SET [LastName] = ?, [FirstName] = ?, [Address] = ?, [Cty] = ?, [State] = ?, [ZipCode] = ?, [phoneNumber] = ? WHERE [Email] = ?">
                <InsertParameters>
                    <asp:Parameter Name="Email" />
                    <asp:Parameter Name="LastName" />
                    <asp:Parameter Name="FirstName" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="City" />
                    <asp:Parameter Name="State" />
                    <asp:Parameter Name="ZipCode" />
                    <asp:Parameter Name="PhoneNumber" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="Email" />
                </SelectParameters>
            </asp:SqlDataSource>
            <p id="buttons">
                <asp:Button ID="btnCheckOut" runat="server" Text="Continue Checkout" 
                    onclick="btnCheckOut_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                    CausesValidation="False" onclick="btnCancel_Click" />
                <asp:Button ID="btnContinue" runat="server"
                    Text="Continue Shopping" CausesValidation="False" 
                    onclick="btnContinue_Click" />
            </p>
        </div>
    </div>
    </form>
    
    <div class="footer">
        <p>Copyright 2016, Game Jungle, Registered trademarks belong to their respective owners.</p>
    </div>
</body>
</html>
