using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.TaiKhoan
{
    public partial class DangNhap : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtDangNhap_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang_By_Email_MatKhau(tbEmail.Text, Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text));
            if (dt.Rows.Count > 0)
            {
                //Đăng nhập thành công -->lưu giá trị vào session để đánh dấu là đã đăng nhập thành công
                Session["DNKhachHang"] = "1";
                Session["MaKH"] = dt.Rows[0]["MaKH"];
                Session["TenKh"] = dt.Rows[0]["TenKh"];
                Session["DiaChiKH"] = dt.Rows[0]["DiaChiKH"];
                Session["sdtKH"] = dt.Rows[0]["sdtKH"];
                Session["EmailKH"] = dt.Rows[0]["EmailKH"];

                Response.Redirect("UserPage.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Email hoặc mật khẩu không chính xác.')", true);
            }
        }

        protected void lbtBack_Click(object sender, EventArgs e)
        {
            
            tbEmail.Text = "Set default";
            tbMatKhau.Text = "Set default";
            Response.Redirect("UserPage.aspx");
        }
    }
}