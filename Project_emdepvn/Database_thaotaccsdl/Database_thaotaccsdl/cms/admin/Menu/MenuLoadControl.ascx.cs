using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.Menu
{
    public partial class MenuLoadControl : System.Web.UI.UserControl
    {
        private string action = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["module"].Equals("Menu"))
            {
                if (Request.QueryString["action"] != null)
                {
                    action = Request.QueryString["action"];
                }
                switch (action)
                {
                    case "ThemMenu":
                    case "ChinhSua":
                        plMenuLoadControl.Controls.Add(LoadControl("Menu_ThemMoi.ascx"));
                        break;
                    case "DanhSachMenu":
                        plMenuLoadControl.Controls.Add(LoadControl("Menu_HienThi.ascx"));
                        break;
                    default:
                        plMenuLoadControl.Controls.Add(LoadControl("Menu_HienThi.ascx"));
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