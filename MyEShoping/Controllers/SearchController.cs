using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer;

namespace MyEShoping.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        EShoping_DBEntities db = new EShoping_DBEntities();
        public ActionResult Index(string SearchText)
        {
            List<Products> findProduct = new List<Products>();
            findProduct.AddRange(db.Product_Tags.Where(a => a.Tag == SearchText).Select(a => a.Products).ToList());
            findProduct.AddRange(db.Products.Where(a => a.Title.Contains(SearchText) || a.ShortDescription.Contains(SearchText)).ToList());
            ViewBag.SearchText = SearchText;
            return View(findProduct.Distinct().ToList());
        }
    }
}