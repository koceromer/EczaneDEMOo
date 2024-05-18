using EczaneDEMOo.Models.Entities;
using EczaneDEMOo.Session;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;

namespace EczaneDEMOo.Controllers
{
    [CustomAuthorize(Role = "Yonetici")]
    public class YoneticiController : Controller
    {
        EczaneContext _context;
        public YoneticiController()
        {
            _context = new EczaneContext();
        }
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
    }
}