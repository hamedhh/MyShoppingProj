using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.ViewModels;
using System.Web.Http;
using DataLayer;

namespace MyEShoping.Controllers
{
    public class ShopCardController : Controller
    {
        EShoping_DBEntities _db = new EShoping_DBEntities();
        //ShopCardViewModel
        // GET: ShopCard
        public ActionResult Index()
        {
            List<ShopCardViewModel> _cardViewModel = new List<ShopCardViewModel>();
            if (HttpContext.Session["ShopCard"] != null)
            {
                List<ShopCardItem> _cardItem = HttpContext.Session["ShopCard"] as List<ShopCardItem>;
                if (_cardItem.Count > 0)
                {
                    foreach (var item in _cardItem)
                    {
                        var product = _db.Products.Where(a => a.ProductID == item.ProductID).Select(c => new {c.Title, c.ImageName }).Single();

                        _cardViewModel.Add(new DataLayer.ViewModels.ShopCardViewModel()
                        {
                            Count = item.Count,
                            ImageName = product.ImageName,
                            ProductID = item.ProductID,
                            Title = product.Title
                        });
                    }
 
                }

            }
            return PartialView(_cardViewModel);
        }
    }
}