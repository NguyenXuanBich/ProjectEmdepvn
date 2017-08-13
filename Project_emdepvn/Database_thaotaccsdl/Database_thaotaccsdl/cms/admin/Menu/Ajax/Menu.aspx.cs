using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.Menu.Ajax
{
    public partial class Menu : System.Web.UI.Page
    {
        private string action = "";
        private string ma = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Check validate
            //Kiểm tra nếu đã đăng nhập thì cho tiếp tục
            if (Session["DangNhap"] != null && Session["DangNhap"].ToString() == "1")
            {
                //đã đăng nhập
            }
            else
            {
                //Nếu chưa đăng nhập thì đẩy lại về trang login
                Response.Redirect("/Login.aspx");
            }
            #endregion
            if (Request.Params["ThaoTac"] != null) action = Request.Params["ThaoTac"];
            if (Request.Params["MaMenu"] != null)
                ma = Request.Params["MaMenu"];
            switch (action)
            {
                case "XoaMenu": XoaMenu(ma); break;
            }
        }

        private void XoaMenu(string ma)
        {
            DataTable dtkiemtratinhtrangcon = new DataTable();
            dtkiemtratinhtrangcon = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCha(ma);
            if (dtkiemtratinhtrangcon.Rows.Count == 0)
            {
                Database_thaotaccsdl.AppCode.Database.Menu.Menu_Delete(ma);
                Response.Write(1);
            }
            else
                Response.Write(2);
        }
    }
}