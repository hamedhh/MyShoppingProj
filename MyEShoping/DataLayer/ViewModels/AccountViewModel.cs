using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace DataLayer.ViewModels
{

    public class RegisterViewModel
    {
        [Display(Name = "نام کاربری ")]
        [Required(ErrorMessage = "لطفن فیلد {0} را وارد نمایید")]
        public string UserName { get; set; }

        [Display(Name = "ایمیل")]
        [Required(ErrorMessage = "لطفن فیلد {0} را وارد نمایید")]
        [EmailAddress(ErrorMessage = "فرمت ایمیل صحیح نمی باشد")]
        public string Email { get; set; }

        [Display(Name = "گذر واؤه")]
        [Required(ErrorMessage = "لطفن فیلد {0} را وارد نمایید")]
        [DataType(DataType.Password)]
        public string PassWord { get; set; }

        [Display(Name = "تکرار گذر واؤه")]
        [Required(ErrorMessage = "لطفن فیلد {0} را وارد نمایید")]
        [DataType(DataType.Password)]
        [Compare("PassWord", ErrorMessage = "گذره واژه تکراری اشتباه است")]
        public string RePassWord { get; set; }
    }

    public class LoginViewModel
    {
        [Display(Name = "ایمیل")]
        [Required(ErrorMessage = "لطفن {0} را وارد کنید")]
        [EmailAddress(ErrorMessage = "فرمت ایمیل را به درستی وارد نمایید")]
        public string Email { get; set; }

        [Display(Name = "رمز عبور")]
        [Required(ErrorMessage = "لطفن {0} را وارد کنید")]
        [DataType(DataType.Password)]
        public string PassWord { get; set; }

        [Display(Name = "مرا به خاطر داشته باش")]
        public bool RememberMe { get; set; }

    }

    public class ForgotPassWordViewModel
    {
        [Display(Name = "ایمیل")]
        [Required(ErrorMessage = "لطفا {0} را وارد نمایید")]
        [EmailAddress(ErrorMessage = "فرمت ایمیل اشتباه است")]
        public string Email { get; set; }

    }

    public class RecoveryPassWordViewModel
    {
        [Display(Name = "رمز عبور جدید")]
        [Required(ErrorMessage = "لطفن {0} را وارد کنید")]
        [DataType(DataType.Password)]
        public string NewPassWord { get; set; }

        [Display(Name = "تکرار رمز عیور جدید")]
        [Required(ErrorMessage = "لطفن {0} را وارد کنید")]
        [DataType(DataType.Password)]
        [Compare("NewPassWord", ErrorMessage = "گذره واژه تکراری اشتباه است")]
        public string ReNewPassword { get; set; }
    }

    public class ChangePassWordViewModel
    {
        [Display(Name = "کلمه عبور فعلی")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.Password)]
        public string OldPassword { get; set; }

        [Display(Name = "کلمه عبور جدید")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "تکرار کلمه عبور جدید")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "کلمه های عبور مغایرت دارند")]
        public string RePassword { get; set; }
    }

}



