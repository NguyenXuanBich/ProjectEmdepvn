using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.TaiKhoan
{
    public partial class TaiKhoanLoadControl : System.Web.UI.UserControl
    {
        private string module = "";
        private string action = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["submodule"] != null)
                module = Request.QueryString["submodule"];

            if (Request.QueryString["action"] != null)
            {
                action = Request.QueryString["action"];
                switch (module)
                {
                    case "QLTaiKhoan":
                        plTaiKhoanLoadControl.Controls.Add(LoadControl("QLTaiKhoan/QLTaiKhoan_ThemMoi.ascx")); break;
                    case "QuyenDangNhap":
                        plTaiKhoanLoadControl.Controls.Add(LoadControl("QuyenDangNhap/QuyenDangNhap_ThemMoi.ascx")); break;


                }
            }

            if (Request.QueryString["action"] == null)
                switch (module)
                {
                    case "QLTaiKhoan":
                        plTaiKhoanLoadControl.Controls.Add(LoadControl("QLTaiKhoan/QLTaiKhoanLoadControl.ascx")); break;
                    case "QuyenDangNhap":
                        plTaiKhoanLoadControl.Controls.Add(LoadControl("QuyenDangNhap/QuyenDangNhapLoadControl.ascx")); break;
                    default:
                        plTaiKhoanLoadControl.Controls.Add(LoadControl("QLTaiKhoan/QLTaiKhoanLoadControl.ascx")); break;
                }
        }


        protected string Check(string submodule, string action)
        {
            string s = "";
            string tensubmodule = "";
            string tenaction = "";
            if (Request.QueryString["submodule"] != null)
            {
                tensubmodule = Request.QueryString["submodule"];
            }
            if (Request.QueryString["action"] != null)
            {
                tenaction = Request.QueryString["action"];
            }
            if (tensubmodule == submodule && tenaction == action)
                s = "current";
            return s;

        }
    }
}

