using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.TaiKhoan.QuyenDangNhap
{
    public partial class QuyenDangNhapLoadControl : System.Web.UI.UserControl
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
                    plquyendangnhapLoadControl.Controls.Add(LoadControl("QuyenDangNhap_ThemMoi.ascx")); break;
                case "HienThi":
                    plquyendangnhapLoadControl.Controls.Add(LoadControl("QuyenDangNhap_HienThi.ascx")); break;
                default:
                    plquyendangnhapLoadControl.Controls.Add(LoadControl("QuyenDangNhap_HienThi.ascx")); break;
            }
        }
    }
}