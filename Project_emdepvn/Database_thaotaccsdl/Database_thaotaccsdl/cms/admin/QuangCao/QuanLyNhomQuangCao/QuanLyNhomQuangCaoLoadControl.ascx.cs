using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.QuangCao.QuanLyNhomQuangCao
{
    public partial class QuanLyNhomQuangCaoLoadControl : System.Web.UI.UserControl
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
                    plNhomquangcaoloadcontrol.Controls.Add(LoadControl("QuanLyNhomQuangCao_ThemMoi.ascx")); break;
                case "HienThi":
                    plNhomquangcaoloadcontrol.Controls.Add(LoadControl("QuanLyNhomQuangCao_HienThi.ascx")); break;
                default:
                    plNhomquangcaoloadcontrol.Controls.Add(LoadControl("QuanLyNhomQuangCao_HienThi.ascx")); break;
            }
        }
    }
}