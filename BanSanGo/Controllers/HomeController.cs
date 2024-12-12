using BanSanGo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web.Mvc;

namespace SanGo.Controllers
{
    public class HomeController : Controller
    {
        private QuanLySanGoEntities db = new QuanLySanGoEntities();

        public ActionResult Index()
        {
            var products = db.SanGoes.OrderByDescending(p => p.MaSanGo).Take(8).ToList();
            return View(products);
        }

        public ActionResult Products(int page = 1)
        {
            int pageSize = 8;
            var products = db.SanGoes.OrderBy(p => p.MaSanGo)
                                     .Skip((page - 1) * pageSize)
                                     .Take(pageSize)
                                     .ToList();

            int totalProducts = db.SanGoes.Count();
            ViewBag.TotalPages = (int)Math.Ceiling((double)totalProducts / pageSize);
            ViewBag.CurrentPage = page;
            ViewBag.TotalProducts = totalProducts;

            return View(products);
        }

        public ActionResult ProductType(int maLoaiSanGo)
        {
            int pageSize = 10;
            int page = 1; // Mặc định sẽ hiển thị trang đầu tiên
            var products = db.SanGoes
                             .Where(p => p.MaLoaiSanGo == maLoaiSanGo)
                             .OrderBy(p => p.MaSanGo)
                             .Take(pageSize)  // Lấy một số sản phẩm theo pageSize
                             .ToList();

            int totalProducts = db.SanGoes.Count(p => p.MaLoaiSanGo == maLoaiSanGo);

            ViewBag.TotalPages = (int)Math.Ceiling((double)totalProducts / pageSize);
            ViewBag.CurrentPage = page;
            ViewBag.MaLoaiSanGo = maLoaiSanGo;

            return View(products);
        }


        public ActionResult Detail(int id)
        {
            var product = db.SanGoes.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }

            return View(product);
        }

        [HttpPost]
        public ActionResult AddToCart(int id, string redirectUrl)
        {
            var product = db.SanGoes.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }

            var cart = Session["Cart"] as List<BanSanGo.Models.SanGo> ?? new List<BanSanGo.Models.SanGo>();

            var existingProduct = cart.FirstOrDefault(p => p.MaSanGo == id);
            if (existingProduct != null)
            {
                existingProduct.SoLuong += 1;
            }
            else
            {
                cart.Add(new BanSanGo.Models.SanGo
                {
                    MaSanGo = product.MaSanGo,
                    TenSanGo = product.TenSanGo,
                    GiaBan = product.GiaBan,
                    SoLuong = 1,
                    HinhAnh = product.HinhAnh
                });
            }

            Session["Cart"] = cart;

            if (!string.IsNullOrEmpty(redirectUrl))
            {
                return Redirect(redirectUrl);
            }

            return RedirectToAction("Detail", new { id });
        }

        public ActionResult Cart()
        {
            var cart = Session["Cart"] as List<BanSanGo.Models.SanGo>;
            if (cart == null)
            {
                cart = new List<BanSanGo.Models.SanGo>();
                Session["Cart"] = cart;
            }
            return View(cart);
        }

        [HttpPost]
        public ActionResult PlaceOrder(string TenKH, string SDT, string DiaChi, string HinhThucThanhToan, string Email)
        {
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    var cart = Session["Cart"] as List<BanSanGo.Models.SanGo>;

                    var hoaDon = new HoaDon
                    {
                        NgayTao = DateTime.Now,
                        TrangThai = "Đang xử lý",
                        TenKH = TenKH,
                        SDT = SDT,
                        DiaChi = DiaChi,
                        HinhThucThanhToan = HinhThucThanhToan,
                        TongTienPhaiTra = cart.Sum(item => item.GiaBan.GetValueOrDefault() * item.SoLuong) // Tổng tiền
                    };

                    foreach (var item in cart)
                    {
                        var sanGo = db.SanGoes.FirstOrDefault(s => s.MaSanGo == item.MaSanGo);
                        if (sanGo == null || sanGo.SoLuong < item.SoLuong)
                        {
                            throw new Exception($"Không đủ gỗ cho sản phẩm {item.MaSanGo}.");
                        }

                        var chiTietHoaDon = new ChiTietHoaDon
                        {
                            MaHD = hoaDon.MaHD,
                            MaSanGo = item.MaSanGo,
                            SoLuongMua = item.SoLuong,
                            GiaMua = item.GiaBan ?? 0
                        };

                        hoaDon.ChiTietHoaDons.Add(chiTietHoaDon);
                    }

                    db.HoaDons.Add(hoaDon);
                    db.SaveChanges();

                    SendInvoiceEmail(Email, hoaDon);
                    // Commit giao dịch nếu không có lỗi
                    transaction.Commit();

                    Session.Remove("Cart");
                    return RedirectToAction("Index");
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    throw;
                }
            }
        }
        private void SendInvoiceEmail(string userEmail, HoaDon hoaDon)
        {
            string subject = "Hóa Đơn Đặt Hàng";
            string body = $"<h2>Hóa Đơn của bạn</h2>" +
                          $"<p>Họ Tên: {hoaDon.TenKH}</p>" +
                          $"<p>Số Điện Thoại: {hoaDon.SDT}</p>" +
                          $"<p>Địa Chỉ: {hoaDon.DiaChi}</p>" +
                          $"<p>Tổng Tiền: {hoaDon.TongTienPhaiTra:C}</p>" +
                          $"<p>Hình Thức Thanh Toán: {hoaDon.HinhThucThanhToan}</p>" +
                          "<h3>Chi Tiết Đơn Hàng:</h3>";
            foreach (var item in hoaDon.ChiTietHoaDons)
            {
                var sanGo = db.SanGoes.Find(item.MaSanGo);
                if (sanGo != null)
                {
                    body += $"<p>{sanGo.TenSanGo} - Số Lượng: {item.SoLuongMua} - Giá: {item.GiaMua:C}</p>";
                }
            }

            SendEmail(userEmail, subject, body);
        }

        private void SendEmail(string toEmail, string subject, string body)
        {
            // Cấu hình gửi emai
            string smtpServer = "smtp.gmail.com";
            int smtpPort = 587;
            string smtpUser = "hoanghai07077@gmail.com"; 
            string smtpPass = "axxj iwst emgo yocx"; 
            using (var mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(smtpUser);
                mailMessage.To.Add(toEmail);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;

                using (var smtpClient = new SmtpClient(smtpServer, smtpPort))
                {
                    smtpClient.Credentials = new NetworkCredential(smtpUser, smtpPass);
                    smtpClient.EnableSsl = true;
                    smtpClient.Send(mailMessage);
                }
            }
        }


        [HttpPost]
        public ActionResult ClearCart()
        {
            Session.Remove("Cart");
            return RedirectToAction("Cart");
        }

        public ActionResult Search(string s)
        {
            var products = db.SanGoes.Where(p => p.TenSanGo.Contains(s)).ToList();
            return View(products);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
