using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.GiaodienUser.SanPham
{
    public partial class SanPhamHienThiGioHang : System.Web.UI.UserControl
    {
        #region Khai báo các biến lấy ra thông tin khách hàng
        protected string hoten = "";
        protected string diachi = "";
        protected string sodienthoai = "";
        protected string email = "";
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GetUserInfoHasLogin();
        }

        private void GetUserInfoHasLogin()
        {
            //Đã đăng nhập thì chèn cái thông tin này vào textbox hộ người dùng ko thì thôi
            if (Session["DNKhachHang"] != null && Session["DNKhachHang"].ToString() == "1")
            {
                hoten = Session["TenKh"].ToString();
                diachi = Session["DiaChiKH"].ToString();
                sodienthoai = Session["sdtKH"].ToString();
                email = Session["EmailKH"].ToString();
            }
        }
    }
}