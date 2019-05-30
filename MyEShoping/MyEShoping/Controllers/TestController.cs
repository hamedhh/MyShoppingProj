using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace MyEShoping.Controllers
{
    public class TestController : Controller
    {
        // GET: Test

        [Authorize]
        public ActionResult Test1()
        {
            return View();
        }
        [Authorize(Roles = "Admin")]
        public ActionResult test2()
        {
            return View();
        }
    }
}