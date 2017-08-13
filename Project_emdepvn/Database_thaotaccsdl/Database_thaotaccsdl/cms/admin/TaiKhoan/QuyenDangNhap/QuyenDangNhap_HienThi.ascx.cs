using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.TaiKhoan.QuyenDangNhap
{
    public partial class QuyenDangNhap_HienThi : System.Web.UI.UserControl
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
                LayQuyen();
        }
        private void LayQuyen()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuyenDangNhap.Thongtin_QuyenDangNhap();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dt2 = new DataTable();
                dt2 = Database_thaotaccsdl.AppCode.Database.TaiKhoan.Thongtin_TaiKhoan_By_MaQuyen(dt.Rows[i]["MaQuyen"].ToString());
                ltrQuyen.Text += @"
        <tr id='maDong_" + dt.Rows[i]["MaQuyen"] + @"'>
            <td class='cotMa'>" + dt.Rows[i]["MaQuyen"] + @"</td>
            <td class='cotmail'>" + dt.Rows[i]["TenQuyen"] + @"</td>
            <td class='cotmail'>" + dt2.Rows.Count + @"</td>
            <td class='cotCongCu'>
                <a href='/Admin.aspx?module=TaiKhoan&submodule=QuyenDangNhap&action=ChinhSua&id=" + dt.Rows[i]["MaQuyen"] + @"' class='sua' title='Sửa'></a>
                <a href=javascript:XoaQuyen('" + dt.Rows[i]["MaQuyen"] + @"') class='xoa' title='Xóa'></a>
            </td> 
        </tr>";
            }
        }
    }
}