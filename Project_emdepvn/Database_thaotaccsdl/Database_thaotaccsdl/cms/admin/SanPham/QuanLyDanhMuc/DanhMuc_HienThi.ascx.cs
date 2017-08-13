using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyDanhMuc
{
    public partial class DanhMuc_HienThi : System.Web.UI.UserControl
    {
        private string maDMCha = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Check validate
            //Kiểm tra nếu đã đăng nhập thì cho tiếp tục
            if (Session["DangNhap"] != null && Session["DangNhap"].ToString() == "1")
            {
                //đã đăng nhập
            }
            else
            {
                //Nếu chưa đăng nhập thì đẩy lại về trang login
                Response.Redirect("/Login.aspx");
            }
            #endregion
            if (Request.QueryString["madmcha"] != null)
                maDMCha = Request.QueryString["madmcha"];
            if (!IsPostBack)
                LayDanhMuc();
        }
        #region Phương thức lấy số lượng sản phẩm riêng, chung của danh mục
        private int LaySoLuongTong(string maDM)
        {
            int counttong = 0;
            #region Lệnh lấy số lượng sản phẩm riêng, chung của danh mục
            DataTable dt = new DataTable();
            DataTable dtdmcha = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha(maDM);
            dtdmcha = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaDM_TatCa(maDM);
            counttong = counttong + dtdmcha.Rows.Count;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dtdmcon = new DataTable();
                dtdmcon = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaDM_TatCa(dt.Rows[i]["MaDM"].ToString());
                counttong = counttong + dtdmcon.Rows.Count;
                string cache = dt.Rows[i]["MaDM"].ToString();
                DataTable dtkiemtradmcon = new DataTable();
                dtkiemtradmcon = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha(cache);
                if (dtkiemtradmcon.Rows.Count > 0)
                {
                    for (int i1 = 0; i1 < dtkiemtradmcon.Rows.Count; i1++)
                    {
                        counttong = counttong + LaySoLuongTong(dtkiemtradmcon.Rows[i1]["MaDM"].ToString());
                    }
                }
                //else return counttong;

            #endregion
            }
            return counttong;
        }
        #endregion
        private void LayDanhMuc()
        {
            int countchung = 0;
            int countrieng = 0;
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha(maDMCha);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable data = new DataTable();
                data = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaDM_TatCa(dt.Rows[i]["MaDM"].ToString());
                countrieng = data.Rows.Count;
                countchung = LaySoLuongTong(dt.Rows[i]["MaDM"].ToString());
                string ten = dt.Rows[i]["TenDM"].ToString();
                if (ten.Length > 50) ten = ten.Substring(0, 50);
                ltrDanhMuc.Text += @" <tr id='MaDong_" + dt.Rows[i]["MaDM"] + @"'>
            <td class='cotMa'>" + dt.Rows[i]["MaDM"] + @"</td>
            <td class='cotTen'>" + ten + @"</td>
            <td class='cotMa'>" + countchung + @"</td>
            <td class='cotMa'>" + countrieng + @"</td>
            <td class='cotAnh'>
<img class='anhdaidien' src='/pic/SanPham/" + dt.Rows[i]["AnhDaiDien"] + @"'/>
<img class='anhdaidienhover' src='/pic/SanPham/" + dt.Rows[i]["AnhDaiDien"] + @"'/>
</td>
            <td class='cotThuTu'>" + dt.Rows[i]["ThuTu"] + @"</td>
            <td class='cotCongCu'>";
                if (CheckDMCon(dt.Rows[i]["MaDM"].ToString()))
                {
                    ltrDanhMuc.Text += @"<a href='Admin.aspx?module=SanPham&submodule=DanhMuc&madmcha=" + dt.Rows[i]["MaDM"] + @"' class='dmcon' title='Danh mục con'>&nbsp</a>";
                    DataTable dt1 = new DataTable();
                    dt1 = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCon(dt.Rows[i]["MaDM"].ToString());
                    if (dt1.Rows.Count > 0)
                    {
                        DataTable dt2 = new DataTable();
                        dt2 = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCon(dt1.Rows[0]["MaDMCha"].ToString());
                        if (dt2.Rows.Count > 0) { ltrDanhMuc.Text += @"<a href='Admin.aspx?module=SanPham&submodule=DanhMuc&madmcha=" + dt2.Rows[0]["MaDMCha"] + @"' class='dmcha' title='Danh mục cha'>&nbsp</a>"; }

                    }
                }
                else
                {
                    DataTable dt1 = new DataTable();
                    dt1 = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCon(dt.Rows[i]["MaDM"].ToString());
                    if (dt1.Rows.Count > 0)
                    {
                        DataTable dt2 = new DataTable();
                        dt2 = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCon(dt1.Rows[0]["MaDMCha"].ToString());
                        if (dt2.Rows.Count > 0) { ltrDanhMuc.Text += @"<a href='Admin.aspx?module=SanPham&submodule=DanhMuc&madmcha=" + dt2.Rows[0]["MaDMCha"] + @"' class='dmcha' title='Danh mục cha'>&nbsp</a>"; }

                    }
                }


                ltrDanhMuc.Text += @"<a href='Admin.aspx?module=SanPham&submodule=DanhMuc&action=ChinhSua&id=" + dt.Rows[i]["MaDM"] + @"' class='sua' title='Sửa'>&nbsp</a>
                <a href='javascript:XoaDanhMuc(" + dt.Rows[i]["MaDM"] + @")' class='xoa' title='Xóa'>&nbsp</a>
            </td>
        </tr>";
            }

            //GridView1.DataSource = dt;
            //GridView1.DataBind();
        }
        bool CheckDMCon(string maDMCha)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha(maDMCha);
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else return false;

        }

    }
}