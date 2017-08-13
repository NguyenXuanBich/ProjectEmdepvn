using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.BanHang.QuanLyHoaDon
{
    public partial class QuanLyHoaDon_HienThiChiTiet : System.Web.UI.UserControl
    {
        private string id = "";

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

            DataTable dt2 = new DataTable();
            dt2 = Database_thaotaccsdl.AppCode.Database.ChiTietHoaDon.Thongtin_ChiTietHoaDon(id);

            for (int i = 0; i < dt2.Rows.Count; i++)
            {
                DataTable dt3 = new DataTable();
                dt3 = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(dt2.Rows[i]["MaSP"].ToString());
                ltrDanhSach.Text += @" <tr id='MaDong_" + dt2.Rows[i]["MaHD"] + @"'>
            <td>" + dt2.Rows[i]["MaHD"] + @"</td>
            <td>" + dt2.Rows[i]["MaSP"] + @"</td>
            <td>" + dt3.Rows[0]["TenSP"] + @"</td>
            <td>" + dt2.Rows[i]["SoLuong"] + @"</td>
            <td>" + dt2.Rows[i]["DonGia"] + @"VND</td>                     
        </tr>";
            }
        }
    }
}