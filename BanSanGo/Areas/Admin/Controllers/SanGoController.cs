using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BanSanGo.Models;

namespace BanSanGo.Areas.Admin.Controllers
{
    public class SanGoController : Controller
    {
        private QuanLySanGoEntities db = new QuanLySanGoEntities();

        // GET: Admin/SanGo
        public ActionResult Index()
        {
            var sanGoes = db.SanGoes.Include(s => s.LoaiSanGo);
            return View(sanGoes.ToList());
        }

        // GET: Admin/SanGo/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Models.SanGo sanGo = db.SanGoes.Find(id);
            if (sanGo == null)
            {
                return HttpNotFound();
            }
            return View(sanGo);
        }

        // GET: Admin/SanGo/Create
        public ActionResult Create()
        {
            ViewBag.MaLoaiSanGo = new SelectList(db.LoaiSanGoes, "MaLoaiSanGo", "TenLoaiSanGo");
            return View();
        }

        // POST: Admin/SanGo/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        // POST: Admin/SanGo/Create
        // POST: Admin/SanGo/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSanGo,TenSanGo,SoLuong,GiaBan,MaLoaiSanGo,MoTa,HinhAnh")] Models.SanGo sanGo, HttpPostedFileBase HinhAnh)
        {
            if (ModelState.IsValid)
            {
                if (HinhAnh != null && HinhAnh.ContentLength > 0)
                {
                    // Lấy tên thư mục theo loại sản phẩm
                    var folderName = sanGo.MaLoaiSanGo == 1 ? "SanGoOcCho" :
                                     sanGo.MaLoaiSanGo == 2 ? "SanGoGoDoNamPhi" :
                                     "SanGoSoiMy";  // Thêm các điều kiện khác nếu cần

                    // Tạo đường dẫn thư mục lưu trữ ảnh
                    var path = Path.Combine(Server.MapPath("~/Content/HinhAnh/" + folderName));

                    // Kiểm tra nếu thư mục chưa tồn tại thì tạo mới
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    // Tạo tên file và lưu ảnh
                    var fileName = Path.GetFileName(HinhAnh.FileName);
                    var filePath = Path.Combine(path, fileName);
                    HinhAnh.SaveAs(filePath);

                    // Lưu đường dẫn ảnh vào cơ sở dữ liệu
                    sanGo.HinhAnh = "/Content/HinhAnh/" + folderName + "/" + fileName;
                }

                db.SanGoes.Add(sanGo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLoaiSanGo = new SelectList(db.LoaiSanGoes, "MaLoaiSanGo", "TenLoaiSanGo", sanGo.MaLoaiSanGo);
            return View(sanGo);
        }

        // GET: Admin/SanGo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Models.SanGo sanGo = db.SanGoes.Find(id);
            if (sanGo == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoaiSanGo = new SelectList(db.LoaiSanGoes, "MaLoaiSanGo", "TenLoaiSanGo", sanGo.MaLoaiSanGo);
            return View(sanGo);
        }

        // POST: Admin/SanGo/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSanGo,TenSanGo,SoLuong,GiaBan,MaLoaiSanGo,MoTa,HinhAnh, RowVersion")] Models.SanGo sanGo, HttpPostedFileBase HinhAnh)
        {
            if (ModelState.IsValid)
            {
                // Tìm lại bản ghi cũ từ cơ sở dữ liệu để đảm bảo giá trị RowVersion
                var existingSanGo = db.SanGoes.Find(sanGo.MaSanGo);
                if (existingSanGo == null)
                {
                    return HttpNotFound();
                }

                // Kiểm tra và lưu hình ảnh mới nếu có
                if (HinhAnh != null && HinhAnh.ContentLength > 0)
                {
                    var folderName = sanGo.MaLoaiSanGo == 1 ? "SanGoOcCho" :
                                     sanGo.MaLoaiSanGo == 2 ? "SanGoGoDoNamPhi" :
                                     "SanGoSoiMy";

                    var path = Path.Combine(Server.MapPath("~/Content/HinhAnh/" + folderName));

                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    var fileName = Path.GetFileName(HinhAnh.FileName);
                    var filePath = Path.Combine(path, fileName);
                    HinhAnh.SaveAs(filePath);

                    sanGo.HinhAnh = "/Content/HinhAnh/" + folderName + "/" + fileName;
                }
                else
                {
                    // Nếu không chọn hình ảnh mới, giữ lại hình ảnh cũ
                    sanGo.HinhAnh = existingSanGo.HinhAnh;
                }

                // Cập nhật các trường dữ liệu
                db.Entry(existingSanGo).CurrentValues.SetValues(sanGo);

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return View("ConcurrencyError");
                }

                return RedirectToAction("Index");
            }

            // Nếu model không hợp lệ, trả về view với thông tin đã nhập
            ViewBag.MaLoaiSanGo = new SelectList(db.LoaiSanGoes, "MaLoaiSanGo", "TenLoaiSanGo", sanGo.MaLoaiSanGo);
            return View(sanGo);
        }


        // GET: Admin/SanGo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Models.SanGo sanGo = db.SanGoes.Find(id);
            if (sanGo == null)
            {
                return HttpNotFound();
            }
            return View(sanGo);
        }

        // POST: Admin/SanGo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Models.SanGo sanGo = db.SanGoes.Find(id);
            db.SanGoes.Remove(sanGo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
