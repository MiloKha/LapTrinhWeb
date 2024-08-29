using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DeTai.Models;

namespace DeTai.Controllers
{
    public class ThuCungController : Controller
    {
        dbQuanLyThuCungDataContext db = new dbQuanLyThuCungDataContext();
        //
        // GET: /ThuCung/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DS_ThuCung()
        {
            var listTC = db.THU_CUNGs.Take(5).OrderBy(tc => tc.TENTHUCUNG).ToList();
            return View(listTC);
        }
        public ActionResult ChiTietTC(string id)
        {
            using (dbQuanLyThuCungDataContext db = new dbQuanLyThuCungDataContext())
            {
                var detail_item = db.THU_CUNGs.Where(s => s.MATHUCUNG == id).FirstOrDefault();
                var detail_cttc = db.CHITIETTHUCUNGs.Where(n => n.MATHUCUNG == detail_item.MATHUCUNG).FirstOrDefault();
                ViewBag.NAMECTTC = detail_cttc;
                return View(detail_item);
            }
        }
    }
}
