using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.TinTuc.QuanLyTinTuc
{
    public partial class QuanLyTinTuc_HienThi : System.Web.UI.UserControl
    {
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
            if (!IsPostBack)
            {
                LayDanhSachTinTuc();
            }
        }

        private void LayDanhSachTinTuc()
        {
            //1
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.ThongTin_TinTuc();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string ten = dt.Rows[i]["TieuDe"].ToString();
                if (ten.Length > 40) ten = ten.Substring(0, 40);
                ltrDanhSachTinTuc.Text += @" <tr id='MaDong_" + dt.Rows[i]["TinTucID"] + @"'>
            <td>" + dt.Rows[i]["TinTucID"] + @"</td>
            <td title='"+dt.Rows[i]["TieuDe"]+ @"'>" + ten + @"</td>
            <td class='cotAnh'>

             <img class='anhdaidien' src='/pic/TinTuc/" + dt.Rows[i]["AnhDaiDien"] + @"'/>
             <img class='anhdaidienhover' src='/pic/TinTuc/" + dt.Rows[i]["AnhDaiDien"] + @"'/></td>

            <td class='cotMoTa'><p class='mota'>Xem</p><p class='motahover'>" + dt.Rows[i]["MoTa"].ToString() + @"</p></td>
            <td>" + dt.Rows[i]["NgayDang"] + @"</td>
            <td>" + dt.Rows[i]["LuotXem"] + @"</td>            
            <td>" + dt.Rows[i]["ThuTu"] + @"</td>
            <td>" + dt.Rows[i]["MaDM"] + @"</td>           

            <td class='cotCongCu'>";

                ltrDanhSachTinTuc.Text += @"<a href='Admin.aspx?module=TinTuc&submodule=QLTinTuc&action=ChinhSua&id=" + dt.Rows[i]["TinTucID"] + @"' class='sua' title='Sửa'>&nbsp</a>
                <a href='javascript:XoaTinTuc(" + dt.Rows[i]["TinTucID"] + @")' class='xoa' title='Xóa'>&nbsp</a>
            </td>
        </tr>";
            }
        }
    }
}