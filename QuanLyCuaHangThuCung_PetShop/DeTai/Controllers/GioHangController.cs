using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DeTai.Models;

namespace DeTai.Controllers
{
    public class GioHangController : Controller
    {
        dbQuanLyThuCungDataContext db = new dbQuanLyThuCungDataContext();
        //
        // GET: /GioHang/
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang==null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        public ActionResult ThemGiohang (string id, string URLstr)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sp = lstGioHang.Find(n => n.MASP == id);
            
            if (sp==null)
            {
                sp = new GioHang(id); 
                lstGioHang.Add(sp); 
                return Redirect(URLstr);
            }
            else
            {
                sp.SoLuong++; 
                return Redirect(URLstr);
            }
        }

        public ActionResult XoaGiohang(string id, string URLstr)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sp = lstGioHang.Single(n => n.MASP == id);
            if (sp != null)
            {
                lstGioHang.RemoveAll(n => n.MASP == id);
                return Redirect(URLstr);
            }
            else
            {
                return Redirect(URLstr);
            }
        }

        [HttpPost]
        public ActionResult SuaGiohang(string id, FormCollection f)
        {
            int amount = 0;
            try
            {
                amount = Int32.Parse(f["txtSoLuong"].ToString());
            }
            catch
            {
                return RedirectToAction("ShowGioHang");
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sp = lstGioHang.Single(n => n.MASP == id);
            if (sp != null)
            {
                sp.SoLuong = amount;
                return RedirectToAction("ShowGioHang");
            }
            else
            {
                return RedirectToAction("ShowGioHang");
            }
        }
        private int TongSoLuong()
        {
            int TongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>; 
            if(lstGioHang != null)
            {
                TongSoLuong = lstGioHang.Sum(n => n.SoLuong);
            }
            return TongSoLuong;
        }
        private double TongThanhTien() 
        {
            double TongThanhTien = 0; 
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>; 
            if (lstGioHang != null)
            {
                TongThanhTien = lstGioHang.Sum(n => n.ThanhTien);
            }
            return TongThanhTien;
        }
        public ActionResult ShowGioHang()
        {
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong(); 
            ViewBag.TongThanhTien = TongThanhTien(); 
            return View(lstGioHang);
        }
    }
}
