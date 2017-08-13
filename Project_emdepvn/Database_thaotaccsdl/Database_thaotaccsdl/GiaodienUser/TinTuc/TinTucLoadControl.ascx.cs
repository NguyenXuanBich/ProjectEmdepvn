using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.TinTuc
{
    public partial class TinTucLoadControl : System.Web.UI.UserControl
    {
        private string modulcon = "";
        private string modul = "";
        private string id = "0";
        private string idmenu = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
                id = Request.QueryString["id"];
            if (Request.QueryString["idmenu"] != null)
                idmenu = Request.QueryString["idmenu"];
            if (Request.QueryString["modulcon"] != null)
                modulcon = Request.QueryString["modulcon"];
            switch (modulcon)
            {
                case "DanhSachTinTuc":
                    TinTucLoadCT.Controls.Add(LoadControl("DanhSachTinTuc.ascx"));
                    break;

                case "ChiTietTinTuc":
                    TinTucLoadCT.Controls.Add(LoadControl("ChiTietTinTuc.ascx"));
                    break;
                default:
                    TinTucLoadCT.Controls.Add(LoadControl("TrangChuTinTuc.ascx"));
                    break;
            }
            if (Request.QueryString["idmenu"] != null && idmenu == "0") TinTucLoadCT.Controls.Add(LoadControl("TrangChuTinTuc.ascx"));
            ltrDMTinTuc.Text = LayDMTinTuc(idmenu);
            #region Thay đổi menu sản phẩm hay tin tức
            if (Request.QueryString["modul"] != null)
                modul = Request.QueryString["modul"];
            if (modul == "TinTuc")
            {
                ltrDMSanPham.Visible = false;
                ltrDMTinTuc.Visible = true;
                if (idmenu == "0")
                ltrName.Text = "Danh Mục Tin Tức";

            }
            else
            {
                ltrDMSanPham.Visible = true;
                ltrDMTinTuc.Visible = false;
                ltrName.Text = "Danh Mục Sản Phẩm";

            }
            #endregion
            lthotnhattrongngay.Text = Lay10TinTuc();
        }
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
                        <a class='titlel' style='color:black !important' href='" + link + @"' title='" + dt.Rows[i]["TieuDe"] + @"'>
                            " + dt.Rows[i]["TieuDe"] + @"
                            <span class='tinxemnhieuNgayDang'>" + ((DateTime)dt.Rows[i]["NgayDang"]).ToString("dd/MM/yyyy") + @"</span>
                        </a>
                    ";
                }
            }


            return s;
        }
        #endregion



    #region Lấy danh mục tin
        private string LayDMTinTuc(string idmenu)
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_MaDMCha(idmenu);
            if (dt.Rows.Count <= 0) {
                DataTable dt1 = new DataTable();
                dt1 = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhmucTin_By_MaDMCon(idmenu);
                if (dt1.Rows.Count > 0)
                {
                    DataTable dt2 = new DataTable();
                    dt2 = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhmucTin_By_MaDMCon(dt1.Rows[0]["MaDMCha"].ToString());
                    if (dt1.Rows[0]["MaDMCha"].ToString() == "0") s += @"<a href='UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=0' class='dmcha' title='Danh mục cha'>&nbsp</a>";
                    if (dt2.Rows.Count > 0) { s += @"<a href='UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=" + dt2.Rows[0]["MaDMCha"] + @"' class='dmcha' title='Danh mục cha'>&nbsp</a>"; }

                }
                else
                {
                    s += @"<a href='UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=0' class='dmcha' title='Danh mục cha'>&nbsp</a>"; 
                }
            }
            DataTable dtcha = new DataTable();
            dtcha = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_Id(idmenu);
            for (int i = 0; i < dtcha.Rows.Count; i++)
            {
                ltrName.Text = dtcha.Rows[i]["TenDM"].ToString();
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += @"<li><a href='UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a>";
                if (CheckDMCon(dt.Rows[i]["MaDM"].ToString()))
                {
               
                    DataTable dt1 = new DataTable();
                    dt1 = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhmucTin_By_MaDMCon(dt.Rows[i]["MaDM"].ToString());
                    if (dt1.Rows.Count > 0)
                    {
                        DataTable dt2 = new DataTable();
                        dt2 = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhmucTin_By_MaDMCon(dt1.Rows[0]["MaDMCha"].ToString());
                        if (dt2.Rows.Count > 0) { s += @"<a href='UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=" + dt2.Rows[0]["MaDMCha"] + @"' class='dmcha' title='Danh mục cha'>&nbsp</a>"; }

                    }
                }
                else
                {
                    DataTable dt1 = new DataTable();
                    dt1 = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhmucTin_By_MaDMCon(dt.Rows[i]["MaDM"].ToString());
                    if (dt1.Rows.Count > 0)
                    {
                        DataTable dt2 = new DataTable();
                        dt2 = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhmucTin_By_MaDMCon(dt1.Rows[0]["MaDMCha"].ToString());
                        if (dt2.Rows.Count > 0) { s += @"<a href='UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=" + dt2.Rows[0]["MaDMCha"] + @"' class='dmcha' title='Danh mục cha'>&nbsp</a>"; }

                    }
                }
                s += "</li>";
            }
            
            return s;
        }
        #endregion
        bool CheckDMCon(string maDMCha)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_MaDMCha(maDMCha);
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else return false;

        }


    }
}