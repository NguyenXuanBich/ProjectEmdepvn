using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.BanHang.QuanLyDonDatHang.Ajax
{
    public partial class DonDatHang : System.Web.UI.Page
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
            if (Request.Params["MaDonDatHang"] != null)
                ma = Request.Params["MaDonDatHang"];
            switch (action)
            {
                case "XoaDonDatHang": XoaDonDatHang(ma); break;
            }

        }


        private void XoaDonDatHang(string ma)
        {
                Database_thaotaccsdl.AppCode.Database.DonDatHang.DonDatHang_Delete(ma);
                Response.Write(1);
        }
    }
}