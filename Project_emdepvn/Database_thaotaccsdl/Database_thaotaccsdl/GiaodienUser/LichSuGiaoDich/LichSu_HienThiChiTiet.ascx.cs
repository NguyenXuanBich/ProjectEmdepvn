using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.LichSuGiaoDich
{
    public partial class LichSu_HienThiChiTiet : System.Web.UI.UserControl
    {
        private string id = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            #region lấy request
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];

            #endregion
            if (!IsPostBack)
            {
                LayDonHang();
            }
        }

        private void LayDonHang()
        {

            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DonDatHang.Thongtin_DonDatHang_By_Id(id);
            string tinhtrang = dt.Rows[0]["TinhTrangDonHang"].ToString();
            if (tinhtrang.Trim() == "1") tinhtrang = "Đã thanh toán";
            else if (tinhtrang.Trim() == "0") tinhtrang = "Không thành công"; else tinhtrang = "Chưa thanh toán";
            lbMaDon.Text = dt.Rows[0]["MaDonDatHang"].ToString();
            lbNgayTao.Text = dt.Rows[0]["NgayTao"].ToString();
            lbThanhTien.Text = dt.Rows[0]["ThanhTienDH"].ToString();
            lbTinhTrang.Text = tinhtrang;
            lbMaKhachHang.Text = dt.Rows[0]["MaKH"].ToString();
            lbTenKhachHang.Text = dt.Rows[0]["TenKH"].ToString();
            lbSoDienThoai.Text = dt.Rows[0]["sdtKH"].ToString();
            lbEmailKhachHang.Text = dt.Rows[0]["EmailKH"].ToString();

            DataTable dt2 = new DataTable();
            dt2 = Database_thaotaccsdl.AppCode.Database.ChiTietDonDatHang.Thongtin_ChiTietDonDatHang_ByMaDon(id);

            for (int i = 0; i < dt2.Rows.Count; i++)
            {
                DataTable dt3 = new DataTable();
                dt3 = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(dt2.Rows[i]["MaSP"].ToString());
                ltrDanhSach.Text += @" <tr id='MaDong_" + dt2.Rows[i]["MaSP"] + @"'>
            <td>" + dt2.Rows[i]["MaSP"] + @"</td>
            <td>" + dt3.Rows[0]["TenSP"] + @"</td>
            <td>" + dt2.Rows[i]["SoLuongDat"] + @"</td>
            <td>" + dt2.Rows[i]["DonGiaDat"] + @"</td>                     
        </tr>";
            }
        }
    }
}