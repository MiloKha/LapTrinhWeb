using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DeTai.Models;

namespace DeTai.Controllers
{
    public class SanPhamController : Controller
    {
        dbQuanLyThuCungDataContext db = new dbQuanLyThuCungDataContext();
        //
        // GET: /SanPham/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DS_SanPham()
        {
            var listSP = db.SANPHAMs.Take(6).OrderBy(sp => sp.TENSP).ToList();
            return View(listSP);
        }
        public ActionResult ChiTietSP(string id)
        {
            using (dbQuanLyThuCungDataContext db = new dbQuanLyThuCungDataContext())
            {
                var detail_item = db.SANPHAMs.Where(s => s.MASP == id).FirstOrDefault();
                var detail_ctsp = db.CHITIETSANPHAMs.Where(n => n.MASP == detail_item.MASP).FirstOrDefault();
                ViewBag.NAMECTSP = detail_ctsp;
                return View(detail_item);
            }
        }
    }
}
