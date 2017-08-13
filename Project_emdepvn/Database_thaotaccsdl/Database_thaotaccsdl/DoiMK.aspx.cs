using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl
{
    public partial class DoiMK : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Kiểm tra nếu đã đăng nhập thì cho tiếp tục
            if (Session["DNKhachHang"] != null && Session["DNKhachHang"].ToString() == "1")
            {
                // đăng nhập rồi 
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Bạn chưa đăng nhập, hãy đăng nhập trước đã');location.href='/LoginUser.aspx';", true);

            }
        }
        //Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text))
        protected void lbtDoi_Click(object sender, EventArgs e)
        {
            if (Session["DNKhachHang"] != null && Session["DNKhachHang"].ToString() == "1")
            {
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang_By_Email_MatKhau(Session["EmailKH"].ToString(), Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMKCu.Text));
                if (dt.Rows.Count > 0)
                {
                    //Đăng nhập thành công -->tiến hành đổi cho khách mật khẩu mới
                    Database_thaotaccsdl.AppCode.Database.KhachHang.KhachHang_Update(Session["MaKH"].ToString(), Session["TenKh"].ToString(), Session["DiaChiKH"].ToString(), Session["sdtKH"].ToString(), Session["EmailKH"].ToString(), Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text));
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Đã đổi OK, bây giờ bạn cần đăng nhập lại nhé!');location.href='/LoginUser.aspx';", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Email hoặc mật khẩu không chính xác. " + Session["EmailKH"].ToString() + " có phải của bạn không?')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Bạn đăng xuất rồi, hãy đăng nhập trước đã');location.href='/LoginUser.aspx';", true);

            }
        }

        protected void lbtBack_Click(object sender, EventArgs e)
        {
            tbMatKhau.Text = "Set default";
            Response.Redirect("/GiaodienUser/UserPage.aspx");
        }
    }
}