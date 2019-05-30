using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataLayer;
using InsertShowImage;
using KooyWebApp_MVC.Classes;
using Utilities;

namespace MyEShoping.Areas.Admin.Controllers
{
    public class ProductsController : Controller
    {
        private EShoping_DBEntities db = new EShoping_DBEntities();

        // GET: Admin/Products
        public ActionResult Index()
        {
            return View(db.Products.ToList());
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.productGroups = db.Product_Groups.ToList();
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,Title,ShortDescription,Text,Price,ImageName,CreateDate")] Products products,List<int> selectedGroups, HttpPostedFileBase ImageUploaders, string tags)
        {
            if (selectedGroups == null)
            {
                ViewBag.GroupError = true;
                ViewBag.productGroups = db.Product_Groups.ToList();
                return View();
            }
            products.ImageName = "index.png";
            if (ImageUploaders != null && ImageUploaders.IsImage())
            {
                products.ImageName = Guid.NewGuid().ToString() +System.IO.Path.GetExtension(ImageUploaders.FileName);
                ImageUploaders.SaveAs(Server.MapPath("/Areas/Admin/Images/ProductImages/") +products.ImageName);
                ImageResizer img = new ImageResizer();
                img.Resize(Server.MapPath("/Areas/Admin/Images/ProductImages/") + products.ImageName,
                    Server.MapPath("/Areas/Admin/Images/ProductImages/Thumb/") + products.ImageName);
            }
            if (ModelState.IsValid)
            {
                products.CreateDate = DateTime.Now;
                db.Products.Add(products);

                foreach (var item in selectedGroups)
                {
                    var selectedProductGroup = new Prodct_Selected_Groups() { GroupID=item,ProductID=products.ProductID};
                    db.Prodct_Selected_Groups.Add(selectedProductGroup);
                }

                string[] _tags = tags.Split(',');
                foreach (var tagItems in _tags)
                {
                    db.Product_Tags.Add(new Product_Tags() {ProductID=products.ProductID,Tag=tagItems.Trim() });
                }

               
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.productGroups = db.Product_Groups.ToList();
            return View(products);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,Title,ShortDescription,Text,Price,ImageName,CreateDate")] Products products)
        {
            if (ModelState.IsValid)
            {
                db.Entry(products).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(products);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Products products = db.Products.Find(id);
            db.Products.Remove(products);
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
