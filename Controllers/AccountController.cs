using EczaneDEMOo.Models.Entities;
using System.Linq;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class AccountController : Controller
    {
        EczaneContext _context;// Veritabanı bağlamı için _context adında bir değişken

        public AccountController()// Kurucu metot
        {
            _context = new EczaneContext();// EczaneContext örneği oluşturuluyor
        }
        public ActionResult Index()
        {
            return RedirectToAction("Login");
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Kullanici kul)
        {
            using (var context = new EczaneContext())// Yeni bir EczaneContext örneği oluştur
            {
                // Kullanıcı adı ve şifreye göre Kullanici tablosundan bir kullanıcı getir
                var kullanici = context.Kullanici.Where(k => k.kullaniciAd == kul.kullaniciAd && k.sifre == kul.sifre).SingleOrDefault();
                if (kullanici != null)
                {
                    if (kullanici.rolID == 1)//rolüne göre sayfaya yönlendir
                    {
                        Session["Yonetici"] = kullanici;
                        
                        return RedirectToAction("Index", "Yonetici");
                    }
                    if (kullanici.rolID == 2)
                    {
                        Session["Kullanici"] = kullanici;
                        
                        return RedirectToAction("Index", "Anasayfa");
                    }
                }
            }
            ViewBag.Message = "Kullanıcı adı veya şifre hatalı";

            return View();

        }

        public ActionResult Logout()
        {
            HttpContext.Session.Clear(); 
            return RedirectToAction("Login", "Account"); 
        }

        //public ActionResult Cikis()
        //{
        //    Session.Clear(); // Oturum verilerini temizle
        //    Session.Abandon(); // Oturumu sonlandır
        //    return RedirectToAction("Index", "Login");
        //}

    }
}
