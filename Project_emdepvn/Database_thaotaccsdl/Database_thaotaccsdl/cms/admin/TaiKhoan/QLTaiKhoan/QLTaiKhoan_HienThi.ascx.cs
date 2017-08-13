using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.TaiKhoan.QLTaiKhoan
{
    public partial class QLTaiKhoan_HienThi : System.Web.UI.UserControl
    {
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
            if (!IsPostBack)
                LayTaiKhoan();
        }
        private void LayTaiKhoan()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TaiKhoan.ThongTin_TaiKhoan();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                 DataTable dt2 = new DataTable();
                 dt2 = Database_thaotaccsdl.AppCode.Database.QuyenDangNhap.Thongtin_QuyenDangNhap_By_Id(dt.Rows[i]["MaQuyen"].ToString());
                 string quyen = dt2.Rows[0]["TenQuyen"].ToString();
                ltrTaiKhoan.Text += @"
        <tr id='maDong_" + dt.Rows[i]["TenDangNhap"] + @"'>
            <td class='cottenDN'>" + dt.Rows[i]["TenDangNhap"] + @"</td>
            <td class='cotmail'>" + dt.Rows[i]["EmailDK"] + @"</td>
            <td class='cotdiachi'>" + dt.Rows[i]["DiaChiDK"] + @"</td>
            <td class='cothoten'>" + dt.Rows[i]["TenDayDu"] + @"</td>
            <td class='cotngaysinh'>" + dt.Rows[i]["NgaySinh"] + @"</td>
            <td class='cotgioitinh'>" + dt.Rows[i]["GioiTinhDK"] + @"</td>
            <td class='cotgioitinh'>" + quyen + @"</td>
            <td class='cotCongCu'>
                <a href='/Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan&action=ChinhSua&id=" + dt.Rows[i]["TenDangNhap"] + @"' class='sua' title='Sửa'></a>
                <a href=javascript:XoaTaiKhoan('" + dt.Rows[i]["TenDangNhap"] + @"') class='xoa' title='Xóa'></a>
            </td> 
        </tr>";
            }
        }
    }
}