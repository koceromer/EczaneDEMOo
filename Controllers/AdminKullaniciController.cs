using EczaneDEMOo.Models.Entities;
using EczaneDEMOo.Session;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EczaneDEMOo.Controllers
{
    [CustomAuthorize(Role = "Yonetici")]
    public class AdminKullaniciController : Controller
    {
        //Context Field
        EczaneContext _context;

        public AdminKullaniciController()
        {
            _context = new EczaneContext();
        }
        // GET: AdminKullanici
        public ActionResult Index()
        {
            // silindiMi alanı false olan tüm kullanıcıları getir ve model olarak view'e gönder
            var model = _context.Kullanici.Where(k => k.silindiMi == false).ToList();
            return View(model);
        }

        public ActionResult Ekle()// Ekle aksiyon metodu (GET isteği)
        {
            #region Rol Getirme
            // Kullanıcı rolleri getiriliyor ve SelectListItem nesnelerine dönüştürülüyor
            List<SelectListItem> selectListItems = _context.KullaniciRol.Select(f => new SelectListItem
            {
                Value = f.kullaniciRolID.ToString(),
                Text = f.ad
            }).ToList();

            // SelectList oluşturuluyor
            SelectList selectList = new SelectList(selectListItems, "Value", "Text");

            // Rol bilgisi ViewData'ya ekleniyor
            ViewData["Rol"] = selectList;
            #endregion

            // Yeni bir Kullanici nesnesi oluşturuluyor
            var model = new Kullanici();

            return View(model);
        }

        [HttpPost]
        public ActionResult Ekle(Kullanici kullanici)
        {
            if (ModelState.IsValid)// ModelState geçerli mi kontrolü
            {
                try
                {
                    using (var context = new EczaneContext())
                    {
                        // Yeni kullanıcı ekle ve değişiklikleri kaydet
                        context.Kullanici.Add(kullanici);
                        context.SaveChanges();
                    }
                    // Başarılı mesajını TempData'ya ekle
                    TempData["SuccessMessageEkleme"] = "Kullanıcı başarılı bir şekilde eklendi.";

                    
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    // Hata durumunda hatayı TempData'ya ekle
                    TempData["ErrorMessageEkleme"] = "Kullanıcı eklenirken bir hata oluştu: " + ex.Message;
                }
            }

            // Eğer model geçerli değilse veya işlem başarısız olursa, aynı sayfaya geri dönün
            return View(kullanici);
        }

        public ActionResult Duzenle(int id)
        {
            try
            {
                // Veritabanında kullanıcıyı bul
                var kullanici = _context.Kullanici.SingleOrDefault(k => k.kullaniciID == id);

                if (kullanici != null)
                {
                    #region Rol Getirme
                    // Kullanıcı rolleri getiriliyor ve SelectListItem nesnelerine dönüştürülüyor
                    List<SelectListItem> selectListItems = _context.KullaniciRol.Select(f => new SelectListItem
                    {
                        Value = f.kullaniciRolID.ToString(),
                        Text = f.ad
                    }).ToList();

                    // SelectList oluşturuluyor
                    SelectList selectList = new SelectList(selectListItems, "Value", "Text");

                    // Rol bilgisi ViewData'ya ekleniyor
                    ViewData["Rol"] = selectList;
                    #endregion

                    // Kullanıcıyı güncelleme sayfasına yönlendir
                    return View(kullanici);
                }
                // Kullanıcı bulunamadıysa hata mesajı göster
                TempData["ErrorMessage"] = "Kullanıcı bulunamadı.";

            }
            catch (Exception ex)
            {
                // Hata durumunda hata mesajını göster
                TempData["ErrorMessage"] = "Kullanıcı güncellenirken bir hata oluştu: " + ex.Message;
            }
            // Eğer ModelState geçerli değilse veya işlem başarısızsa aynı sayfaya dön
            return RedirectToAction("Index");

        }

        [HttpPost]
        public ActionResult Duzenle(int id, Kullanici model)
        {
            try
            {
                // Veritabanında kullanıcıyı bul
                var kullanici = _context.Kullanici.SingleOrDefault(k => k.kullaniciID == model.kullaniciID);

                if (kullanici is null)
                {
                    // Kullanıcı bulunamadıysa hata mesajı göster
                    TempData["ErrorMessage"] = "Kullanıcı bulunamadı.";
                    return View();
                }
                // Kullanıcıyı güncelle
                // 1. Adım: Veritabanı bağlamında (context) güncellenecek kullanıcıyı takip eden bir giriş (entry) nesnesi oluşturulur.
                var entry = _context.Entry(kullanici);
                // 2. Adım: Kullanıcının mevcut değerleri, güncelleme formundan gelen modelin değerleriyle değiştirilir.
                entry.CurrentValues.SetValues(model);
                // 3. Adım: Bu girişin (entry) durumunun (state) 'Modified' (değiştirildi) olarak işaretlenir, bu da Entity Framework'e bu nesnenin güncellenmesi gerektiğini belirtir.
                entry.State = EntityState.Modified;
                // 4. Adım: Veritabanına değişiklikleri kaydeder. Bu, kullanıcı bilgilerini veritabanında günceller.
                _context.SaveChanges();
                TempData["SuccesMessage"] = "Kullanıcı güncellenirken bir hata oluştu: ";

            }
            catch (Exception ex)
            {
                // Hata durumunda hata mesajını göster
                TempData["ErrorMessage"] = "Kullanıcı güncellenirken bir hata oluştu: " + ex.Message;
            }


            // Eğer ModelState geçerli değilse veya işlem başarısızsa aynı sayfaya dön
            return RedirectToAction("Index");

        }

        public ActionResult Sil(int id)
        {
            // Verilen id'ye sahip kullanıcıyı veritabanından getir
            var kullanici = _context.Kullanici.Where(k => k.kullaniciID == id).SingleOrDefault();

            // Kullanıcı bulunduysa, silindiMi alanını true yap
            kullanici.silindiMi = true;
            _context.SaveChanges();

            // Başarılı mesajını TempData'ya ekle
            TempData["SuccessMessage"] = "Kullanıcı başarılı bir şekilde silindi.";

            return RedirectToAction("Index");
        }
    }
}