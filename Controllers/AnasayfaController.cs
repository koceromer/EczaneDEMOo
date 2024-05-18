using EczaneDEMOo.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EczaneDEMOo.Controllers
{
    [CustomAuthorize(Role = "Kullanici")]

    public class AnasayfaController : Controller
    {
        // GET: Anasayfa
        public ActionResult Index()
        {
            return View();
        }
    }
}