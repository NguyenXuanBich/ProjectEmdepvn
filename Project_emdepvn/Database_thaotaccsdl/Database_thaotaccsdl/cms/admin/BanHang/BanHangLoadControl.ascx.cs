using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.BanHang
{
    public partial class BanHangLoadControl : System.Web.UI.UserControl
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
                    case "QLDonDatHang":
                        plBanHangLoadControl.Controls.Add(LoadControl("QuanLyDonDatHang/QuanLyDonDatHang_HienThiChiTiet.ascx")); break;
                    case "QLHoaDon":
                        plBanHangLoadControl.Controls.Add(LoadControl("QuanLyHoaDon/QuanLyHoaDon_HienThiChiTiet.ascx")); break;                

                }
            }

            if (Request.QueryString["action"] == null)
                switch (module)
                {
                    case "QLDonDatHang":
                        plBanHangLoadControl.Controls.Add(LoadControl("QuanLyDonDatHang/QuanLyDonDatHangLoadControl.ascx")); break;
                    case "QLHoaDon":
                        plBanHangLoadControl.Controls.Add(LoadControl("QuanLyHoaDon/QuanLyHoaDonLoadControl.ascx")); break;
                    case "QLDT":
                        plBanHangLoadControl.Controls.Add(LoadControl("QuanLyHoaDon/DoanhThu.ascx")); break;
                    default:
                        plBanHangLoadControl.Controls.Add(LoadControl("QuanLyDonDatHang/QuanLyDonDatHangLoadControl.ascx")); break;
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

