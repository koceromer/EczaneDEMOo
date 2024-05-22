using EczaneDEMOo.Models.Entities;
using EczaneDEMOo.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EczaneDEMOo.Controllers
{
    [CustomAuthorize(Role = "Yonetici")]// Bu controller'ı sadece 'Yonetici' rolüne sahip kullanıcıların erişebilmesi için yetkilendirir
    public class AdminIlacController : Controller
    {
        EczaneContext _context;

        public AdminIlacController()
        {
            _context = new EczaneContext();
        }
        // GET: Ilac
        public ActionResult Index()
        {
            // silindiMi alanı false olan tüm ilaçları getir ve model olarak view'e gönder
            var model = _context.Ilac.Where(i => i.silindiMi == false).ToList();
            return View(model);
        }


        public ActionResult Sil(int id) 
        {
            // Verilen id'ye sahip ilacı veritabanından getir
            var ilac = _context.Ilac.Where(k => k.ilacID == id).SingleOrDefault();

            ilac.silindiMi = true;
            _context.SaveChanges();

            // Başarılı mesajını TempData'ya ekle
            TempData["SuccessMessage"] = "İlac başarılı bir şekilde silindi.";
            return RedirectToAction("Index");
        }
    }
}