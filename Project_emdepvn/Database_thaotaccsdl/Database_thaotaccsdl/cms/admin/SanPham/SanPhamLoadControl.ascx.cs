using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.SanPham
{
    public partial class SanPhamLoadControl : System.Web.UI.UserControl
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
                    case "ChatLieu":
                        plSanPhamLoadControl.Controls.Add(LoadControl("QuanLyChatLieu/ChatLieu_ThemMoi.ascx")); break;
                    case "DanhMuc":
                        plSanPhamLoadControl.Controls.Add(LoadControl("QuanLyDanhMuc/DanhMuc_ThemMoi.ascx")); break;
                    case "Mau":
                        plSanPhamLoadControl.Controls.Add(LoadControl("QuanLyMau/Mau_ThemMoi.ascx")); break;
                    case "QLSanPham":
                        plSanPhamLoadControl.Controls.Add(LoadControl("QuanLySanPham/SanPham_ThemMoi.ascx")); break;
                    case "Size":
                        plSanPhamLoadControl.Controls.Add(LoadControl("QuanLySize/Size_ThemMoi.ascx")); break;
                    case "Nhom":
                        plSanPhamLoadControl.Controls.Add(LoadControl("QuanLyNhomSanPham/NhomSanPham_ThemMoi.ascx")); break;


                }
            }

            if (Request.QueryString["action"] == null)
            switch (module)
            {
                case "ChatLieu":
                    plSanPhamLoadControl.Controls.Add(LoadControl("QuanLyChatLieu/ChatLieuLoadControl.ascx")); break;
                case "DanhMuc":
                    plSanPhamLoadControl.Controls.Add(LoadControl("QuanLyDanhMuc/DanhMucLoadControl.ascx")); break;
                case "Mau":
                    plSanPhamLoadControl.Controls.Add(LoadControl("QuanLyMau/MauLoadControl.ascx")); break;
                case "QLSanPham":
                    plSanPhamLoadControl.Controls.Add(LoadControl("QuanLySanPham/QLSanPhamLoadControl.ascx")); break;
                case "Size":
                    plSanPhamLoadControl.Controls.Add(LoadControl("QuanLySize/SizeLoadControl.ascx")); break;
                case "Nhom":
                    plSanPhamLoadControl.Controls.Add(LoadControl("QuanLyNhomSanPham/NhomSanPhamLoadControl.ascx")); break;
                default:
                    plSanPhamLoadControl.Controls.Add(LoadControl("QuanLySanPham/QLSanPhamLoadControl.ascx")); break;
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

