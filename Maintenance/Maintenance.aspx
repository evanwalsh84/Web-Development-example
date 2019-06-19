<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maintenance.aspx.cs" Inherits="Maintenance_Maintenance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Category Maintenance</title>
    <link href="../HomeStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="topBanner">
        <img alt="Game Jungle Banner" src="/images/BannerGJCopy.jpg" width="1000" height="200" />
    </div>

    <div class="topMenu">
        <ul>
            <li class="item1"><a href="../Default.aspx">Home</a></li>
            <li class="item2"><a href="../AboutUs.aspx">About Us</a></li>
            <li class="item3"><a href="../Products.aspx">Inventory</a></li>
            <li class="item4"><a href="../Cart.aspx">My Cart</a></li>
            <li class="item5"><a href="/MyAccount/MyAccount.aspx">My Account</a></li>
            <li class="item6"><a href="../ContactUs.aspx">Contact Us</a></li>
        </ul>
    </div>

    <form id="form1" runat="server">
        <div class="mainContentAlternate">
            <div id="page">
            <div id="mainContent">
                <h1>Game Jungle - Maintenance</h1>
                <p>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Category.aspx">Maintain Categories</asp:HyperLink>
                </p>
                <p>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="ProcessOrders.aspx">Process Orders</asp:HyperLink>
                </p>
                <p>
                    <asp:LoginName ID="LoginName1" runat="server" FormatString="You are logged in as: {0}" /><br />
                    If this isn't your correct user name, please&nbsp;
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Login.aspx">click here.</asp:HyperLink>
                </p>
                <p>
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                </p>
            </div>
            </div>
        </div>
    </form>
   
    <div class="footer">
        <p>Copyright 2016, Game Jungle, Registered trademarks belong to their respective owners.</p>
    </div>
</body>
</html>