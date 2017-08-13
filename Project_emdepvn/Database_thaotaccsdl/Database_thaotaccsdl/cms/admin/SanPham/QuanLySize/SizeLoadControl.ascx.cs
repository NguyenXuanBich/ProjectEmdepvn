using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLySize
{
    public partial class SizeLoadControl : System.Web.UI.UserControl
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
                    plSizeLoadControl.Controls.Add(LoadControl("Size_ThemMoi.ascx")); break;
                case "HienThi":
                    plSizeLoadControl.Controls.Add(LoadControl("Size_HienThi.ascx")); break;
                default:
                    plSizeLoadControl.Controls.Add(LoadControl("Size_HienThi.ascx")); break;
            }
        }
    }
}