using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyNhomSanPham
{
    public partial class NhomSanPhamLoadControl : System.Web.UI.UserControl
    {
        private string action = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] != null)
                action = Request.QueryString["action"];
            Response.Write(action);
            switch (action)
            {
                case "ThemMoi":
                case "ChinhSua":
                    plNhomLoadControl.Controls.Add(LoadControl("NhomSanPham_ThemMoi.ascx")); break;
                //case "ChinhSua":
                //    plLoadControl.Controls.Add(LoadControl("DanhMuc_ChinhSua.ascx")); break;
                case "HienThi":
                    plNhomLoadControl.Controls.Add(LoadControl("NhomSanPham_HienThi.ascx")); break;
                default:
                    plNhomLoadControl.Controls.Add(LoadControl("NhomSanPham_HienThi.ascx")); break;
            }
        }
    }
}