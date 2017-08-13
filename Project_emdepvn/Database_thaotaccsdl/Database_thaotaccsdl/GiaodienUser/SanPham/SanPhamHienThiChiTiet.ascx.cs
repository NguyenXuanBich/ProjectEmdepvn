using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser.SanPham
{
    public partial class SanPhamHienThiChiTiet : System.Web.UI.UserControl
    {
        protected string id = "";
        private int gia;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                id = Request.QueryString["id"];
                if (!IsPostBack)
                    LayThongTinChiTietSanPham(id);
            }
            facebook.Text = "<div class='fb-comments' data-href='UserPage.aspx?modul=SanPham&modulcon=ChiTietSP&id="+id+"' data-numposts='10' data-width='100%' data-colorscheme='light'></div>";
        }

        private void LayThongTinChiTietSanPham(string id)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(id);
            if (dt.Rows.Count > 0)
            {
                ltrAnhSanPham.Text = "<div class='item3'><div class='khungAnh3'><a class='khungAnh3Crop' href='#'><img src='/pic/SanPham/" + dt.Rows[0]["AnhSP"] + @"' alt='" + dt.Rows[0]["TenSP"] + @"' /></a>
            </div>
        </div>";
                 
                ltrTenSanPham.Text = dt.Rows[0]["TenSP"].ToString();
                ltrGiaSanPham.Text = dt.Rows[0]["GiaSP"].ToString();

                ltrKichThuoc.Text = GetSize(dt.Rows[0]["SizeID"].ToString());
                ltrMauSac.Text = GetColorName(dt.Rows[0]["MauID"].ToString());
                ltrChatLieu.Text = GetMaterial(dt.Rows[0]["ChatLieuID"].ToString());
                ltrMoTa.Text = dt.Rows[0]["MotaSP"].ToString();
                gia = int.Parse(dt.Rows[0]["GiaSP"].ToString());
                //ltrthanhtien.Text = gia.ToString();
            }
        }

        private string GetMaterial(string chatlieuid)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.ChatLieu.Thongtin_ChatLieu_By_Id(chatlieuid);
            if (dt.Rows.Count > 0)
                return dt.Rows[0]["TenChatLieu"].ToString();
            else
                return "";
        }

        private string GetSize(string sizeid)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Size.Thongtin_Size_By_Id(sizeid);
            if (dt.Rows.Count > 0)
                return dt.Rows[0]["TenSize"].ToString();
            else
                return "";
        }

        private string GetColorName(string mauid)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Mau.Thongtin_Mau_By_Id(mauid);
            if (dt.Rows.Count > 0)
                return dt.Rows[0]["TenMau"].ToString();
            else
                return "";
        }

    }
}