using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMS_WebForm.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }


        protected async void btnLogin_Click(object sender, EventArgs e)
        {
            var username = txtUsername.Text.Trim();
            var password = txtPassword.Text.Trim();
            var token = await AuthenticateUser(username, password);
            if (!string.IsNullOrEmpty(token))
            {
                var cookie = new HttpCookie("AuthToken", token)
                {
                    HttpOnly = true,
                    Secure = true,
                    SameSite = SameSiteMode.Strict,
                    Path = "/",
                    Domain = Request.Url.Host,
                    Expires = DateTime.Now.AddHours(1) // ✅ make it persistent
                };
                Response.Cookies.Add(cookie);
                Response.Redirect("Dashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                lblMessage.Text = "Invalid login.";
                lblMessage.Visible = true;
            }
        }

        public class LoginResponse
        {
            [JsonProperty("token")]
            public string Token { get; set; }
        }
        private async Task<string> AuthenticateUser(string username, string password)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7264/");
                var loginRequest = new { Username = username, Password = password };
                var response = await client.PostAsJsonAsync("api/login", loginRequest);
                if (!response.IsSuccessStatusCode)
                    return null;
                var json = await response.Content.ReadAsStringAsync();
                var result = JsonConvert.DeserializeObject<LoginResponse>(json);
                return result?.Token;

            }
        }
        //protected void Logout_Click(object sender, EventArgs e)
        //{
        //    // Clear session
        //    if (Request.Cookies["AuthToken"] != null)
        //    {
        //        var cookie = new HttpCookie("AuthToken")
        //        {
        //            Expires = DateTime.Now.AddDays(-1),
        //            HttpOnly = true,
        //            Secure = true,
        //            SameSite = SameSiteMode.Strict,
        //            Path = "/", 
        //            Domain = Request.Url.Host 
                   
        //        };
              
        //        Response.Cookies.Add(cookie);
        //    }
        //    Response.Redirect("~/Pages/Login.aspx");
        //}



    }
}