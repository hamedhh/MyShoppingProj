using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer.ViewModels;

namespace MyEShoping.Controllers
{
    public class ShopCardController : Controller
    {
        //ShopCardViewModel
        // GET: ShopCard
        public ActionResult Index()
        {
            //List<>
            return View();
        }
    }
}