using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.TinTuc.QuanLyTinTuc
{
    public partial class QuanLyTinTucLoadControl : System.Web.UI.UserControl
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
                    plTinTucloadcontrol.Controls.Add(LoadControl("QuanLyTinTuc_ThemMoi.ascx")); break;
                case "HienThi":
                    plTinTucloadcontrol.Controls.Add(LoadControl("QuanLyTinTuc_HienThi.ascx")); break;
                default:
                    plTinTucloadcontrol.Controls.Add(LoadControl("QuanLyTinTuc_HienThi.ascx")); break;
            }
        }
    }
}