using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.TaiKhoan
{
    public partial class DangKy : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btHuyBo_Click(object sender, EventArgs e)
        {
            XoagiatriTextbox(this);
            //Response.Redirect("UserPage.aspx");
        }
        protected void btQuayve_Click(object sender, EventArgs e)
        {
            XoagiatriTextbox(this);
            Response.Redirect("UserPage.aspx");
        }
        protected void btDangKy_Click(object sender, EventArgs e)
        {
            if (CheckEmail(tbEmail.Text)==true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Email này đã được dùng để đăng ký, vui lòng chọn cái khác')", true);
                tbEmail.Focus();
            }
            else if(tbMatKhau.Text==tbNhapLai.Text)
            {
                string matkhau = Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text);
                Database_thaotaccsdl.AppCode.Database.KhachHang.KhachHang_Insert(tbHoTen.Text, tbDiaChi.Text, tbSDT.Text, tbEmail.Text, matkhau, "");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Đăng ký thành công.');location.href='UserPage.aspx?modul=TaiKhoan&submodule=DangNhap';", true);
            }
            else {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Mật khẩu chưa trùng khớp, vui lòng gõ lại')", true);
                tbMatKhau.Focus();
            }
        }
        private bool CheckEmail(string email)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang_By_Email(email);
            if (dt.Rows.Count > 0)
                return true;
            else
                return false;
        }
        public static void XoagiatriTextbox(Control Parent)
        {

            foreach (Control mycontrols in Parent.Controls)
                if (mycontrols is TextBox)
                {

                    (mycontrols as TextBox).Text = string.Empty;

                }
        }
    }
}