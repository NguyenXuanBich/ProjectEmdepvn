using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Database_thaotaccsdl
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtDangNhap_Click(object sender, EventArgs e)
        {

            DataTable dt =Database_thaotaccsdl.AppCode.Database.TaiKhoan.Thongtin_TaiKhoan_By_Id_MatKhau(tbTenDangNhap.Text,Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text)); 
            if (dt.Rows.Count > 0)
            {
                //Đăng nhập thành công, lưu giá trị vào session để đánh dấu là đã ok
                Session["DangNhap"] = "1";
                //Gán thêm thông tin tài khoản đã đăng nhập thành công
                Session["TenDangNhap"] = dt.Rows[0]["TenDangNhap"];
                Session["MaQuyen"] = dt.Rows[0]["MaQuyen"];

                Response.Redirect("/Admin.aspx");
            }
            else
            {
                ltrThongBao.Text = "<div class='thongbao'>Tên đăng nhập hoặc mật khẩu không chính xác.</div>";
            }
        }
        protected void lbtBack_Click(object sender, EventArgs e)
        {         
                Response.Redirect("/GiaodienUser/UserPage.aspx");                     
        }
    }
}