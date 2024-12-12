using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BanSanGo.Models;

namespace BanSanGo.Areas.Admin.Controllers
{
    public class LoaiSanGoController : Controller
    {
        private QuanLySanGoEntities db = new QuanLySanGoEntities();

        // GET: Admin/LoaiSanGo
        public ActionResult Index()
        {
            return View(db.LoaiSanGoes.ToList());
        }

        // GET: Admin/LoaiSanGo/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanGo loaiSanGo = db.LoaiSanGoes.Find(id);
            if (loaiSanGo == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanGo);
        }

        // GET: Admin/LoaiSanGo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LoaiSanGo/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLoaiSanGo,TenLoaiSanGo")] LoaiSanGo loaiSanGo)
        {
            if (ModelState.IsValid)
            {
                db.LoaiSanGoes.Add(loaiSanGo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loaiSanGo);
        }

        // GET: Admin/LoaiSanGo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanGo loaiSanGo = db.LoaiSanGoes.Find(id);
            if (loaiSanGo == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanGo);
        }

        // POST: Admin/LoaiSanGo/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLoaiSanGo,TenLoaiSanGo")] LoaiSanGo loaiSanGo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiSanGo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiSanGo);
        }

        // GET: Admin/LoaiSanGo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanGo loaiSanGo = db.LoaiSanGoes.Find(id);
            if (loaiSanGo == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanGo);
        }

        // POST: Admin/LoaiSanGo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LoaiSanGo loaiSanGo = db.LoaiSanGoes.Find(id);
            db.LoaiSanGoes.Remove(loaiSanGo);
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
