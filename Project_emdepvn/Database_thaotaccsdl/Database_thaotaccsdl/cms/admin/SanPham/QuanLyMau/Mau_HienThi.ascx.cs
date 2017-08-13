using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyMau
{
    public partial class Mau_HienThi : System.Web.UI.UserControl
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
                LayMau();
        }
        private void LayMau()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Mau.ThongTin_Mau();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dt2 = new DataTable();
                dt2 = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaMau_TatCa(dt.Rows[i]["MauID"].ToString());
                ltrMau.Text += @"
        <tr id='maDong_" + dt.Rows[i]["MauID"] + @"'>
            <td class='cotMa'>" + dt.Rows[i]["MauID"] + @"</td>
            <td class='cotmail'>" + dt.Rows[i]["TenMau"] + @"</td>
            <td class='cotmail'>" + dt2.Rows.Count + @"</td>
            <td class='cotCongCu'>
                <a href='/Admin.aspx?module=SanPham&submodule=Mau&action=ChinhSua&id=" + dt.Rows[i]["MauID"] + @"' class='sua' title='Sửa'></a>
                <a href=javascript:XoaMau('" + dt.Rows[i]["MauID"] + @"') class='xoa' title='Xóa'></a>
            </td> 
        </tr>";
            }
        }
    }
}