using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.TinTuc
{
    public partial class DanhSachTinTuc : System.Web.UI.UserControl
    {
        private string id = "";
        private string idmenu = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
                id = Request.QueryString["id"];
            if (Request.QueryString["idmenu"] != null)
                idmenu = Request.QueryString["idmenu"];
            ltrDanhSachTinTucTheoMaDM.Text = LayNhomTinTucTheoMaDM();
        }

        private string LayNhomTinTucTheoMaDM()
        {
            string s = "";


            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_Id(idmenu);

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                s += "<div class='sanphamnoibat'>";
                s += @"
                            <div class='tittle'>
                                <h3>" + dt.Rows[i]["TenDM"] + @"</h3>
                            </div>";
                s += "<div>";
                s += LayDanhSachTinTucTheoDanhMuc(dt.Rows[i]["MaDM"].ToString());
                s += "</div>";
                s += "<div style='clear:both'></div>";
                s += "</div>";
            }
            return s;
        }
//        private string LayDanhSachTinTucTheoDanhMuc(string madm)
//        {
//            string s = "";
//            string link = "";
//            DataTable dt = new DataTable();
//            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM_TatCa(madm);
//            for (int i = 0; i < dt.Rows.Count; i++)
//            {
//                string motatin = dt.Rows[i]["MoTa"].ToString();
//                if (motatin.Length > 150) { motatin = motatin.Substring(0, 150); }
//                link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[i]["TinTucID"] + "&idmenu=" + madm;
//                s += @"<div class='itemnhomtt'>
//                   <a id='imagess' href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>
//                <div class='khungAnh'>
//                    <div class='khungAnhCrop'>                         
//                                    <img class='tall' src='/pic/TinTuc/" + dt.Rows[i]["AnhDaiDien"] + @"' alt='" + dt.Rows[i]["TieuDe"] + @"' />
//                    </div>                             
//                </div>
//                </a>
//                 <div class='content'>
//                    <div class='date'>Ngày đăng: " + dt.Rows[i]["NgayDang"] + @"</div>
//                    <div class='date'>Lượt xem: " + dt.Rows[i]["LuotXem"] + @"</div>
//                   <a class='title' href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>" + dt.Rows[i]["TieuDe"] + @"</a>
//                    <div class='mota2'>
//                       " +motatin+ @"...
//                    <a class='detail' href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>Xem thêm</a>
//                    </div>
//                </div>
//
//            </div>";
//            }
//            return s;
//        }

        private string LayDanhSachTinTucTheoDanhMuc(string madm)
        {
            string s = "";
            string link = "";
            DataTable dt = new DataTable();//helloKD
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM_TatCa(madm);
            List<int> list = new List<int>();
            Random tintuc = new Random();
            int temp = 0;
            int index = 0;
            int s1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                list.Add(i);
            }

            for (int i = index; i < dt.Rows.Count; i++)
            {
                if (index < 18)
                {
                    index += 1;
                    temp = tintuc.Next(list.Count);
                    s1 = list[temp];
                    list.RemoveAt(temp);
                    string motatin = dt.Rows[s1]["MoTa"].ToString();
                    if (motatin.Length > 150) { motatin = motatin.Substring(0, 150); }
                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[s1]["TinTucID"] + "&idmenu=" + madm;
                    s += @"<div class='itemnhomtt'>
                   <a id='imagess' href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>
                <div class='khungAnh'>
                    <div class='khungAnhCrop'>                         
                                    <img class='tall' src='/pic/TinTuc/" + dt.Rows[s1]["AnhDaiDien"] + @"' alt='" + dt.Rows[s1]["TieuDe"] + @"' />
                    </div>                             
                </div>
                </a>
                 <div class='content'>
                    <div class='date'>Ngày đăng: " + dt.Rows[s1]["NgayDang"] + @"</div>
                    <div class='date'>Lượt xem: " + dt.Rows[s1]["LuotXem"] + @"</div>
                   <a class='title' href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>" + dt.Rows[s1]["TieuDe"] + @"</a>
                    <div class='mota2'>
                       " + motatin + @"...
                    <a class='detail' href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>Xem thêm</a>
                    </div>
                </div>

            </div>";
                }
            }
            return s;
        }
        
    }
}