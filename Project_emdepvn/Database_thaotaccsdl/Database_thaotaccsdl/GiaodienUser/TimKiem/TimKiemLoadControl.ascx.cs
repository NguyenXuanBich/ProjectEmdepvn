using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.TimKiem
{
    public partial class TimKiemLoadControl : System.Web.UI.UserControl
    {
        private string info = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Info"] != null)
            {
                info = Request.QueryString["Info"];
                plSearchByAll.Controls.Add(LoadControl("KetQuaTimKiem.ascx"));
            }
         

        }
    }
}