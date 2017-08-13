using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyMau
{
    public partial class MauLoadControl : System.Web.UI.UserControl
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
                    plMauLoadControl.Controls.Add(LoadControl("Mau_ThemMoi.ascx")); break;
                case "HienThi":
                    plMauLoadControl.Controls.Add(LoadControl("Mau_HienThi.ascx")); break;
                default:
                    plMauLoadControl.Controls.Add(LoadControl("Mau_HienThi.ascx")); break;
            }
        }
    }
}