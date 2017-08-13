using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.BanHang.QuanLyHoaDon
{
    public partial class QuanLyHoaDon_HienThi : System.Web.UI.UserControl
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
                LayDanhSachHD();
            }
        }

        private void LayDanhSachHD()
        {

            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.HoaDon.Thongtin_HoaDon();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ltrDanhSach.Text += @" <tr id='MaDong_" + dt.Rows[i]["MaHD"] + @"'>
            <td>" + dt.Rows[i]["MaHD"] + @"</td>
            <td>" + dt.Rows[i]["NgayLap"] + @"</td>
            <td>" + dt.Rows[i]["ThanhTien"] + @"</td>
            <td>" + dt.Rows[i]["MaNV"] + @"</td>
            <td>" + dt.Rows[i]["TenNV"] + @"</td>            
            <td>" + dt.Rows[i]["MaKH"] + @"</td>
            <td>" + dt.Rows[i]["TenKH"] + @"</td>          
            <td class='cotCongCu'>";

                ltrDanhSach.Text += @"<a href='Admin.aspx?module=BanHang&submodule=QLHoaDon&action=ChiTiet&id=" + dt.Rows[i]["MaHD"] + @"' class='dmcon' title='Xem chi tiết đơn'>&nbsp</a>
                <a href='javascript:Xoa(" + dt.Rows[i]["MaHD"] + @")' class='xoa' title='Xóa'>&nbsp</a>
            </td>
        </tr>";
            }
        }
    }
}