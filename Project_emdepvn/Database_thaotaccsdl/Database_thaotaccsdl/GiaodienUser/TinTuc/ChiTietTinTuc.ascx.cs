using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.TinTuc
{

    public partial class ChiTietTinTuc : System.Web.UI.UserControl
    {
        private string id = "";
        private string luotxem = "";
        private int soluot;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                id = Request.QueryString["id"];
                if (!IsPostBack)
                    LayThongTinChiTietTinTuc(id);
                LayThemTinTuc(id);
                ltrTinLienQuan.Text = LayTinTucbyDM(id, 6);
                soluot = soluot + 1;
                UpdateSoLuotXem(soluot.ToString(), id);
                facebook.Text = "<div class='fb-comments' data-href='UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id="+id+"' data-numposts='10' data-width='100%' data-colorscheme='light'></div>";
            }
        }

        private void UpdateSoLuotXem(string countnumber, string id)
        {
            Database_thaotaccsdl.AppCode.Database.TinTuc.LuotXem_Update(countnumber, id);
        }
        // cũ
//        #region lấy số lượng  tin ngẫu nhiên theo mã danh mục truyền vào mã tin
//        private string LayTinTucbyDM(string maid, int soluong)
//        {
//            int s1;
//            string s = "";
//            string link = "";
//            string ma = "";
//            Random tintuc = new Random();
//            //TenBienRandom.Next(GiaTriDau, GiaTriCuoi);
//            DataTable dt2 = new DataTable();
//            dt2 = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_Id(id);
//            if (dt2.Rows.Count > 0)
//            {
//                ma = dt2.Rows[0]["MaDM"].ToString();
//            }
//            DataTable dt = new DataTable();
//            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM(ma);

//            //lấy tên
//            DataTable dtten = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_Id(dt.Rows[0]["MaDM"].ToString());
//            ltrTenChuyenMuc.Text = dtten.Rows[0]["TenDM"].ToString();

//            if (dt.Rows.Count > 0 && dt.Rows.Count >= soluong)
//            {
//                List<int> list = new List<int>();
//                int temp = 0;
//                for (int i = 0; i < soluong; i++)
//                {
//                    list.Add(i);
//                }

//                for (int i = 0; i < soluong; i++)
//                {
//                    temp = tintuc.Next(list.Count);
//                    s1 = list[temp];
//                    list.RemoveAt(temp);
//                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[s1]["TinTucID"];
//                    s += @"
//                        <a class='titlel' href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>
//                            " + dt.Rows[s1]["TieuDe"] + @"
//                            <span class='tinxemnhieuNgayDang'>" + ((DateTime)dt.Rows[i]["NgayDang"]).ToString("dd/MM/yyyy") + @"</span>
//                        </a>
//                    ";
//                }
//            }


//            return s;
//        }
//        #endregion
        //mới
        #region lấy số lượng  tin ngẫu nhiên theo mã danh mục truyền vào mã tin
        private string LayTinTucbyDM(string maid, int soluong)
        {
            int s1;
            string s = "";
            string link = "";
            string ma = "";
            Random tintuc = new Random();
            //TenBienRandom.Next(GiaTriDau, GiaTriCuoi);
            DataTable dt2 = new DataTable();
            dt2 = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_Id(id);
            if (dt2.Rows.Count > 0)
            {
                ma = dt2.Rows[0]["MaDM"].ToString();
            }
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM_TatCa(ma);

            //lấy tên
            DataTable dtten = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_Id(dt.Rows[0]["MaDM"].ToString());
            ltrTenChuyenMuc.Text = dtten.Rows[0]["TenDM"].ToString();

            List<int> list = new List<int>();
            int temp = 0;
            int index = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                list.Add(i);
            }

            for (int i = index; i < dt.Rows.Count; i++)
            {
                if (index < soluong)
                {
                    index += 1;
                    temp = tintuc.Next(list.Count);
                    s1 = list[temp];
                    list.RemoveAt(temp);
                    link = "UserPage.aspx?modul=TinTuc&modulcon=ChiTietTinTuc&id=" + dt.Rows[s1]["TinTucID"];
                    s += @"
                        <a class='titlel' href='" + link + @"' title='" + dt.Rows[s1]["TieuDe"] + @"'>
                            " + dt.Rows[s1]["TieuDe"] + @"
                            <span class='tinxemnhieuNgayDang'>" + ((DateTime)dt.Rows[i]["NgayDang"]).ToString("dd/MM/yyyy") + @"</span>
                        </a>
                    ";
                }

            }



            return s;
        }
        #endregion
        private string LayThemTinTuc(string id)
        {
            string s = "";
            string link = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_Id(id);
            if (dt.Rows.Count > 0)
            {
                luotxem = dt.Rows[0]["LuotXem"].ToString();
                soluot = int.Parse(luotxem);
                dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM(dt.Rows[0]["MaDM"].ToString());
                //lấy tên
                DataTable dtten = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_Id(dt.Rows[0]["MaDM"].ToString());
                ltrTenChuyenMuc.Text = dtten.Rows[0]["TenDM"].ToString();

                if (dt.Rows.Count > 0 && dt.Rows.Count <= 6)
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
                if (dt.Rows.Count > 6)
                {
                    for (int i = 0; i < 6; i++)
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
            }

            return s;

        }

        private void LayThongTinChiTietTinTuc(string id)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_Id(id);
            if (dt.Rows.Count > 0)
            {
                ltrAnhTinTuc.Text = "<div class='item3'><div class='khungAnh3'><a class='khungAnh3Crop' href='#'><img src='/pic/TinTuc/" + dt.Rows[0]["AnhDaiDien"] + @"' alt='" + dt.Rows[0]["TieuDe"] + @"' /></a>
            </div>
        </div>";

                ltrTieuDeTin.Text = dt.Rows[0]["TieuDe"].ToString();
                ltrNoiDungTin.Text = dt.Rows[0]["ChiTiet"].ToString();
                ltrNgayDang.Text = dt.Rows[0]["NgayDang"].ToString();
                ltrLuotXem.Text = dt.Rows[0]["LuotXem"].ToString();

            }
        }
    }
}