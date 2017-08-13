using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.QuangCao.QuanLyQuangCao
{
    public partial class QuanLyQuangCao_HienThi : System.Web.UI.UserControl
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
                LayDanhSachQuangCao();
            }
        }

        private void LayDanhSachQuangCao()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuangCao.ThongTin_QuangCao();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string lk = dt.Rows[i]["LienKet"].ToString();
                if (lk.Length < 2) lk = "Chưa có";
                //if (lk.Length > 40) lk = lk.Substring(0, 40)+"...";
                ltrDanhSachQuangCao.Text += @" <tr id='MaDong_" + dt.Rows[i]["QuangCaoID"] + @"'>
            <td>" + dt.Rows[i]["QuangCaoID"] + @"</td>
            <td title='" + dt.Rows[i]["TenQC"] + @"'>" + dt.Rows[i]["TenQC"] + @"</td>
            <td>" + dt.Rows[i]["LoaiQC"] + @"</td>
            <td class='cotAnh'>

             <img class='anhdaidien' src='/pic/QuangCao/" + dt.Rows[i]["AnhQC"] + @"'/>
             <img class='anhdaidienhover' src='/pic/QuangCao/" + dt.Rows[i]["AnhQC"] + @"'/></td>

            <td class='cotMoTa'><p class='mota'>Xem</p><p class='motahover'>" +lk+ @"</p></td>
            <td>" + dt.Rows[i]["ThuTuQC"] + @"</td>
            <td>" + dt.Rows[i]["NhomQuangCaoID"] + @"</td>                    

            <td class='cotCongCu'>";

                ltrDanhSachQuangCao.Text += @"<a href='Admin.aspx?module=QuangCao&submodule=QLQuangCao&action=ChinhSua&id=" + dt.Rows[i]["QuangCaoID"] + @"' class='sua' title='Sửa'>&nbsp</a>
                <a href='javascript:XoaQuangCao(" + dt.Rows[i]["QuangCaoID"] + @")' class='xoa' title='Xóa'>&nbsp</a>
            </td>
        </tr>";
            }
        }
    }
}