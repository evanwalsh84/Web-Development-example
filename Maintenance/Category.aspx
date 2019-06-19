<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="_Category" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Game Jungle-Category Maintenance</title>
    <link href="../HomeStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="topBanner">
        <img alt="Game Jungle Banner" src="/images/BannerGJCopy.jpg" width="1000" height="200" />
    </div>

    <div class="topMenu">
        <ul>
            <li class="item1"><a href="../Default.aspx">Home</a></li>
            <li class="item2"><a href="../AboutUs.aspx">About Us</a></li>
            <li class="item3"><a href="../Products.aspx">Inventory</a></li>
            <li class="item4"><a href="../Cart.aspx">My Cart</a></li>
            <li class="item5"><a href="../MyAccount/MyAccount.aspx">My Account</a></li>
            <li class="item6"><a href="../ContactUs.aspx">Contact Us</a></li>
        </ul>
    </div>
    <div id="page">
        <div id="header">
        </div>
        <div id="main">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="videoGame_ID" 
                DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" 
                onitemdeleted="ListView1_ItemDeleted" oniteminserted="ListView1_ItemInserted" 
                onitemupdated="ListView1_ItemUpdated">
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                        <th runat="server"></th>
                                        <th runat="server">prod_name</th>
                                        <th runat="server">videoGame_ID</th>
                                        <th runat="server">releaseDate</th>
                                        <th runat="server">rating</th>
                                        <th runat="server">category</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr style="background-color: #DCDCDC; color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="prod_nameLabel" runat="server" 
                                Text='<%# Eval("prod_name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="videoGame_IDLabel" runat="server" 
                                Text='<%# Eval("videoGame_ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="releaseDateLabel" runat="server" 
                                Text='<%# Eval("releaseDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' />
                        </td>
                        <td>
                            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="prod_nameLabel" runat="server" 
                                Text='<%# Eval("prod_name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="videoGame_IDLabel" runat="server" 
                                Text='<%# Eval("videoGame_ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="releaseDateLabel" runat="server" 
                                Text='<%# Eval("releaseDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' />
                        </td>
                        <td>
                            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #008A8C; color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="prod_nameTextBox" runat="server" Text='<%# Bind("prod_name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="videoGame_IDLabel1" runat="server" Text='<%# Eval("videoGame_ID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="releaseDateTextBox" runat="server" 
                                Text='<%# Bind("releaseDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                        </td>
                        <td>
                            <asp:TextBox ID="prod_nameTextBox" runat="server" 
                                Text='<%# Bind("prod_name") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="videoGame_IDTextBox" runat="server" 
                                Text='<%# Bind("videoGame_ID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="releaseDateTextBox" runat="server" 
                                Text='<%# Bind("releaseDate") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>
                                No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="prod_nameLabel" runat="server" Text='<%# Eval("prod_name") %>' />
                        </td>
                        <td>
                            <asp:Label ID="videoGame_IDLabel" runat="server" Text='<%# Eval("videoGame_ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="releaseDateLabel" runat="server" Text='<%# Eval("releaseDate") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' />
                        </td>
                        <td>
                            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <a href="Category.aspx"></a><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" DeleteCommand="DELETE FROM videoGames WHERE (videoGame_ID = @videoGame_ID)" InsertCommand="INSERT INTO videoGames(releaseDate, rating, category) VALUES (@releaseDate, @rating, @category)" SelectCommand="SELECT prod_name, videoGame_ID, releaseDate, rating, category FROM videoGames, product
WHERE videoGames.prod_code = product.prod_code
 ORDER BY videoGame_ID" UpdateCommand="UPDATE videoGames SET releaseDate = @releaseDate, rating = @rating, category = @category WHERE (videoGame_ID = @videoGame_ID)">
                <DeleteParameters>
                    <asp:Parameter Name="videoGame_ID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="releaseDate" />
                    <asp:Parameter Name="rating" />
                    <asp:Parameter Name="category" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="releaseDate" />
                    <asp:Parameter Name="rating" />
                    <asp:Parameter Name="category" />
                    <asp:Parameter Name="videoGame_ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                HeaderText="Please correct the following errors:" 
                ValidationGroup="Edit" CssClass="error" />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                HeaderText="Please correct the following errors:" 
                ValidationGroup="Insert" CssClass="error" />
            <p>
                <asp:Label ID="lblError" runat="server" 
                    EnableViewState="False" CssClass="error"></asp:Label>
            </p>
        </div>
        <div class="footer">
            <p>Copyright 2016, Game Jungle, Registered trademarks belong to their respective owners.</p>
        </div>  
    </div>
    </form>
</body>
</html>