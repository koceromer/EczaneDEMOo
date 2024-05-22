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
            var model = _context.Satis.ToList();// Tüm satışları getirir ve listeye dönüştürür
            return View(model);
        }

        public ActionResult RecetesizSatis()
        {
            #region Ilac Getirme
            // İlaçları getir ve SelectListItem nesnelerine dönüştür
            List<SelectListItem> selectListItems = _context.Ilac.Select(f => new SelectListItem
            {
                Value = f.ilacID.ToString(),
                Text = f.ad
            }).ToList();

            // SelectList oluşturuluyor

            SelectList selectList = new SelectList(selectListItems, "Value", "Text");

            // İlaç bilgisi ViewData'ya ekleniyor
            ViewData["Ilac"] = selectList;
            #endregion
            return View();// RecetesizSatis view'ını döner
        }

        // GET: ReceteNo
        [HttpGet]
        public ActionResult ReceteNoGir()
        {
            return View();
        }

        // POST: ReceteNo
        [HttpPost]
        public ActionResult ReceteNoGir(string receteNo)// ReceteNoGir aksiyon metodu, string parametre alır
        {
            if (!string.IsNullOrEmpty(receteNo))// Reçete numarası boş değilse
            {
                // ReceteNo'ya ait bilgileri veritabanından alın
                var recete = _context.Recete.SingleOrDefault(r => r.receteNo == receteNo);
                if (recete != null)// Reçete bulunursa
                {
                    var model = new SatisReceteSatisViewModel
                    {
                        ReceteNo = recete.receteNo,// Reçetenin numarası (receteNo) modelin ReceteNo alanına atanıyor
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
            if (ModelState.IsValid)// ModelState geçerli mi kontrolü
            {
                var recete = _context.Recete.Where(r => r.receteID == model.ReceteID).SingleOrDefault();
                // Satış işlemini veritabanına kaydet
                // Yeni bir Satis nesnesi oluştur ve modelden gelen verilerle doldur
                var satis = new Satis
                {
                    receteID = model.ReceteID,// Modelden gelen ReceteID'yi ata
                    ilacID = model.IlacID,
                    miktar = model.Adet,
                    fiyat = model.Fiyat * model.Adet,
                    satisTarih = DateTime.Now
                };

                _context.Satis.Add(satis);// Yeni satış ekle
                _context.SaveChanges();// Değişiklikleri kaydet

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