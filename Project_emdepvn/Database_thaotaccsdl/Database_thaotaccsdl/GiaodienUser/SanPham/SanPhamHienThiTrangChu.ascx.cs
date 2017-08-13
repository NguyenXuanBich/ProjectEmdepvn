using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.SanPham
{
    public partial class SanPhamHienThiTrangChu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ltSlide.Text = LayAnhSlide();
            //ltrDMSanPham.Text = LayDMSanPham();
            ltrNhomSanPham.Text = LayNhomSanPham();

        }

        #region Lay anh slide
        private string LayAnhSlide()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID("5");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    s += @"<div class='eachproduce'>
                            <div class='item1'>
                                <div class='khungAnh1'>
                                    <a href='#' class='khungAnhCrop1'><img data-u='image' src='/pic/QuangCao/" + dt.Rows[i]["AnhQC"] + @"' /></a>
                                </div>
                            </div>                     
                        </div> ";
                }
                return s;
            }
            else
            {
                s += @"<div class='eachproduce'>
                            <div class='item1'>
                                <div class='khungAnh1'>
                                   Không có ảnh
                                </div>
                            </div>                     
                        </div> ";

            }
            return s;
    
        }
        #endregion

        #region Lấy sản phẩm theo nhóm
        private string LayNhomSanPham()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.NhomSanPham.Thongtin_NhomSanPham();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dtsp = new DataTable();
                dtsp = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_NhomId(dt.Rows[i]["NhomID"].ToString(), dt.Rows[i]["SoSPHienThi"].ToString());
                if (dtsp.Rows.Count > 0)
                {
                    s += "<div class='sanphamnoibat'>";
                    s += @"
                            <div class='tittle'>
                                <h3>" + dt.Rows[i]["TenNhom"] + @"</h3>
                            </div>";
                    s += "<div>";
                    s += LayDanhSachSanPhamTheoNhom(dt.Rows[i]["NhomID"].ToString(), dt.Rows[i]["SoSPHienThi"].ToString());
                    s += "</div>";
                    s += "<div style='clear:both'></div>";
                    s += "</div>";
                }
             
            }
            return s;
        }
        #endregion

        #region Lấy danh sách sản phẩm theo nhóm
        private string LayDanhSachSanPhamTheoNhom(string nhomid, string sosphienthi)
        {
            string s = "";
            string link = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_NhomId(nhomid, sosphienthi);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                link = "UserPage.aspx?modul=SanPham&modulcon=ChiTietSP&id=" + dt.Rows[i]["MaSP"];
                s += @"<div class='item'>
                <a id='imagess' href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
                <div class='khungAnh'>
                    <div class='khungAnhCrop'>                         
                                    <img src='/pic/SanPham/" + dt.Rows[i]["AnhSP"] + @"' alt='" + dt.Rows[i]["TenSP"] + @"' />                           
                    </div>                             
                </div>
                </a>
                <div class='content'>
                    <div class='date'>Ngày đăng:" + dt.Rows[i]["NgayTao"] + @"</div>
                   <a class='title' href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
                                    " + dt.Rows[i]["TenSP"] + @"
                                </a>
                    <div class='mota'> Giá sản phẩm : " + dt.Rows[i]["GiaSP"] + @" đồng </div>
                    <div class='mota2'>
                        Mô tả sản phẩm : " + dt.Rows[i]["MotaSP"] + @"
                    </div>
                </div>
            </div>";
            }
            return s;
        }
        #endregion
    }
}