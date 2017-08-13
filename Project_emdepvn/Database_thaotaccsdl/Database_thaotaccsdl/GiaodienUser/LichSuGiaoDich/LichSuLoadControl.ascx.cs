using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.GiaodienUser.LichSuGiaoDich
{
    public partial class LichSuLoadControl : System.Web.UI.UserControl
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
                    plLichSuLoadControl.Controls.Add(LoadControl("LichSu_HienThiChiTiet.ascx")); break;
                default:
                    plLichSuLoadControl.Controls.Add(LoadControl("LichSu_HienThi.ascx")); break;
            }
        }
    }
}