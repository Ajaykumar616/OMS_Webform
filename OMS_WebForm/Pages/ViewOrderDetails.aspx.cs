using Newtonsoft.Json;
using OMS_WebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMS_WebForm.Pages
{
    public partial class ViewOrderDetails : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderIdParam = Request.QueryString["orderId"];
                if (int.TryParse(orderIdParam, out int orderId))
                {
                    await LoadOrderItems(orderId);
                    await LoadStatusHistory(orderId);
                    await LoadPayments(orderId);
                    await LoadShipping(orderId);
                }
                else
                {
                    Response.Write("Invalid OrderId.");
                }

            }
        }
        private HttpClient CreateHttpClient()
        {
            var client = new HttpClient();
            var token = Request.Cookies["AuthToken"]?.Value;
            if (string.IsNullOrEmpty(token))
            {
                Response.Redirect("~/Pages/Login.aspx");
                return null;
            }
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            client.BaseAddress = new Uri("https://localhost:7264/");
            return client;
        }


        private async Task LoadOrderItems(int orderId)
        {
            using (var client = new HttpClient())
            {
                var token = Request.Cookies["AuthToken"]?.Value;
                if (string.IsNullOrEmpty(token))
                {
                    Response.Redirect("~/Pages/Login.aspx");
                    return;
                }
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                client.BaseAddress = new Uri("https://localhost:7264/");
                var response = await client.GetAsync($"api/OrderItems/{orderId}");

                if (response.IsSuccessStatusCode)
                {
                    var json = await response.Content.ReadAsStringAsync();
                    var items = JsonConvert.DeserializeObject<List<OrderItem>>(json);

                    gvOrderItems.DataSource = items;
                    gvOrderItems.DataBind();

                    // Set Metadata
                    lblOrderId.Text = orderId.ToString();

                    // Calculate Total
                    decimal total = items.Sum(i => i.TotalPrice);
                    lblGrandTotal.Text = total.ToString("C");
                }
                else
                {
                    Response.Write("Failed to load order items.");
                }
            }
        }
        private async Task LoadStatusHistory(int orderId)
        {
            using (var client = CreateHttpClient())
            {
                if (client == null)
                    return;
                var response = await client.GetAsync($"api/OrderStatus/{orderId}");
                if (response.IsSuccessStatusCode)
                {
                    var json = await response.Content.ReadAsStringAsync();
                    var history = JsonConvert.DeserializeObject<List<OrderStatusHistory>>(json); gvStatusHistory.DataSource = history;
                    gvStatusHistory.DataBind();
                }
                else
                {
                    lblError.Text = $"Failed to load status history: {response.StatusCode}";
                    lblError.Visible = true;
                }
            }
        }
        private async Task LoadPayments(int orderId)
        {
            using (var client = CreateHttpClient())
            {
                if (client == null) return;
                var response = await client.GetAsync($"api/Payment/{orderId}");
                if (response.IsSuccessStatusCode)
                {
                    var json = await response.Content.ReadAsStringAsync();
                    var payments = JsonConvert.DeserializeObject<List<PaymentReference>>(json); gvPayments.DataSource = payments;
                    gvPayments.DataBind();
                }
                else
                {
                    lblError.Text = $"Failed to load payments: {response.StatusCode}";
                    lblError.Visible = true;
                }
            }
        }

        private async Task LoadShipping(int orderId)
        {
            using (var client = CreateHttpClient())
            {
                if (client == null)
                    return;
                var response = await client.GetAsync($"api/ShippingReference/{orderId}");
                if (response.IsSuccessStatusCode)
                {
                    var json = await response.Content.ReadAsStringAsync();
                    var shipping = JsonConvert.DeserializeObject<List<ShippingReference>>(json); gvShipping.DataSource = shipping; gvShipping.DataBind();
                }
                else 
                {
                    lblError.Text = $"Failed to load shipping: {response.StatusCode}";
                    lblError.Visible = true;
                }

            }
        }



    }
}