using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.TinTuc
{
    public partial class TrangChuTinTuc : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ltrNhomTinTuc.Text = LayDanhMucTin();

            }
        }

        #region Lấy danh mục tin tức 
        private string LayDanhMucTin()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_MaDMCha("0");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += "<div class='sanphamnoibat'>";
                s += @"
                            <div class='tittle'>
                                <a class='titlehead' href='/GiaodienUser/UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=" + dt.Rows[i]["MaDM"] + @"'
                            title='" + dt.Rows[i]["TenDM"] + @"'>
                                <h3>" + dt.Rows[i]["TenDM"] + @"</h3>
                                </a>
                            </div>";
                s += "<div>";
                s += LayDanhSachTinTucTheoDanhMuc(dt.Rows[i]["MaDM"].ToString());
                s += "</div>";
                s += "<div style='clear:both'></div>";
                s += "</div>";
            }
            return s;
        }
        #endregion

        #region Lấy danh sách tin tức theo danh mục
        private string LayDanhSachTinTucTheoDanhMuc(string madm)
        {
            string s = "";
            string link = "";
            string motatin = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM(madm);

            if (dt.Rows.Count > 0)
            {
                motatin = dt.Rows[0]["MoTa"].ToString();
                if (motatin.Length > 150) { motatin = motatin.Substring(0, 150); }
                
                link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[0]["TinTucID"] + "&idmenu=" + madm;

                s += @"
<div class='item'>
                <a id='imagess' href='" + link + @"' title='" + dt.Rows[0]["TieuDe"] + @"'>
                <div class='khungAnh'>
                    <div class='khungAnhCrop'>                         
                                    <img class='tall' src='/pic/TinTuc/" + dt.Rows[0]["AnhDaiDien"] + @"' alt='" + dt.Rows[0]["TieuDe"] + @"' />               
                    </div>                             
                </div>
                </a>
             <div class='content'>
                    <div class='date'>Ngày đăng: " + dt.Rows[0]["NgayDang"] + @"</div>
                    <div class='date'>Lượt xem: " + dt.Rows[0]["LuotXem"] + @"</div>
                   <a class='title' href='" + link + @"' title='" + dt.Rows[0]["TieuDe"] + @"'>" + dt.Rows[0]["TieuDe"] + @"</a>
                    <div class='mota2'>
                       " +motatin+ @"...
                    <a class='detail' href='" + link + @"' title='" + dt.Rows[0]["TieuDe"] + @"'>Xem thêm</a>
                    </div>
                </div>
            </div>";

                for (int i = 1; i < dt.Rows.Count; i++)
                {
                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[i]["TinTucID"] + "&idmenu=" + madm;
                    s += @"
                        <a class='titlel' href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>
                            " + dt.Rows[i]["TieuDe"] + @"
                            <span>" + ((DateTime)dt.Rows[i]["NgayDang"]).ToString("dd/MM/yyyy") + @"</span>
                        </a>
                    ";
                }
            }
            return s;
        }
        #endregion
    }
}