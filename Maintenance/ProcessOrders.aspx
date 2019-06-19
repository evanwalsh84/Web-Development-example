<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProcessOrders.aspx.cs" Inherits="Maintenance_ProcessOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Process Orders</title>
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
        
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="inv_number" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC; ">
                        <td>
                            <asp:Label ID="inv_numberLabel" runat="server" Text='<%# Eval("inv_number") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cus_codeLabel" runat="server" Text='<%# Eval("cus_code") %>' />
                        </td>
                        <td>
                            <asp:Label ID="inv_dateLabel" runat="server" Text='<%# Eval("inv_date") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C; color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="inv_numberLabel1" runat="server" Text='<%# Eval("inv_number") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="cus_codeTextBox" runat="server" Text='<%# Bind("cus_code") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="inv_dateTextBox" runat="server" Text='<%# Bind("inv_date") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="cus_codeTextBox" runat="server" Text='<%# Bind("cus_code") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="inv_dateTextBox" runat="server" Text='<%# Bind("inv_date") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC; color: #000000;">
                        <td>
                            <asp:Label ID="inv_numberLabel" runat="server" Text='<%# Eval("inv_number") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cus_codeLabel" runat="server" Text='<%# Eval("cus_code") %>' />
                        </td>
                        <td>
                            <asp:Label ID="inv_dateLabel" runat="server" Text='<%# Eval("inv_date") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC; color: #000000;">
                                        <th runat="server">inv_number</th>
                                        <th runat="server">cus_code</th>
                                        <th runat="server">inv_date</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C; font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Label ID="inv_numberLabel" runat="server" Text='<%# Eval("inv_number") %>' />
                        </td>
                        <td>
                            <asp:Label ID="cus_codeLabel" runat="server" Text='<%# Eval("cus_code") %>' />
                        </td>
                        <td>
                            <asp:Label ID="inv_dateLabel" runat="server" Text='<%# Eval("inv_date") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" SelectCommand="SELECT inv_number,cus_code,inv_date FROM invoice" UpdateCommand="UPDATE invoice SET inv_number = @inv_number, cus_code = @cus_code, inv_date= @inv_date WHERE inv_number = @inv_number">
                    <UpdateParameters>
                        <asp:Parameter Name="inv_number" />
                        <asp:Parameter Name="cus_code" />
                        <asp:Parameter Name="inv_date" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        <div class="footer">
            <p>Copyright 2016, Game Jungle, Registered trademarks belong to their respective owners.</p>
        </div>
    </div>
    </form>
</body>
</html>
