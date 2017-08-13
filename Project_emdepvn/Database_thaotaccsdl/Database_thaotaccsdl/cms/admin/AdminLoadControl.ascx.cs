using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin
{
    public partial class AdminLoadControl : System.Web.UI.UserControl
    {
        private string module ="";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["module"] != null)
                module = Request.QueryString["module"];
            //Response.Write(module);
            switch (module)
            {
                case "SanPham":
                    plAdminLoadControl.Controls.Add(LoadControl("SanPham/SanPhamLoadControl.ascx")); break;
                case "TaiKhoan":
                    plAdminLoadControl.Controls.Add(LoadControl("TaiKhoan/TaiKhoanLoadControl.ascx")); break;
                case "TinTuc":
                    plAdminLoadControl.Controls.Add(LoadControl("TinTuc/TinTucLoadControl.ascx")); break;
                case "QuangCao":
                    plAdminLoadControl.Controls.Add(LoadControl("QuangCao/QuangCaoLoadControl.ascx")); break;
                case "KhachHang":
                    plAdminLoadControl.Controls.Add(LoadControl("KhachHang/KhachHangLoadControl.ascx")); break;
                case "Menu":
                    plAdminLoadControl.Controls.Add(LoadControl("Menu/MenuLoadControl.ascx")); break;
                case "BanHang":
                    plAdminLoadControl.Controls.Add(LoadControl("BanHang/BanHangLoadControl.ascx")); break;
                default:
                     plAdminLoadControl.Controls.Add(LoadControl("SanPham/SanPhamLoadControl.ascx")); break;
            }
        }
    }
}