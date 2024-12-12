using System;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using BanSanGo.Models;

namespace BanSanGo.Areas.Admin.Controllers
{
    public class ChucVuController : Controller
    {
        private QuanLySanGoEntities db = new QuanLySanGoEntities();

        // GET: Admin/ChucVu
        public ActionResult Index()
        {
            return View(db.ChucVus.ToList());
        }

        // POST: Admin/ChucVu/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(string TenCV)
        {
            if (string.IsNullOrEmpty(TenCV))
            {
                ModelState.AddModelError("", "Tên chức vụ không thể để trống.");
                return View("Index", db.ChucVus.ToList());
            }

            // Kiểm tra xem chức vụ đã tồn tại chưa
            if (db.ChucVus.Any(cv => cv.TenCV == TenCV))
            {
                ModelState.AddModelError("", "Chức vụ đã tồn tại.");
                return View("Index", db.ChucVus.ToList());
            }

            // Thêm chức vụ mới
            var chucVu = new ChucVu { TenCV = TenCV };
            db.ChucVus.Add(chucVu);
            db.SaveChanges();

            TempData["SuccessMessage"] = "Thêm chức vụ thành công!";
            return RedirectToAction("Index");
        }

        // GET: Admin/ChucVu/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            ChucVu chucVu = db.ChucVus.Find(id);
            if (chucVu == null)
            {
                return HttpNotFound();
            }
            return View(chucVu);
        }

        // POST: Admin/ChucVu/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, string TenCV)
        {
            if (string.IsNullOrEmpty(TenCV))
            {
                ModelState.AddModelError("", "Tên chức vụ không thể để trống.");
                return View(db.ChucVus.Find(id));
            }

            ChucVu chucVu = db.ChucVus.Find(id);
            if (chucVu == null)
            {
                return HttpNotFound();
            }

            chucVu.TenCV = TenCV;
            db.Entry(chucVu).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            TempData["SuccessMessage"] = "Cập nhật chức vụ thành công!";
            return RedirectToAction("Index");
        }

        // POST: Admin/ChucVu/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            ChucVu chucVu = db.ChucVus.Find(id);
            if (chucVu != null)
            {
                // Kiểm tra xem chức vụ này có đang được sử dụng không
                // Ví dụ: Nếu chức vụ này đang được gán cho nhân viên hoặc đối tượng nào đó
                // Nếu có, bạn có thể đưa ra cảnh báo hoặc không cho phép xóa
                if (db.NhanViens.Any(nv => nv.MaCV == id))
                {
                    TempData["ErrorMessage"] = "Không thể xóa chức vụ này vì nó đang được sử dụng.";
                    return RedirectToAction("Index");
                }

                db.ChucVus.Remove(chucVu);
                db.SaveChanges();
                TempData["SuccessMessage"] = "Xóa chức vụ thành công!";
            }

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
