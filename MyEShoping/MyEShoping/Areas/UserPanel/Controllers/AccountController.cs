using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DataLayer;
using DataLayer.ViewModels;
using System.Web.Security;

namespace MyEShoping.Areas.UserPanel.Controllers
{
    public class AccountController : Controller
    {
        EShoping_DBEntities DB = new EShoping_DBEntities();
        // GET: UserPanel/Account
        public ActionResult ChangePassWord()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChangePassWord(ChangePassWordViewModel ChangePassModel)
        {

            if (ModelState.IsValid)
            {
                var user = DB.Users.Single(u => u.Email == User.Identity.Name);
                string oldPasswordHash =
                    FormsAuthentication.HashPasswordForStoringInConfigFile(ChangePassModel.OldPassword, "MD5");
                if (user.PassWord == oldPasswordHash)
                {
                    string hashNewPasword =
                        FormsAuthentication.HashPasswordForStoringInConfigFile(ChangePassModel.Password, "MD5");
                    user.PassWord = hashNewPasword;
                    DB.SaveChanges();
                    ViewBag.Success = true;
                }
                else
                {
                    ModelState.AddModelError("OldPassword", "کلمه عبور فعلی درست نمی باشد");
                }
            }
            return View();
        }
    }
}