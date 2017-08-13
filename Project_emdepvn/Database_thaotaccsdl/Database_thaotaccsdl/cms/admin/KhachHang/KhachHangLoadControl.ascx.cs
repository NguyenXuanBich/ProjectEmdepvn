using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.KhachHang
{
    public partial class KhachHangLoadControl : System.Web.UI.UserControl
    {
        private string action = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["module"].Equals("KhachHang"))
            {
                if (Request.QueryString["action"] != null)
                {
                    action = Request.QueryString["action"];
                }
                switch (action)
                {
                    case "ThemKhachHang":
                    case "ChinhSua":
                        plKhachHangLoadControl.Controls.Add(LoadControl("KhachHang_ThemMoi.ascx"));
                        break;
                    case "DanhSachKhachHang":
                        plKhachHangLoadControl.Controls.Add(LoadControl("KhachHang_HienThi.ascx"));
                        break;
                    default:
                        plKhachHangLoadControl.Controls.Add(LoadControl("KhachHang_HienThi.ascx"));
                        break;
                }


            }
        }
        protected string Check(string module, string action)
        {
            string s = "";
            string tenmodule = "";
            string tenaction = "";
            if (Request.QueryString["module"] != null)
            {
                tenmodule = Request.QueryString["module"];
            }
            if (Request.QueryString["action"] != null)
            {
                tenaction = Request.QueryString["action"];
            }
            if (tenaction == action && tenmodule == module)
                s = "current";
            return s;
        }
    }
}