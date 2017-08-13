using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.QuangCao.QuanLyQuangCao
{
    public partial class QuanLyQuangCaoLoadControl : System.Web.UI.UserControl
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
                    plQuangcaoloadcontrol.Controls.Add(LoadControl("QuanLyQuangCao_ThemMoi.ascx")); break;
                case "HienThi":
                    plQuangcaoloadcontrol.Controls.Add(LoadControl("QuanLyQuangCao_HienThi.ascx")); break;
                default:
                    plQuangcaoloadcontrol.Controls.Add(LoadControl("QuanLyQuangCao_HienThi.ascx")); break;
            }
        }
    }
}