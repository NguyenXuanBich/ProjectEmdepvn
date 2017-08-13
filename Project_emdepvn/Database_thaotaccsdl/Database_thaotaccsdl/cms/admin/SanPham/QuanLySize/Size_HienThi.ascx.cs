using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLySize
{
    public partial class Size_HienThi : System.Web.UI.UserControl
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
                LaySize();
        }
        private void LaySize()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Size.Thongtin_Size();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dt2 = new DataTable();
                dt2 = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaSize_TatCa(dt.Rows[i]["SizeID"].ToString());
                ltrSize.Text += @"
        <tr id='maDong_" + dt.Rows[i]["SizeID"] + @"'>
            <td class='cotMa'>" + dt.Rows[i]["SizeID"] + @"</td>
            <td class='cotmail'>" + dt.Rows[i]["TenSize"] + @"</td>
            <td class='cotmail'>" + dt2.Rows.Count + @"</td>
            <td class='cotCongCu'>
                <a href='/Admin.aspx?module=SanPham&submodule=Size&action=ChinhSua&id=" + dt.Rows[i]["SizeID"] + @"' class='sua' title='Sửa'></a>
                <a href=javascript:XoaSize('" + dt.Rows[i]["SizeID"] + @"') class='xoa' title='Xóa'></a>
            </td> 
        </tr>";
            }
        }
    }
}