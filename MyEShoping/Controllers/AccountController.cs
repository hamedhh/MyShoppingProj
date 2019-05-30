using DataLayer;
using DataLayer.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Utilities;



namespace MyEShoping.Controllers
{
    public class AccountController : Controller
    {
        EShoping_DBEntities DB = new EShoping_DBEntities();
        // GET: Account

        [Route("Register")]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Register")]
        public ActionResult Register(RegisterViewModel RequestRegister)
        {
            if (ModelState.IsValid)
            {
                if (!DB.Users.Any(a => a.Email == RequestRegister.Email.Trim().ToLower()))
                {
                    var User = new Users
                    {
                        Email = RequestRegister.Email.Trim().ToLower(),
                        Password = FormsAuthentication.HashPasswordForStoringInConfigFile(RequestRegister.PassWord, "MD5"),
                        ActiveCode = Guid.NewGuid().ToString(),
                        IsActive = true,
                        RegisterDate = DateTime.Now,
                        RoleID = 2,
                        UserName = RequestRegister.UserName
                    };
                    DB.Users.Add(User);
                    DB.SaveChanges();
                    string Emailbody = PartialToStringClass.RenderPartialView("Email", "SendEmail", User);
                    Utilities.SendEmail.Send("hamed_71hh@yahoo.com", "ایمبل فعال سازی", Emailbody);

                    return View("SuccessRegister", User);

                }
                else
                {
                    ModelState.AddModelError("Email", "ایمیل وارد شده تکراری است");

                }

            }
            return View(RequestRegister);

        }

        [Route("Login")]
        public ActionResult Login()
        {
            return View();
        }

        [Route("Login")]
        [HttpPost]
        public ActionResult Login(LoginViewModel UserLogin, string ReturnUrl = "/")
        {

            if (ModelState.IsValid)
            {
                string hashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(UserLogin.PassWord, "MD5");
                var user = DB.Users.SingleOrDefault(a => a.Email == UserLogin.Email && a.Password == hashPassword);
                if (user != null)
                {
                    if (!user.IsActive == false)
                    {
                        FormsAuthentication.SetAuthCookie(user.Email, UserLogin.RememberMe);
                        return Redirect(ReturnUrl);
                    }
                    else
                        ModelState.AddModelError("Email", "حساب کاربری مورد نظر فعال نیست!");

                }
                else
                {
                    ModelState.AddModelError("Email", "نام کابری یا گذر واژه اشتباه است");
                }
            }

            return View(UserLogin);//return View("/Login");



        }

        [Route("ForgotPassWord")]
        public ActionResult ForgotPassWord()
        {
            return View();
        }

        [Route("ForgotPassWord")]
        [HttpPost]
        public ActionResult ForgotPassWord(ForgotPassWordViewModel ForgotEmail)
        {
            if (ModelState.IsValid)
            {
                var user = DB.Users.Single(a => a.Email == ForgotEmail.Email);
                if (user != null)
                {
                    var EmailMessageBody = PartialToStringClass.RenderPartialView("Email", "ForgotEmail",user);
                    Utilities.SendEmail.Send(ForgotEmail.Email, "فراموشی رمز عبور", EmailMessageBody);
                    return View("SuccessForgotPassWord", user);
                }
                else
                {
                    ModelState.AddModelError("Email", "مشخصات ایمیل وارد در بانک اطلاعاتی یافت نشد!");
                }
            }
            else
            {
                ModelState.AddModelError("Email", "اطلاعات وارد شده صحیح نمی باشد!");
            }

            return View();
        }

     
        public ActionResult RecoveryPassWord(string id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult RecoveryPassWord(RecoveryPassWordViewModel RecoverPass, string id)
        {
            if (ModelState.IsValid)
            {
                var user_with_id = DB.Users.SingleOrDefault(a => a.ActiveCode == id);
                if (user_with_id == null)
                {
                    return HttpNotFound();
                }

                user_with_id.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(RecoverPass.NewPassWord, "MD5");
                user_with_id.ActiveCode = Guid.NewGuid().ToString();
                DB.SaveChanges();
                return Redirect("/Login?recovery=true");

            }
            else
            {
                ModelState.AddModelError("NewPassWord", "اطلاعات وارد شده صحیح نمی باشد!");

            }
            return View();
        }

        public ActionResult logOut()
        {
            FormsAuthentication.SignOut();
            return Redirect("/");
        }


        // [Route("ActivateUser")]
        public ActionResult ActivateUser(string id)
        {
            if (DB.Users.Any(a => a.ActiveCode == id))
            {

                var user = DB.Users.SingleOrDefault(a => a.ActiveCode == id);
                user.IsActive = true;
                user.ActiveCode = Guid.NewGuid().ToString();
                DB.SaveChanges();
                ViewBag.UserName = user.UserName;
            }
            else
            {
                return HttpNotFound("صفحه مورد نظر یافت نشد!");
            }

            return View();
        }

    }
}