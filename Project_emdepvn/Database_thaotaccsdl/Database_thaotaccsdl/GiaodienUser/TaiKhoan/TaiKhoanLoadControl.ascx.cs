using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.GiaodienUser.TaiKhoan
{
    public partial class TaiKhoanLoadControl : System.Web.UI.UserControl
    {
        private string submodule = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["submodule"] != null)
                submodule = Request.QueryString["submodule"];
            switch (submodule)
            {
                case "Dangkytaikhoan":
                    plTaiKhoanLoadControl.Controls.Add(LoadControl("DangKy.ascx"));
                    break;
                case "DangNhap":
                    plTaiKhoanLoadControl.Controls.Add(LoadControl("DangNhap.ascx"));
                    break;
                default:
                    plTaiKhoanLoadControl.Controls.Add(LoadControl("DangKy.ascx"));
                    break;
            }
        }
    }
}