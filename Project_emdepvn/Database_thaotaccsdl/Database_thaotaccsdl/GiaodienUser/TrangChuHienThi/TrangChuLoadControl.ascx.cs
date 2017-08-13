using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Database_thaotaccsdl.GiaodienUser.TrangChuHienThi
{
    public partial class TrangChuLoadControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //ltSlide.Text = LayAnhSlide();
            ////ltrDMSanPham.Text = LayDMSanPham();
            //ltrNhomSanPham.Text = LayNhomSanPham();
            ltrTinXemNhieu.Text = Lay10TinTuc();
            ltrTinHot.Text = LayTinHot();
            ltquangcaotraitop.Text = LayQCtrai("6");
            ltrquangcaongang.Text = LayQCngang("13");
            ltrlifebig.Text = Lay1TinMoiRa("4");
            ltrlifesmall.Text = LayTinTucbyDM("4", 5);
            ltThitruong.Text = LayTinTucbyDM("5", 6);
            ltgiaitri.Text = LayTinTucbyDM("6",5);
            ltthoitrang.Text = LayTinTucbyDM("1", 5);
            ltlamdep.Text = LayTinTucbyDM("2", 5);
            ltchoi.Text=LayTinTucbyDM("9", 5);
            ltanngon.Text=LayTinTucbyDM("8", 5);
            ltsuckhoe.Text = LayTinTucbyDM("7", 5);
        }


        private string Lay1TinMoiRa(string ma)
        {
            {
                string s = "";
                string link = "";
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM_MoiNhat(ma);
                if (dt.Rows.Count > 0)
                {
                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[0]["TinTucID"];
                    s += @"<div class='lifebigphoto'><div class='itemlifebigphoto'>
                <div class='khungAnh'style='height: 100%'>
                   <a class='khungAnhCrop' href='" + link + @"' title='" + dt.Rows[0]["TieuDe"] + @"'> <img alt='" + dt.Rows[0]["TieuDe"] + @"' src='/pic/TinTuc/" + dt.Rows[0]["AnhDaiDien"] + @"' /> </a>
                </div></div></div>
                            <div class='lifebignoidung'><a class='title' href='" + link + @"' title='" + dt.Rows[0]["TieuDe"] + @"'>" + dt.Rows[0]["TieuDe"] + @"</a>
                                <span class='ngaydang'>" + dt.Rows[0]["NgayDang"] + @"</span>
                            </div>";
                }
                return s;
            }
        }
        #region Lấy q cáo ngang
        private string LayQCngang(string ma)
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID(ma);
            s += @"<a class='khungAnhCrop' href='" + dt.Rows[0]["LienKet"] + @"' title='Pic 1'> <img alt='" + dt.Rows[0]["TenQC"] + @"' src='/pic/QuangCao/" + dt.Rows[0]["AnhQC"] + @"' /> </a>";


            return s;
        }
        #endregion

        #region Lấy ra tin hot mới nhất
        private string LayTinHot()
        {
            string s = "";
            string link = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.ThongTin_TinTuc_ByMoiNhat();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[i]["TinTucID"];
                    s += @"<div class='item'> <div class='khungAnhhot'><a class='khungAnhhotCrop' href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>
                                             <img data-u='image' src='/pic/TinTuc/" + dt.Rows[i]["AnhDaiDien"] + @"' />
                                        </a>
                                         <div class='more'>
                                        <a class='title' href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>" + dt.Rows[i]["TieuDe"] + @"</a>
                                        <a class='learnmore'  href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>Xem chi tiết</a>
                                    </div>
                                    </div>                                  
                                </div>";
                }
            }

            return s;
        }
        #endregion

        #region lấy 10 tin xem nhiều
        private string Lay10TinTuc()
        {
            string s = "";
            string link = "";
            DataTable dt = new DataTable();
            //dt = Database_thaotaccsdl.AppCode.Database.TinTuc.ThongTin_TinTuc_ByLuotXem();
            //if (dt.Rows.Count > 0)
            //{
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.ThongTin_TinTuc_ByLuotXem();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[i]["TinTucID"];
                    s += @"
                        <a class='titlel' href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>
                            " + dt.Rows[i]["TieuDe"] + @"
                            <span class='tinxemnhieuNgayDang'>" + ((DateTime)dt.Rows[i]["NgayDang"]).ToString("dd/MM/yyyy") + @"</span>
                        </a>
                    ";
                }
            }


            return s;
        }
        #endregion


        #region lấy số lượng  tin ngẫu nhiên theo mã danh mục
        private string LayTinTucbyDM(string ma, int soluong)
        {
            int s1;
            string s = "";
            string link = "";
            Random tintuc = new Random();
            //TenBienRandom.Next(GiaTriDau, GiaTriCuoi);
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM_TatCa(ma);
            if (dt.Rows.Count > 0 && dt.Rows.Count>= soluong)
            {
                List<int> list = new List<int>();
                int temp = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    list.Add(i);
                }

                for (int i = 0; i < soluong; i++)
                {
                    temp = tintuc.Next(list.Count);
                    s1 = list[temp];
                    list.RemoveAt(temp);
                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[s1]["TinTucID"];
                    s += @"
                    <div class='khoianhcon'>
                        <a class='photos1'  href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>
                                <img alt='" + dt.Rows[s1]["TieuDe"] + @"' src='/pic/TinTuc/" + dt.Rows[s1]["AnhDaiDien"] + @"' />
                        </a>
                        
                        <a class='titlel' style='padding-top:10px' href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>
                            " + dt.Rows[s1]["TieuDe"] + @"
                            <span class='tinxemnhieuNgayDang'>" + ((DateTime)dt.Rows[s1]["NgayDang"]).ToString("dd/MM/yyyy") + @"</span>
                        </a></div>
                    ";
                }
            }


            return s;
        }
        #endregion

        #region lấy số lượng  tin ngẫu nhiên theo mã danh mục
        private string LayTinTucbyDMsmall(string ma, int soluong)
        {
            int s1;
            string s = "";
            string link = "";
            Random tintuc = new Random();
            //TenBienRandom.Next(GiaTriDau, GiaTriCuoi);
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM(ma);
            if (dt.Rows.Count > 0)
            {
                List<int> list = new List<int>();
                int temp = 0;
                for (int i = 0; i < soluong; i++)
                {
                    list.Add(i);
                }

                for (int i = 0; i < soluong; i++)
                {
                    temp = tintuc.Next(list.Count);
                    s1 = list[temp];
                    list.RemoveAt(temp);
                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[s1]["TinTucID"];
                    s += @"
                    <div class='khoianhcon small'>
                        <a class='photos1 small'  href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>
                                <img alt='" + dt.Rows[s1]["TieuDe"] + @"' src='/pic/TinTuc/" + dt.Rows[s1]["AnhDaiDien"] + @"' />
                        </a>
                        
                        <a class='title1 small' style='padding-top:10px' href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>
                            " + dt.Rows[s1]["TieuDe"] + @"
                            <span class='tinxemnhieuNgayDang small'>" + ((DateTime)dt.Rows[s1]["NgayDang"]).ToString("dd/MM/yyyy") + @"</span>
                        </a></div>
                    ";
                }
            }


            return s;
        }
        #endregion

        #region Lấy QC rìa trái trên cùng
        private string LayQCtrai(string ma)
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID(ma);
            s += @"<a class='khungAnhCrop' href='" + dt.Rows[0]["LienKet"] + @"' title='Pic 1'> <img alt='" + dt.Rows[0]["TenQC"] + @"' src='/pic/QuangCao/" + dt.Rows[0]["AnhQC"] + @"' /> </a>";


            return s;
        }
        #endregion

        #region Lay anh slide
        private string LayAnhSlide()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID("5");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += @"<div class='eachproduce'>
                            <div class='item1'>
                                <div class='khungAnh1'>
                                    <a href='#' class='khungAnhCrop1'><img data-u='image' src='/pic/Slide/" + dt.Rows[i]["AnhQC"] + @"' /></a>
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