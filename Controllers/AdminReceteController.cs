using EczaneDEMOo.Models.Entities;
using EczaneDEMOo.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EczaneDEMOo.Controllers
{
    [CustomAuthorize(Role = "Yonetici")]
    public class AdminReceteController : Controller
    {
        EczaneContext _context;

        public AdminReceteController()
        {
            _context = new EczaneContext();
        }
        // GET: AdminSatis
        public ActionResult Index()
        {
            var model = _context.Recete.ToList();
            return View(model);
        }
    }
}