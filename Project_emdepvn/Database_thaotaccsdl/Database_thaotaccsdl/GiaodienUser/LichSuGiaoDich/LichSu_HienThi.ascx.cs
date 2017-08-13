using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.LichSuGiaoDich
{
    public partial class LichSu_HienThi : System.Web.UI.UserControl
    {
        private string ma = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MaKH"] != null) { ma = Session["MaKH"].ToString(); }
            if (!IsPostBack)
            {
                if (ma != "" && ma != null)
                    LayDanhSachDonHang(ma);
            }

        }

        private void LayDanhSachDonHang(string ma)
        {

            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DonDatHang.Thongtin_DonDatHang_By_maKhachHang(ma);
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

            <td class='cotCongCu'>";

                ltrDanhSach.Text += @"<a href='HistoryCustomer.aspx?action=ChiTiet&id=" + dt.Rows[i]["MaDonDatHang"] + @"' class='dmcon' title='Xem chi tiết đơn'>&nbsp</a>
       
            </td>
        </tr>";
            }
        }
    }
}