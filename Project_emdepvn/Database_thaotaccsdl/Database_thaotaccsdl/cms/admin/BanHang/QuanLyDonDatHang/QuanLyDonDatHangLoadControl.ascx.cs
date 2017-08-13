using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.BanHang.QuanLyDonDatHang
{
    public partial class QuanLyDonDatHangLoadControl : System.Web.UI.UserControl
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
                    plDondatHangLoadControl.Controls.Add(LoadControl("QuanLyDonDatHang_HienThiChiTiet.ascx")); break;
                default:
                    plDondatHangLoadControl.Controls.Add(LoadControl("QuanLyDonDatHang_HienThi.ascx")); break;
            }
        }
    }
}