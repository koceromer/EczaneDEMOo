using EczaneDEMOo.Models;
using EczaneDEMOo.Models.Entities;
using EczaneDEMOo.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EczaneDEMOo.Controllers
{
    [CustomAuthorize(Role = "Kullanici")]

    public class SatisController : Controller
    {
        private readonly EczaneContext _context;

        public SatisController()
        {
            _context = new EczaneContext();
        }

        // GET: Satis
        public ActionResult Index()
        {
            var model = _context.Satis.ToList();
            return View(model);
        }

        public ActionResult RecetesizSatis()
        {
            #region Ilac Getirme
            List<SelectListItem> selectListItems = _context.Ilac.Select(f => new SelectListItem
            {
                Value = f.ilacID.ToString(),
                Text = f.ad
            }).ToList();

            SelectList selectList = new SelectList(selectListItems, "Value", "Text");

            ViewData["Ilac"] = selectList;
            #endregion
            return View();
        }

        // GET: ReceteNo
        [HttpGet]
        public ActionResult ReceteNoGir()
        {
            return View();
        }

        // POST: ReceteNo
        [HttpPost]
        public ActionResult ReceteNoGir(string receteNo)
        {
            if (!string.IsNullOrEmpty(receteNo))
            {
                // ReceteNo'ya ait bilgileri veritabanından alın
                var recete = _context.Recete.SingleOrDefault(r => r.receteNo == receteNo);
                if (recete != null)
                {
                    var model = new SatisReceteSatisViewModel
                    {
                        ReceteNo = recete.receteNo,
                        ReceteID = recete.receteID,
                        IlacID = recete.ilacID.Value,
                        Adet = recete.miktar.Value,
                        Fiyat = recete.Ilac.fiyat.Value
                    };

                    // Bilgi ve onay sayfasına yönlendir
                    return View("ReceteBilgiOnay", model);
                }

                ModelState.AddModelError("", "Geçerli bir reçete numarası bulunamadı.");
                return View();
            }

            ModelState.AddModelError("", "Reçete numarası boş olamaz.");
            return View();
        }

        // POST: Onayla
        [HttpPost]
        public ActionResult Onayla(SatisReceteSatisViewModel model)
        {
            if (ModelState.IsValid)
            {
                var recete = _context.Recete.Where(r => r.receteID == model.ReceteID).SingleOrDefault();
                // Satış işlemini veritabanına kaydet
                var satis = new Satis
                {
                    receteID = model.ReceteID,
                    ilacID = model.IlacID,
                    miktar = model.Adet,
                    fiyat = model.Fiyat * model.Adet,
                    satisTarih = DateTime.Now
                };

                _context.Satis.Add(satis);
                _context.SaveChanges();

                return RedirectToAction("SatisBasarili");
            }

            return View("ReceteBilgiOnay", model);
        }

        public ActionResult SatisBasarili()
        {
            return View();
        }

        // ReceteBilgiOnay görünümünü aynı şekilde bıraktık
        public ActionResult ReceteBilgiOnay()
        {
            return View();
        }

        public ActionResult Ilac()
        {

            return View();
        }

    }
}