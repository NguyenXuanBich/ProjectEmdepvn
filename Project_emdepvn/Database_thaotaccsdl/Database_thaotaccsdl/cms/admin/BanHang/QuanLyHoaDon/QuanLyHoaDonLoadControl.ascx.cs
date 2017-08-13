using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.BanHang.QuanLyHoaDon
{
    public partial class QuanLyHoaDonLoadControl : System.Web.UI.UserControl
    {

        private string action = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] != null)
                action = Request.QueryString["action"];
            Response.Write(action);
            switch (action)
            {
                case "ChiTiet":
                    plHoaDonLoadControl.Controls.Add(LoadControl("QuanLyHoaDon_HienThiChiTiet.ascx")); break;
                case "XemDoanhThu":
                    plHoaDonLoadControl.Controls.Add(LoadControl("DoanhThu.ascx")); break;
                default:
                    plHoaDonLoadControl.Controls.Add(LoadControl("QuanLyHoaDon_HienThi.ascx")); break;
            }
        }
    }
}