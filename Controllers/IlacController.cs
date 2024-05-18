using EczaneDEMOo.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EczaneDEMOo.Controllers
{
    [CustomAuthorize(Role = "Kullanici")]

    public class IlacController : Controller
    {
        // GET: Ilac
        public ActionResult Index()
        {
            return View();
        }
    }
}