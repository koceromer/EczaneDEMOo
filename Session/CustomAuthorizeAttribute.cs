using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EczaneDEMOo.Session
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        public string Role { get; set; }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext.Session["Kullanici"] != null && Role == "Kullanici")
            {
                return true;
            }
            else if (httpContext.Session["Yonetici"] != null && Role == "Yonetici")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

}