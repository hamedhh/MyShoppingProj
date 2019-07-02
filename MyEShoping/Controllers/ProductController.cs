using MoreLinq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer;
using DataLayer.ViewModels;
using PagedList;

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

        [Route("Archive")]
        public ActionResult Archive(int? page = 1,string Title="",int MinPrice=0,int MaxPrice=0,List<int> selectedGP=null)
        {
            int pageIndex = page.HasValue?Convert.ToInt32(page) :1;
            int pageSize = 3;
            //ViewBag.pageCount = pageId;
            ViewBag.productName = Title;
            ViewBag.minPrice = MinPrice;
            ViewBag.maxPrice = MaxPrice;
            ViewBag.selectedGroup = selectedGP;
            ViewBag.ProductGroups = _db.Product_Groups.ToList();
            List<Products> _listProduct = new List<Products>();
            if (selectedGP != null && selectedGP.Any())
            {
                foreach (int item in selectedGP)
                {
                    _listProduct.AddRange(_db.Prodct_Selected_Groups.Where(a => a.GroupID == item).Select(b => b.Products).ToList());
                }
                _listProduct = _listProduct.Distinct().ToList();

            }
            else
            {
                _listProduct.AddRange(_db.Products.ToList());

            }
            if (Title != string.Empty)
                _listProduct= _listProduct.Where(a => a.Title.Contains(Title)).ToList();
            if (MinPrice > 0)
                _listProduct= _listProduct.Where(a => a.Price >= MinPrice).ToList();
            if (MaxPrice > 0)
                _listProduct = _listProduct.Where(a => a.Price <= MaxPrice).ToList();

            //paging____________________________
            //int take = 5;
            //int skip = (pageId - 1) * take;
            //ViewBag.pageCount = _listProduct.Count/take;-
            //return View(_listProduct.OrderByDescending(a=>a.CreateDate).Skip(skip).Take(take).ToList());
            return View(_listProduct.ToPagedList(pageIndex, pageSize));

        }

        //[HttpPost]------------وقتی در ویو تگ فرم داریم دیگر کنترلر با متد پست نداریم و اعمال نمیشود!!!!ث
        //public ActionResult Archive(string Title)
        //{
        //    ViewBag.ProductGroups = _db.Product_Groups.ToList();
        //    return View();
        //}

    }
}