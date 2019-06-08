using MoreLinq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer;
using DataLayer.ViewModels;

namespace MyEShoping.Controllers
{
    public class ProductController : Controller
    {
        DataLayer.EShoping_DBEntities _db = new DataLayer.EShoping_DBEntities();
        // GET: Product
        public ActionResult ShowGroup()
        {
            return PartialView(_db.Product_Groups.ToList());
        }

        public ActionResult LastProduct()
        {
            var productModel = _db.Products.OrderByDescending(a => a.ProductID).Take(12).ToList();
            return PartialView(productModel);
        }

        [Route("ShowProducts/{id}")]
        public ActionResult ShowProducts(int id)
        {
            var selectedProduct = _db.Products.Find(id);
            if (selectedProduct == null)
            {
                return HttpNotFound();
            }
            ViewBag.productFeaturs = _db.Product_Feature.DistinctBy(a => a.FeatureID).Select(f => new ShowProductFeatureViewModel()
            {
                FeatureTitle = f.Features.FeatureTitle,
                Value = _db.Product_Feature.Where(a => a.FeatureID == f.FeatureID).Select(b => b.Value).ToList()
            }).ToList();
            return View(selectedProduct);
        }

        public ActionResult ShowComment(int id)
        {
            var SelectedProductComments = _db.Product_Comments.Where(a => a.ProductID == id);
            return PartialView(SelectedProductComments);
        }
        public ActionResult CreateComment(int id)
        {
            return PartialView(new Product_Comments() {
            ProductID=id});
        }
        [HttpPost]
        public ActionResult CreateComment(Product_Comments _productComment)
        {
            if (ModelState.IsValid)
            {
                _productComment.CreateDate = DateTime.Now;
                _db.Product_Comments.Add(_productComment);
                _db.SaveChanges();
                return PartialView("ShowComment", _db.Product_Comments.Where(a=>a.ProductID==_productComment.ProductID));
            }
            return PartialView(_productComment);
        }


    }
}