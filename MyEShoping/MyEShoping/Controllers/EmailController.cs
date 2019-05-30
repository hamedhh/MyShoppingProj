using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyEShoping.Controllers
{
    public class EmailController : Controller
    {
        // GET: Email
        public ActionResult SendEmail()
        {
            return PartialView();
        }

        public ActionResult ForgotEmail()
        {
            return PartialView();
        }
    }
}