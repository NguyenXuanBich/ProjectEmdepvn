using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLySanPham
{
    public partial class QLSanPhamLoadControl : System.Web.UI.UserControl
    {
        private string action = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] != null)
                action = Request.QueryString["action"];
            //Response.Write(action);
            switch (action)
            {
                case "ThemMoi":
                case "ChinhSua":
                    plSanphamloadcontrol.Controls.Add(LoadControl("SanPham_ThemMoi.ascx")); break;             
                case "HienThi":
                    plSanphamloadcontrol.Controls.Add(LoadControl("SanPham_HienThi.ascx")); break;
                default:
                    plSanphamloadcontrol.Controls.Add(LoadControl("SanPham_HienThi.ascx")); break;
            }
        }
    }
}