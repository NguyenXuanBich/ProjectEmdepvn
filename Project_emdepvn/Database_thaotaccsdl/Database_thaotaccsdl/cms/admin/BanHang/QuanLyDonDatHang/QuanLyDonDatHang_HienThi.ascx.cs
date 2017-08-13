using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.BanHang.QuanLyDonDatHang
{
    public partial class QuanLyDonDatHang_HienThi : System.Web.UI.UserControl
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
                LayDanhSachDonHang();
            }
        }

        private void LayDanhSachDonHang()
        {

            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DonDatHang.Thongtin_DonDatHang();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string tinhtrang = dt.Rows[i]["TinhTrangDonHang"].ToString();
                if (tinhtrang.Trim() == "1") tinhtrang = "Đã thanh toán";
                else if (tinhtrang.Trim() == "0") tinhtrang = "Không thành công"; else tinhtrang = "Chưa thanh toán";
                ltrDanhSach.Text += @" <tr id='MaDong_" + dt.Rows[i]["MaDonDatHang"] + @"'>
            <td>" + dt.Rows[i]["MaDonDatHang"] + @"</td>
            <td>" + dt.Rows[i]["NgayTao"] + @"</td>
            <td>" + dt.Rows[i]["ThanhTienDH"] + @"</td>
            <td>" + tinhtrang + @"</td>
            <td>" + dt.Rows[i]["MaKH"] + @"</td>            
            <td>" + dt.Rows[i]["TenKH"] + @"</td>
            <td>" + dt.Rows[i]["sdtKH"] + @"</td> 
            <td>" + dt.Rows[i]["EmailKH"] + @"</td>           

            <td class='cotCongCu'>";

                ltrDanhSach.Text += @"<a href='Admin.aspx?module=BanHang&submodule=QLDonDatHang&action=ChiTiet&id=" + dt.Rows[i]["MaDonDatHang"] + @"' class='dmcon' title='Xem chi tiết đơn'>&nbsp</a>
                <a href='javascript:XoaDonDatHang(" + dt.Rows[i]["MaDonDatHang"] + @")' class='xoa' title='Xóa'>&nbsp</a>
            </td>
        </tr>";
            }
        }
    }
}