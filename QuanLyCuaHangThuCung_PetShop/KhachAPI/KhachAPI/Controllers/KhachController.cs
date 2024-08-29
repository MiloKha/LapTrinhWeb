using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using KhachAPI.Models;

namespace KhachAPI.Controllers
{
    public class KhachController : ApiController
    {
        // GET api/khach
        [HttpGet]
        public List<KHACH> GetKhachLists()
        {
            dbQuanLyThuCungDataContext db = new dbQuanLyThuCungDataContext();
            return db.KHACHes.ToList();
        }

        // GET api/khach/5
        [HttpGet]
        public KHACH GetKhach(int id)
        {
            dbQuanLyThuCungDataContext db = new dbQuanLyThuCungDataContext();
            return db.KHACHes.FirstOrDefault(s => s.MAKH == id);
        }

        // POST api/khach
        public void Post([FromBody]string value)
        {
        }

        // PUT api/khach/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/khach/5
        public void Delete(int id)
        {
        }
    }
}
