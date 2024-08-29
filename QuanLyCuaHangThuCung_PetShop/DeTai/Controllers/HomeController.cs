using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DeTai.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LienHe()
        {
            return View();
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        public ActionResult DangKy()
        {
            return View();
        }    
    }
}
