using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.TimKiem
{
    public partial class KetQuaTimKiem : System.Web.UI.UserControl
    {
        private string info = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Info"] != null)
            {
                info = Request.QueryString["Info"];
                ltrKQSearchByAll.Text = LayKetQua(info);
            }
        }

        private string LayKetQua(string info)
        {
            string s = "";
            string link = "";
            DataTable dtSanPham = new DataTable();
            DataTable dtTinTuc = new DataTable();
            dtSanPham = Database_thaotaccsdl.AppCode.Database.TimKiem.SearchTinTucByAll(info);
            dtTinTuc = Database_thaotaccsdl.AppCode.Database.TimKiem.SearchTinTucTinTucByAll(info);
            s += @"<span style='text-align:center;display: block; color:#808080'>Tìm thấy " + dtSanPham.Rows.Count.ToString() + @" sản phẩm và " + dtTinTuc.Rows.Count.ToString() + @" tin tức có chứa ký tự '" + info + "'</span>";
            if (dtSanPham.Rows.Count > 0)
            {
                s += @"<div class='boundSanPham'>";
                s += @"<div class='tittle'><h3>Kết quả tìm kiếm sản phẩm cho  '" + info + "' :</h3>có " + dtSanPham.Rows.Count.ToString() + @" kết quả được tìm thấy</div>";
                for (int i = 0; i < dtSanPham.Rows.Count; i++)
                {
                    link = "UserPage.aspx?modul=SanPham&modulcon=ChiTietSP&id=" + dtSanPham.Rows[i]["MaSP"];

                    s += @"<div class='itemnhomsp'>
                                        <a id='imagess' href='" + link + @"' title='" + dtSanPham.Rows[i]["TenSP"] + @"'>
                                        <div class='khungAnh'>
                                            <div class='khungAnhCrop'>                         
                                                            <img class='tall' src='/pic/SanPham/" + dtSanPham.Rows[i]["AnhSP"] + @"' alt='" + dtSanPham.Rows[i]["TenSP"] + @"' />                           
                                            </div>                             
                                        </div>
                                        </a>
                                        <div class='content'>
                                            <div class='date'>Ngày đăng:" + dtSanPham.Rows[i]["NgayTao"] + @"</div>
                                           <a class='title' href='" + link + @"' title='" + dtSanPham.Rows[i]["TenSP"] + @"'>
                                                            " + dtSanPham.Rows[i]["TenSP"] + @"
                                                        </a>
                                            <div class='mota'> Giá sản phẩm : " + dtSanPham.Rows[i]["GiaSP"] + @" đồng </div>
                                            <div class='mota2'>
                                                Mô tả sản phẩm : " + dtSanPham.Rows[i]["MotaSP"] + @"
                                            </div>
                                        </div>
                        
                                    </div>";
                }
                s += @"</div>";
            }
            if (dtTinTuc.Rows.Count > 0)
            {
                s += @"<div class='boundSanPham'>";
                s += @"<div class='tittle'><h3>Kết quả tìm kiếm tin tức cho  '" + info + "' :</h3>có " + dtTinTuc.Rows.Count.ToString() + @" kết quả được tìm thấy</div>";
                for (int i = 0; i < dtTinTuc.Rows.Count; i++)
                {

                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dtTinTuc.Rows[i]["TinTucID"];
                    s += @"<div class='itemnhomtt'>
                                           <a id='imagess' href='" + link + @"' title='" + dtTinTuc.Rows[0]["TieuDe"] + @"'>
                                        <div class='khungAnh'>
                                            <div class='khungAnhCrop'>                         
                                                            <img class='tall' src='/pic/TinTuc/" + dtTinTuc.Rows[i]["AnhDaiDien"] + @"' alt='" + dtTinTuc.Rows[i]["TieuDe"] + @"' />
                                            </div>                             
                                        </div>
                                        </a>
                                         <div class='content'>
                                            <div class='date'>Ngày đăng: " + dtTinTuc.Rows[i]["NgayDang"] + @"</div>
                                            <div class='date'>Lượt xem: " + dtTinTuc.Rows[i]["LuotXem"] + @"</div>
                                           <a class='title' href='" + link + @"' title='" + dtTinTuc.Rows[i]["TieuDe"] + @"'>" + dtTinTuc.Rows[i]["TieuDe"] + @"</a>
                                            <div class='mota2'>
                                               " + dtTinTuc.Rows[i]["MoTa"] + @"...
                                            <a class='detail' href='" + link + @"' title='" + dtTinTuc.Rows[i]["TieuDe"] + @"'>Xem thêm</a>
                                            </div>
                                        </div>
                        
                                    </div>";
                }
                s += @"</div>";
            }
            if (dtSanPham.Rows.Count == 0 && dtTinTuc.Rows.Count == 0)
            {
                s += @"<h1 style='text-align:center; color:gray'>Không tìm thấy '" + info + "' trong bất kỳ tài liệu nào</h1><br />";
                s += @"<span style='text-align:center;display: block; color:#808080'>Chắc chắn rằng đã nhập đúng chính tả và không có chứa ký tự đặc biệt trong nội dung cần tìm ??</span>";
            }


            return s;
        }

    }
}