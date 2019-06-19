<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut2.aspx.cs" Inherits="CheckOut2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Game Jungle Payment</title>
    <link href="HomeStyle.css" rel="stylesheet" type="text/css" />
    <link href="Styles/CheckOut2.css" rel="stylesheet" type="text/css" />
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
            <p class="bold">Shipping method:</p>
            <asp:RadioButton ID="rdoGround" runat="server" Checked="True" Text="UPS Ground" 
                GroupName="Shipping" /><br />
            <asp:RadioButton ID="rdo2Day" runat="server" Text="UPS Second Day" 
                GroupName="Shipping" /><br />
            <asp:RadioButton ID="rdoFedEx" runat="server" Text="Federal Express Overnight" 
                GroupName="Shipping" /><br />
            <p class="bold">Payment information:</p>
            <div id="payment">
                <div id="CC1">
                    <asp:ListBox ID="lstCardType" runat="server" Width="150px">
                        <asp:ListItem Selected="True" Value="None">--Select a credit card--</asp:ListItem>
                        <asp:ListItem>VISA</asp:ListItem>
                        <asp:ListItem Value="MC">MasterCard</asp:ListItem>
                        <asp:ListItem Value="AMEX">American Express</asp:ListItem>
                    </asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lstCardType"
                        Display="None" ErrorMessage="You must select a credit card." InitialValue="None" CssClass="validator">*
                    </asp:RequiredFieldValidator>
                </div>
                <div id="CC2">
                    <p class="label">Number:</p>
                    <p class="entry">
                        <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="20" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCardNumber"
                            ErrorMessage="Credit card number is required." Display="None" CssClass="validator">*</asp:RequiredFieldValidator>
                    </p>
                    <p class="label">Expiration date:</p>
                    <p class="entry">
                        <asp:DropDownList ID="ddlMonth" runat="server" Width="88px">
                            <asp:ListItem Value="1">January</asp:ListItem>
                            <asp:ListItem Value="2">February</asp:ListItem>
                            <asp:ListItem Value="3">March</asp:ListItem>
                            <asp:ListItem Value="4">April</asp:ListItem>
                            <asp:ListItem Value="5">May</asp:ListItem>
                            <asp:ListItem Value="6">June</asp:ListItem>
                            <asp:ListItem Value="7">July</asp:ListItem>
                            <asp:ListItem Value="8">August</asp:ListItem>
                            <asp:ListItem Value="9">September</asp:ListItem>
                            <asp:ListItem Value="10">October</asp:ListItem>
                            <asp:ListItem Value="1">November</asp:ListItem>
                            <asp:ListItem Value="12">December</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlYear" runat="server" Width="58px">
                        </asp:DropDownList>
                    </p>
                </div>
            </div>
            <div id="errors">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" 
                    InsertCommand="INSERT INTO [invoice]([cus_code], [cust_email],[inv_date], [subtotal], [shipMethod], [shipping], [salesTax], [total], [creditCard], [cardNumber], [expirationMonth], [expirationYear]) VALUES (@cus_code, @cust_email,@inv_date, @subtotal, @shipMethod, @shipping, @salesTax, @total, @creditCard, @cardNumber, @expirationMonth, @expirationYear)" OnSelecting="SqlDataSource1_Selecting"
                    >
                    <InsertParameters>
                        <asp:Parameter Name="cus_code" type="Int32"/>
                        <asp:Parameter Name="cust_email" />
                        <asp:Parameter Name="inv_date" />
                        <asp:Parameter Name="subtotal" />
                        <asp:Parameter Name="shipMethod" />
                        <asp:Parameter Name="shipping" />
                        <asp:Parameter Name="salesTax" />
                        <asp:Parameter Name="total" />
                        <asp:Parameter Name="creditCard" />
                        <asp:Parameter Name="cardNumber" />
                        <asp:Parameter Name="expirationMonth" />
                        <asp:Parameter Name="expirationYear" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" 
                    InsertCommand="INSERT INTO line(inv_number, prod_code, line_price, line_unit, line_quantity) VALUES (@inv_number, @prod_code, @line_price, @line_unit, @line_quantity)"
                    >
                    <InsertParameters>
                        <asp:Parameter Name="inv_number" />
                        <asp:Parameter Name="prod_code" />
                        <asp:Parameter Name="line_price" />
                        <asp:Parameter Name="line_unit" />
                        <asp:Parameter Name="line_quantity" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" SelectCommand="SELECT  MAX(cus_code) FROM [customer] WHERE ([Email]=@email)">
                    <SelectParameters>
                        <asp:Parameter Name="email" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" SelectCommand="SELECT MAX([inv_number]) FROM [invoice] WHERE ([cust_email] = @cust_email)">
                    <SelectParameters>
                        <asp:Parameter Name="cust_email" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following errors:" 
                    CssClass="validator" />
            </div>
    
        <p id="buttons">
            <asp:Button ID="btnAccept" runat="server" Text="Accept Order" 
                onclick="btnAccept_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                CausesValidation="False" onclick="btnCancel_Click" />
            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" 
                CausesValidation="False" onclick="btnContinue_Click" />
        </p>
        </div>
    </div>
    </form>

    <div class="footer">
        <p>Copyright 2016, Game Jungle, Registered trademarks belong to their respective owners.</p>
    </div>
</body>
</html>