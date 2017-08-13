using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.SanPham
{
    public partial class SanPhamHienThiDanhSach : System.Web.UI.UserControl
    {
        private string id = "";
        private string idmenu = "";
        private string sl = "";

        private string index = "0";
        private string chiso = "0";
        private string indexback = "0";
        string check = "invisible";
        string checkback = "invisible";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
                id = Request.QueryString["id"];
            if (Request.QueryString["index"] != null)
                index = Request.QueryString["index"];
            if (Request.QueryString["idmenu"] != null)
                idmenu = Request.QueryString["idmenu"];
            ltrDanhSachSanPhamTheoMaDM.Text = LayNhomSanPhamTheoMaDM(idmenu, index);
        }
//        #region Lấy nhóm sản phẩm theo mã danh mục
//        private string LayNhomSanPhamTheoMaDM()
//        {
//            string s = "";

            
//            DataTable dt = new DataTable();
//            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_ByID(idmenu);
            
//            for (int i = 0; i < dt.Rows.Count; i++)
//            {
                
//                s += "<div class='sanphamnoibat'>";
//                s += @"
//                            <div class='tittle'>
//                                <h3>" + dt.Rows[i]["TenDM"] + @"</h3>--
//                            " + LaySoLuongSP(dt.Rows[i]["MaDM"].ToString()) + @" sản phẩm
//
//                            </div>";
//                s += "<div>";
//                s += LayDanhSachSanPhamTheoDanhMuc(dt.Rows[i]["MaDM"].ToString());
//                s += "</div>";
//                s += "<div style='clear:both'></div>";
//                s += "</div>";
//            }
//            return s;
//        }
//        #endregion
//        //10080406
//        #region Lấy danh sách sản phẩm theo mã danh mục - tất cả
//        private string LaySoLuongSP(string madm)
//        {
//            DataTable dt = new DataTable();
//            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaDM_TatCa(madm);
//            if (dt.Rows.Count <= 5) { sl = "có" + dt.Rows.Count.ToString() + @" mã"; }
//            if (dt.Rows.Count >= 5) { sl = "có" + dt.Rows.Count.ToString() + @" mã"; }
//            if (dt.Rows.Count == 0) { sl = "đã hết hàng và sẽ cập nhật sớm nhất mã"; }
//            //sl = dt.Rows.Count.ToString();
//            return sl;
//        }
//        private string LayDanhSachSanPhamTheoDanhMuc(string madm)
//        {
//            string s = "";
//            string link = "";
//            DataTable dt = new DataTable();
//            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaDM_TatCa(madm);
//            if (dt.Rows.Count == 0) { s += @"<div class='thongbao'>Hiện tại đã hết hàng hoặc Không có sản phẩm nào trong danh mục này </div>"; }
//            for (int i = 0; i < dt.Rows.Count; i++)
//            {
//                sl = dt.Rows.Count.ToString();
//                link = "UserPage.aspx?modul=SanPham&modulcon=ChiTietSP&id=" + dt.Rows[i]["MaSP"];
//                s += @"<div class='itemnhomsp'>
//                <a id='imagess' href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
//                <div class='khungAnh'>
//                    <div class='khungAnhCrop'>                         
//                                    <img class='tall' src='/pic/SanPham/" + dt.Rows[i]["AnhSP"] + @"' alt='" + dt.Rows[i]["TenSP"] + @"' />                           
//                    </div>                             
//                </div>
//                </a>
//                <div class='content'>
//                    <div class='date'>Ngày đăng:" + dt.Rows[i]["NgayTao"] + @"</div>
//                   <a class='title' href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
//                                    " + dt.Rows[i]["TenSP"] + @"
//                                </a>
//                    <div class='mota'> Giá sản phẩm : " + dt.Rows[i]["GiaSP"] + @" đồng </div>
//                    <div class='mota2'>
//                        Mô tả sản phẩm : " + dt.Rows[i]["MotaSP"] + @"
//                    </div>
//                </div>
//
//            </div>";
//            }
//            return s;
//        }
//        #endregion

        #region Lấy nhóm sản phẩm theo mã danh mục
        private string LayNhomSanPhamTheoMaDM(string idmenu, string index)
        {
            string s = "";


            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_ByID(idmenu);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                //now
                s += "<div class='sanphamnoibat'>";
                s += @"
                            <div class='tittle'>
                                <h3>" + dt.Rows[i]["TenDM"] + @"</h3>--
                            " + LaySoLuongSP(dt.Rows[i]["MaDM"].ToString()) + @" sản phẩm

                            </div>";
                s += "<div>";
                s += LayDanhSachSanPhamTheoDanhMuc(dt.Rows[i]["MaDM"].ToString(), index);
                s += "</div>";

                s += "<div style='clear:both'></div>";
                s += "</div>";
                s += @" <div class='" + check + @"'>
                                <h3><a class='title' href='UserPage.aspx?modul=SanPham&modulcon=DSSanPham&idmenu=" + idmenu + @"&index=" + chiso + @"' title='quay lại'>               
                                Xem thêm</a></h3>
                            </div>";
                s += @" <div class='" + checkback + @"'>
                                <h3> <a class='title' href='UserPage.aspx?modul=SanPham&modulcon=DSSanPham&idmenu=" + idmenu + @"&index=" + indexback + @"' title='quay lại'>               
                                Quay lại</a></h3>
                            </div>";
            }
            return s;
        }
        #endregion

        #region Lấy danh sách sản phẩm theo mã danh mục - tất cả
        private string LaySoLuongSP(string madm)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaDM_TatCa(madm);
            if (dt.Rows.Count <= 5) { sl = "" + dt.Rows.Count.ToString() + @" mã"; }
            if (dt.Rows.Count >= 5) { sl = "" + dt.Rows.Count.ToString() + @" mã"; }
            if (dt.Rows.Count == 0) { sl = "đã hết hàng và sẽ cập nhật sớm nhất mã"; }
            //sl = dt.Rows.Count.ToString();
            return sl;
        }
        private string LayDanhSachSanPhamTheoDanhMuc(string madm, string index)
        {
            string s = "";
            string link = "";
            int index3 = int.Parse(index);
            int index4 = 0;
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaDM_TatCa(madm);
            //kiểm tra xem sản phẩm có còn ko để ẩn nút đi
            if (dt.Rows.Count == 0) { s += @"<div class='thongbao'>Hiện tại đã hết hàng hoặc Không có sản phẩm nào trong danh mục này </div>"; }
            if (dt.Rows.Count > 9) { check = "xemthem"; }
            if (dt.Rows.Count < 9) { check = "invisible"; }
            if ((dt.Rows.Count - int.Parse(index))<9) { check = "invisible"; }
            if (dt.Rows.Count - 1 <= int.Parse(index)) { check = "invisible"; }
            if (int.Parse(index) > 0) { checkback = "xemthem"; }

            for (int i = index3; i < dt.Rows.Count; i++)
            {
                if (index4 <= 8)
                {
                    index4 += 1;
                    sl = dt.Rows.Count.ToString();
                    link = "UserPage.aspx?modul=SanPham&modulcon=ChiTietSP&id=" + dt.Rows[i]["MaSP"];
                    s += @"<div class='itemnhomsp'>
                <a id='imagess' href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
                <div class='khungAnh'>
                    <div class='khungAnhCrop'>                         
                                    <img class='tall' src='/pic/SanPham/" + dt.Rows[i]["AnhSP"] + @"' alt='" + dt.Rows[i]["TenSP"] + @"' />                           
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

                    chiso = (int.Parse(index) + 9).ToString();
                    indexback = (int.Parse(index) - 9).ToString();
                    if (int.Parse(indexback) < 0) indexback = "0";
                }
            }


            return s;
        }
        #endregion
    }
}