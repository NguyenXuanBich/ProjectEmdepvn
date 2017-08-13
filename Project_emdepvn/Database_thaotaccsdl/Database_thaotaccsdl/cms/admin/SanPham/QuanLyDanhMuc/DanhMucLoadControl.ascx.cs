using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyDanhMuc
{
    public partial class DanhMucLoadControl : System.Web.UI.UserControl
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
                    plLoadControl.Controls.Add(LoadControl("DanhMuc_ThemMoi.ascx")); break;
                //case "ChinhSua":
                //    plLoadControl.Controls.Add(LoadControl("DanhMuc_ChinhSua.ascx")); break;
                case "HienThi":
                    plLoadControl.Controls.Add(LoadControl("DanhMuc_HienThi.ascx")); break;
                default:                
                    plLoadControl.Controls.Add(LoadControl("DanhMuc_HienThi.ascx")); break;
            }
        }
    }
}