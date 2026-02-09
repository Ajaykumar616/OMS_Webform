using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using OMS_WebForm.Models;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMS_WebForm.Pages
{
    public partial class Orders : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadOrders();
            }
        }

        private async Task LoadOrders()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7264/");
                var token = Request.Cookies["AuthToken"]?.Value;
                if (string.IsNullOrEmpty(token))
                {
                    Response.Redirect("~/Pages/Login.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;
                }
                client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                var response = await client.GetAsync("api/Orders");


                if (response.IsSuccessStatusCode)
                {
                    var json = await response.Content.ReadAsStringAsync();
                    var orders = JsonConvert.DeserializeObject<List<Orderse>>(json);
                    gvorders.DataSource = orders;
                    gvorders.DataBind();
                }
                else
                {
                    lblMessage.Text = "Error loading orders. Unauthorized or invalid token.";
                    lblMessage.Visible = true;
                }
            }
        }


    }
}
