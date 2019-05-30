using System.ComponentModel.DataAnnotations;

namespace DataLayer
{
    public  class RolesMetaData
    {
        [Key]
        public int RoleID { get; set; }

        [Required(ErrorMessage = "!لطفن {0} را وارد کنید")]
        [Display(Name ="عنوان نقش")]
        public string RoleTitle { get; set; }

        [Display(Name ="عنوان سیستمی نقش")]
        [Required(ErrorMessage = "!لطفن {0} را وارد کنید")]
        public string RoleName { get; set; }
    }
}