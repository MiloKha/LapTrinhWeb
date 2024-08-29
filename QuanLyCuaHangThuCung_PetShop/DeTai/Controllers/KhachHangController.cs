using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DeTai.Models;

namespace DeTai.Controllers
{
     public class KhachHangController : Controller
    {
        //
        // GET: /KhachHang/
        QUANLYTHUCUNGEntities db = new QUANLYTHUCUNGEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DS_KhachHang2()
        {
            return View(db.KHACHHANGs.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(KHACHHANG kh)
        {
            if (ModelState.IsValid)
            {
                db.KHACHHANGs.Add(kh);
                db.SaveChanges();
                return RedirectToAction("DS_KhachHang2");
            }
            return View(kh);
        }
        public ActionResult Edit(int id)
        {
            KHACHHANG kh = db.KHACHHANGs.Single(k => k.MAKH == id);
            if(kh==null)
            {
                return HttpNotFound();
            }
            return View(kh);
        }
        [HttpPost]
        public ActionResult Edit (KHACHHANG kh)
        {
            if(ModelState.IsValid)
            {
                db.KHACHHANGs.Attach(kh);
                db.Entry(kh).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("DS_KhachHang2", "KhachHang");
            }
            return View(kh);
        }
        public ActionResult Delete(int id)
        {
            KHACHHANG kh = db.KHACHHANGs.Single(k => k.MAKH == id);
            if (kh == null)
            {
                return HttpNotFound();
            }
            return View(kh);
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteKH(int id)
        {
            KHACHHANG kh = db.KHACHHANGs.Single(k => k.MAKH == id);
            if (kh == null)
            {
                return HttpNotFound();
            }
            db.Entry(kh).State = System.Data.Entity.EntityState.Deleted;
            db.SaveChanges();
            return RedirectToAction("DS_KhachHang2", "KhachHang");
        }

    }
}
