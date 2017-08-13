using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.BanHang.QuanLyHoaDon
{
    public partial class DoanhThu : System.Web.UI.UserControl
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
                Laythongtin();
            }
        }

        private void Laythongtin()
        {
            //Lấy tổng lượng SP
            DataTable sanpham = new DataTable();
            int tongsp = 0;
            sanpham = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham();
            for (int i = 0; i < sanpham.Rows.Count; i++)
            {
                tongsp = tongsp + Convert.ToInt32(sanpham.Rows[i]["SoLuongSP"]);
            }

            //Lấy tổng giá nhập
            DataTable giasanpham = new DataTable();
            int tonggiasanphamsp = 0;
            sanpham = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham();
            for (int i = 0; i < sanpham.Rows.Count; i++)
            {
                tonggiasanphamsp = tonggiasanphamsp + Convert.ToInt32(sanpham.Rows[i]["GiaSP"]);
            }

            //Lấy số SP đã bán và tổng giá bán
            DataTable sanphamdaban = new DataTable();
            int tongspdaban = 0;
            int tonggiadaban = 0;
            int tonglai = 0;
            sanphamdaban = Database_thaotaccsdl.AppCode.Database.HoaDon.Thongtin_HoaDon();
            for (int i = 0; i < sanphamdaban.Rows.Count; i++)
            {
                DataTable sanphamdaban2 = new DataTable();
                sanphamdaban2 = Database_thaotaccsdl.AppCode.Database.ChiTietHoaDon.Thongtin_ChiTietHoaDon(sanphamdaban.Rows[i]["MaHD"].ToString());
                for (int i1 = 0; i1 < sanphamdaban2.Rows.Count; i1++)
                {
                    DataTable dtlaygianhap = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(sanphamdaban2.Rows[i1]["MaSP"].ToString());
                    int gianhap = Convert.ToInt32(dtlaygianhap.Rows[0]["GiaNhapSP"]);
                    tongspdaban = tongspdaban + Convert.ToInt32(sanphamdaban2.Rows[i1]["SoLuong"]);
                    tonggiadaban = tonggiadaban + (Convert.ToInt32(sanphamdaban2.Rows[i1]["DonGia"]) * (Convert.ToInt32(sanphamdaban2.Rows[i1]["SoLuong"])));
                    tonglai = tonglai + ((Convert.ToInt32(sanphamdaban2.Rows[i1]["DonGia"]) - gianhap) *(Convert.ToInt32(sanphamdaban2.Rows[i1]["SoLuong"])) );
                }
            }

            // đổ dữ liệu ra           
            lbtongsp.Text = tongsp.ToString();
            lssospdatmua.Text = tongspdaban.ToString();
            lbtonggianhap.Text = tonggiasanphamsp.ToString();
            tbtongthunhap.Text = tonggiadaban.ToString();
            lblai.Text = tonglai.ToString();



        }
    }
}