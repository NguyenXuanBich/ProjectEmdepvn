using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.GiaodienUser
{
    public partial class UserPage : System.Web.UI.Page
    {
        private string modul = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                #region Kiểm tra xem đã đăng nhập chưa
                if (Session["DNKhachHang"] != null && Session["DNKhachHang"].ToString() == "1")
                {
                    //Đã đăng nhập rồi
                    ltrUsers.Text = @"<a href='#' style='color:#78b43d; font:normal 13px HelveticaNeue; text-decoration:none !important'>Chào mừng: " + Session["TenKh"].ToString() + @"</a>&nbsp/&nbsp";
                    plAfter.Visible = true;
                }
                else//Chưa đăng nhập
                {
                    ltrUsers.Text = @"<a href='/AskLogin.aspx' style='color: #78b43d; font:normal 13px HelveticaNeue; text-decoration:none !important'>Đăng nhập</a>/<a href='UserPage.aspx?modul=TaiKhoan&submodule=Dangkytaikhoan' style='color: #78b43d;font:normal 13px HelveticaNeue; text-decoration:none !important'>Đăng ký</a>";
                }
                #endregion
            }

            LtLogo.Text = LayLogo();
            LtMenu.Text = LayMenu();
            ltrquangcaotop.Text = LayQuangCao();
            //ltrDMSanPham.Text = LayDMSanPham();
            //ltrDMTinTuc.Text = LayDMTinTuc();
            ltrDMSanPham2.Text = LayDMSanPham();
            ltrDMTinTuc2.Text = LayDMTinTuc();
            ltrMenudanhmucfooter.Text = LayDMSanPhamFooter();
            //lthotnhattrongngay.Text = Lay10TinTuc();
            //ltSlide.Text = LayAnhSlide();
            #region Thay đổi menu sản phẩm hay tin tức
            if (Request.QueryString["modul"] != null)
                modul = Request.QueryString["modul"];
            if (modul == "TinTuc")
            {
                //ltrDMSanPham.Visible = false;
                //ltrDMTinTuc.Visible = true;
                ltrDMSanPham2.Visible = false;
                ltrDMTinTuc2.Visible = true;
                //ltrName.Text = "Danh Mục Tin Tức";
                ltrName2.Text = "Danh Mục Tin Tức";
            }
            else if (modul == "SanPham")
            {
                //ltrDMSanPham.Visible = false;
                //ltrDMTinTuc.Visible = true;
                ltrDMSanPham2.Visible = true;
                ltrDMTinTuc2.Visible = false;
                //ltrName.Text = "Danh Mục Tin Tức";
                ltrName2.Text = "Danh Mục Sản Phẩm";
            }
            else
            {
                //ltrDMSanPham.Visible = false;
                //ltrDMTinTuc.Visible = true;
                ltrDMSanPham2.Visible = false;
                ltrDMTinTuc2.Visible = true;
                //ltrName.Text = "Danh Mục Tin Tức";
                ltrName2.Text = "Danh Mục Tin Tức";
                ////ltrDMSanPham.Visible = true;
                ////ltrDMTinTuc.Visible = false;
                //ltrDMSanPham2.Visible = true;
                //ltrDMTinTuc2.Visible = false;
                ////ltrName.Text = "Danh Mục Sản Phẩm";
                //ltrName2.Text = "Danh Mục Sản Phẩm";
            }
            #endregion
        }

        private string LayQuangCao()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID("14");
            s += @"<a class='khungAnhCrop' href='" + dt.Rows[0]["LienKet"] + @"' title='Pic 1'> <img alt='" + dt.Rows[0]["TenQC"] + @"' src='/pic/QuangCao/" + dt.Rows[0]["AnhQC"] + @"' /> </a>";


            return s;
        }
        #region Lấy danh mục tin tức
        private string LayDMTinTuc()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_MaDMCha("0");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += @"<li><a href='UserPage.aspx?modul=TinTuc&modulcon=DanhSachTinTuc&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
            }
            return s;
        }
        #endregion
        private string LayDMSP()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha("0");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += @"<li><a href='/UserPage.aspx?module=SanPham&submodule=DSSanPham&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
            }
            return s;
        }

        #region Lấy Menu
        private string LayMenu()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCha("0");
            if (dt.Rows.Count <= 9)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string lienket = dt.Rows[i]["LienKet"].ToString();
                    if (lienket == "")
                        lienket = "#";

                    s += @"<li class='limainmenu'><a href='" + lienket + @"' title='" + dt.Rows[i]["TenMenu"] + @"'>" + dt.Rows[i]["TenMenu"] + @"</a></li>";
                }
            }
            else
            {
                for (int i = 0; i < 9; i++)
                {
                    string lienket = dt.Rows[i]["LienKet"].ToString();
                    if (lienket == "")
                        lienket = "#";

                    s += @"<li class='limainmenu'><a href='" + lienket + @"' title='" + dt.Rows[i]["TenMenu"] + @"'>" + dt.Rows[i]["TenMenu"] + @"</a></li>";
                }
                s += @"<li class='top'><a href='#' title='Thêm Menu'>...</a><ul class='ulcon'>";
                for (int i = 9; i < dt.Rows.Count; i++)
                {
                   string lienket = dt.Rows[i]["LienKet"].ToString();
                    if (lienket == "")
                        lienket = "#";
                    s += @"<li class='licon'><a href='" + lienket + @"' title='" + dt.Rows[i]["TenMenu"] + @"'>" + dt.Rows[i]["TenMenu"] + @"</a></li>";
                
                }
                s+=@"</ul></li>";
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

        #region Lấy lôgô
        private string LayLogo()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID_ID("1", "7");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += @"<img src='/pic/QuangCao/" + dt.Rows[i]["AnhQC"] + @"' />";
            }
            return s;
        }
        #endregion

        protected void btnTK_Click(object sender, EventArgs e)
        {
            //Response.Redirect("/GiaodienUser/UserPage.aspx?modul=TimKiem");
            if (tbTimKiem.Text == "")
            {
                //Response.Write("<script language='javascript'>alert('" + "Bạn chưa nhập nội dung!" + "')</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Chưa có nội dung, hãy nhập vào ô tìm kiếm trước đã')", true);
                //tbTimKiem.Focus();
            }
            else
            {
                string info = tbTimKiem.Text;
                Response.Redirect("/GiaodienUser/UserPage.aspx?modul=TimKiem&Info=" + info);
            }
        }
        #region Lấy danh mục sản phẩm
        private string LayDMSanPham()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha("0");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += @"<li><a href='UserPage.aspx?modul=SanPham&modulcon=DSSanPham&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
            }
            return s;
        }
        #endregion
        #region Lấy danh mục cho chân trang
        private string LayDMSanPhamFooter()
        {
            string s = "";
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha("0");
            s += @" <div class='sanpham'><ul>";
            if (dt.Rows.Count <= 4)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    s += @"<li><a href='UserPage.aspx?modul=SanPham&modulcon=DSSanPham&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
                }
            }
            if (dt.Rows.Count <= 8 && dt.Rows.Count >= 4)
            {
                for (int i = 0; i < 4; i++)
                {
                    s += @"<li><a href='UserPage.aspx?modul=SanPham&modulcon=DSSanPham&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
                }
                s += @"</ul></div>";
                s += @" <div class='chatlieu1'><ul>";
                for (int i = 4; i < dt.Rows.Count; i++)
                {
                    s += @"<li><a href='UserPage.aspx?modul=SanPham&modulcon=DSSanPham&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
                }
            } if (dt.Rows.Count > 8)
            {
                for (int i = 0; i < 4; i++)
                {
                    s += @"<li><a href='UserPage.aspx?modul=SanPham&modulcon=DSSanPham&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
                }
                s += @"</ul></div>";
                s += @" <div class='chatlieu1'><ul>";
                for (int i = 4; i < 8; i++)
                {
                    s += @"<li><a href='UserPage.aspx?modul=SanPham&modulcon=DSSanPham&idmenu=" + dt.Rows[i]["MaDM"] + @"' title='" + dt.Rows[i]["TenDM"] + @"'>" + dt.Rows[i]["TenDM"] + @"</a></li>";
                }
            }
            s += @"</ul></div>";
            return s;
        }
        #endregion
        //Code nút đăng xuất
        protected void lbtDangXuat_Click(object sender, EventArgs e)
        {
            //Xóa hết các session đã lưu trước đó
            Session["DNKhachHang"] = null;
            Session["MaKH"] = null;
            Session["TenKh"] = null;
            Session["DiaChiKH"] = null;
            Session["sdtKH"] = null;
            Session["EmailKH"] = null;
            //Đẩy về trang login
            Response.Redirect("UserPage.aspx");
        }
    }
}
