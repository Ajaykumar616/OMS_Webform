using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OMS_WebForm.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            var token = Session["AuthToken"] as string; 
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["AuthToken"] != null)
            {
                var cookie = new HttpCookie("AuthToken")
                {
                    Expires = DateTime.Now.AddDays(-1),
                    HttpOnly = true,
                    Secure = true,
                    SameSite = SameSiteMode.Strict,
                    Path = "/",
                    Domain = Request.Url.Host
                };
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("~/Pages/Login.aspx");
        }



    }
}