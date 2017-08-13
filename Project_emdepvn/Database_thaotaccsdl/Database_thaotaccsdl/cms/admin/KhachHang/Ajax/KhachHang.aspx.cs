using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.KhachHang.Ajax
{
    public partial class KhachHang : System.Web.UI.Page
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
            if (Request.Params["MaKH"] != null)
                ma = Request.Params["MaKH"];
            switch (action)
            {
                case "XoaKhachHang": XoaKhachHang(ma); break;
            }

        }


        private void XoaKhachHang(string ma)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.DonDatHang.Thongtin_DonDatHang_By_maKhachHang(ma);
            if (dt1.Rows.Count == 0)
            {
                Database_thaotaccsdl.AppCode.Database.KhachHang.KhachHang_Delete(ma);
                Response.Write(1);
            }
            else
                Response.Write(2);
        }
    }
}