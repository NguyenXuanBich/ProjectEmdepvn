using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLySanPham
{
    public partial class SanPham_HienThi : System.Web.UI.UserControl
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
            {
                LayDanhSachSanPham();
            }
        }
        //<td>" + dt.Rows[i]["NgayTao"] + @"</td>
        //<td>" + dt.Rows[i]["NgayHuy"] + @"</td>

        private void LayDanhSachSanPham()
        {
            //1
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string ten = dt.Rows[i]["TenSP"].ToString();
                if (ten.Length > 30) ten = ten.Substring(0, 30);
                ltrDanhSachSanPham.Text += @" <tr id='MaDong_" + dt.Rows[i]["MaSP"] + @"'>
            <td>" + dt.Rows[i]["MaSP"] + @"</td>
            <td>" + ten + @"</td>
            <td class='cotAnh'>

             <img class='anhdaidien' src='/pic/SanPham/" + dt.Rows[i]["AnhSP"] + @"'/>
             <img class='anhdaidienhover' src='/pic/SanPham/" + dt.Rows[i]["AnhSP"] + @"'/></td>

            <td>" + dt.Rows[i]["MauID"] + @"</td>
            <td>" + dt.Rows[i]["SizeID"] + @"</td>
            <td>" + dt.Rows[i]["ChatLieuID"] + @"</td>            
            <td>" + dt.Rows[i]["SoLuongSP"] + @"</td>
            <td>" + dt.Rows[i]["GiaSP"] + @"</td> 
            <td>" + dt.Rows[i]["GiaNhapSP"] + @"</td>           

            <td class='cotCongCu'>";

                ltrDanhSachSanPham.Text += @"<a href='Admin.aspx?module=SanPham&submodule=QLSanPham&action=ChinhSua&id=" + dt.Rows[i]["MaSP"] + @"' class='sua' title='Sửa'>&nbsp</a>
                <a href='javascript:XoaSanPham(" + dt.Rows[i]["MaSP"] + @")' class='xoa' title='Xóa'>&nbsp</a>
            </td>
        </tr>";
            }
        }
    }
}