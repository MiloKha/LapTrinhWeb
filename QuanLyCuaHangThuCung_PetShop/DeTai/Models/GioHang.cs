using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DeTai.Models
{
    public class GioHang
    {
        dbQuanLyThuCungDataContext db = new dbQuanLyThuCungDataContext();
        public string MASP { get; set; }
        public string TENSP { get; set; }
        public string HINHSP { get; set; }
        public int ThanhTien { get; set; }
        public int SoLuong { get; set; }
        public double TongTien
        {
            get { return ThanhTien * SoLuong; }
        }

        public GioHang(string id)
        {
            MASP = id;
            SANPHAM sp = db.SANPHAMs.Single(n => n.MASP == id);
            TENSP = sp.TENSP;
            HINHSP = sp.HINHSP;
            ThanhTien = int.Parse(sp.ThanhTien.ToString());
            SoLuong = 1;
        }
    }
}