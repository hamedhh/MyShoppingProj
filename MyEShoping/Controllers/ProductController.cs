using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

    }
}