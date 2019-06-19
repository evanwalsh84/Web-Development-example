using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class CheckOut2 : System.Web.UI.Page
{
    CartItemList cart;
    string email;
    string cuscode;
    string invoiceNumber;
    string bobby;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.IsSecureConnection)
        {
            string url = Request.Url.ToString().Replace("http:", "https:");
            Response.Redirect(url);
        }

        cart = (CartItemList)Session["Cart"];
        email = (string)Session["Email"];
        if (!IsPostBack)
            this.LoadYears();
    }

    private void LoadYears()
    {
        int year = DateTime.Now.Year;
        for (int i = 0; i < 7; i++)
        {
            ddlYear.Items.Add(year.ToString());
            year += 1;
        }
    }

    protected void btnAccept_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            
            
            this.PutInvoice();
            this.GetCusCode();
            this.GetInvoiceNumber();
            this.PutLineItems();

            Session.Remove("Cart");
            Response.Redirect("Confirmation.aspx");
        }
    }

    private void PutInvoice()
    {
       
        SqlDataSource1.InsertParameters["cust_email"].DefaultValue = email;
        this.GetCusCode();
        SqlDataSource1.InsertParameters["cus_code"].DefaultValue = cuscode;
        SqlDataSource1.InsertParameters["inv_date"].DefaultValue = DateTime.Today.ToString();

        int quantity = this.Quantity();
        if (rdoGround.Checked)
        {
            SqlDataSource1.InsertParameters["shipMethod"].DefaultValue
                = "UPS Ground";
            double shipping = 3.95 + (quantity - 1) * 1.25;
            SqlDataSource1.InsertParameters["shipping"].DefaultValue
                = shipping.ToString();
        }
        else if (rdo2Day.Checked)
        {
            SqlDataSource1.InsertParameters["shipMethod"].DefaultValue
                = "UPS Second Day";
            double shipping = 7.95 + (quantity - 1) * 2.5;
            SqlDataSource1.InsertParameters["shipping"].DefaultValue
                = shipping.ToString();
        }
        else if (rdoFedEx.Checked)
        {
            SqlDataSource1.InsertParameters["shipMethod"].DefaultValue
                = "Federal Express";
            double shipping = 19.95 + (quantity - 1) * 4.95;
            SqlDataSource1.InsertParameters["shipping"].DefaultValue
                = shipping.ToString();
        }

        decimal subTotal = this.SubTotal();
        SqlDataSource1.InsertParameters["subtotal"].DefaultValue = subTotal.ToString();

        decimal salesTax = subTotal * (decimal)0.075;
        SqlDataSource1.InsertParameters["salesTax"].DefaultValue = salesTax.ToString();

        decimal total = subTotal + salesTax;
        SqlDataSource1.InsertParameters["total"].DefaultValue = total.ToString();
        SqlDataSource1.InsertParameters["creditCard"].DefaultValue = lstCardType.SelectedValue;
        SqlDataSource1.InsertParameters["cardNumber"].DefaultValue = txtCardNumber.Text;
        SqlDataSource1.InsertParameters["expirationMonth"].DefaultValue = ddlMonth.SelectedValue;
        SqlDataSource1.InsertParameters["expirationYear"].DefaultValue = ddlYear.SelectedValue;
        SqlDataSource1.Insert();
    }

    private int Quantity()
    {
        int quantity = 0;
        for (int i = 0; i < cart.Count; i++)
        {
            CartItem cartItem = cart[i];
            quantity += cartItem.Quantity;
        }
        return quantity;
    }

    private decimal SubTotal()
    {
        decimal subTotal = 0;
        for (int i = 0; i < cart.Count; i++)
        {
            CartItem cartItem = cart[i];
            subTotal += cartItem.Quantity * cartItem.Product.UnitPrice;
        }
        return subTotal;
    }

    private void GetCusCode()
    {
       /* string conString = ConfigurationManager.ConnectionStrings[
            "group5ConnectionString"].ConnectionString;
        SqlConnection group5ConnectionString =
            new SqlConnection(conString);
        SqlCommand invoiceNoCommand = 
            new SqlCommand("Select Ident_Current('Invoices') From Invoices", conHalloween);
        conHalloween.Open();
        invoiceNumber = invoiceNoCommand.ExecuteScalar().ToString();
        conHalloween.Close();*/

        SqlDataSource3.SelectParameters["Email"].DefaultValue = email;
        DataView dvInvoice = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        cuscode = dvInvoice[0][0].ToString();
        
    }
    private void GetInvoiceNumber()
    {
        /*string conString = ConfigurationManager.ConnectionStrings[
            "HalloweenConnectionString"].ConnectionString;
        SqlConnection conHalloween =
            new SqlConnection(conString);
        SqlCommand invoiceNoCommand = 
            new SqlCommand("Select Ident_Current('Invoices') From Invoices", conHalloween);
        conHalloween.Open();
        invoiceNumber = invoiceNoCommand.ExecuteScalar().ToString();
        conHalloween.Close();*/

        SqlDataSource4.SelectParameters["cust_email"].DefaultValue = email;
        DataView dvInvoice = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
        invoiceNumber = dvInvoice[0][0].ToString();
    }



    private void PutLineItems()
    {
        for (int i = 0; i < cart.Count; i++)
        {
            CartItem cartItem = cart[i];
            SqlDataSource2.InsertParameters["inv_number"].DefaultValue = invoiceNumber;
            SqlDataSource2.InsertParameters["prod_code"].DefaultValue = cartItem.Product.ProductID;
            SqlDataSource2.InsertParameters["line_price"].DefaultValue = cartItem.Product.UnitPrice.ToString();
            SqlDataSource2.InsertParameters["line_quantity"].DefaultValue = cartItem.Quantity.ToString();

            decimal ext = cartItem.Product.UnitPrice * cartItem.Quantity;
           // SqlDataSource2.InsertParameters["Extension"].DefaultValue = ext.ToString();
            SqlDataSource2.Insert();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("Cart");
        string url = "http:"
            + ConfigurationManager.AppSettings["AppPath"]
            + "Order.aspx";
        Response.Redirect(url);
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        string url = "http:"
            + ConfigurationManager.AppSettings["AppPath"]
            + "Order.aspx";
        Response.Redirect(url);
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}
