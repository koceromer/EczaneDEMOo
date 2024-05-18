using EczaneDEMOo.Models.Entities;
using System.Linq;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class AccountController : Controller
    {
        EczaneContext _context;

        public AccountController()
        {
            _context = new EczaneContext();
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
            using (var context = new EczaneContext())
            {
                var kullanici = context.Kullanici.Where(k => k.kullaniciAd == kul.kullaniciAd && k.sifre == kul.sifre).SingleOrDefault();
                if (kullanici != null)
                {
                    if (kullanici.rolID == 1)
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
