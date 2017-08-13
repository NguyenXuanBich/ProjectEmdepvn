using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyNhomSanPham
{
    public partial class NhomSanPham_HienThi : System.Web.UI.UserControl
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
                LayNhom();
        }

        private void LayNhom()
        {
          
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.NhomSanPham.Thongtin_NhomSanPham();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dem = new DataTable();
                dem = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_NhomId(dt.Rows[i]["NhomID"].ToString(), dt.Rows[i]["SoSPHienThi"].ToString());
                int demsp = dem.Rows.Count;
                string ten = dt.Rows[i]["TenNhom"].ToString();
                if (ten.Length > 50) ten = ten.Substring(0, 50);
                ltrNhomSP.Text += @" <tr id='MaDong_" + dt.Rows[i]["NhomID"] + @"'>
            <td class='cotMa'>" + dt.Rows[i]["NhomID"] + @"</td>
            <td class='cotTen'>" + ten + @"</td>
            <td class='cotMa'>" + demsp + @"</td>
            <td class='cotAnh'>
                <img class='anhdaidien' src='/pic/SanPham/" + dt.Rows[i]["AnhDaiDien"] + @"'/>
                <img class='anhdaidienhover' src='/pic/SanPham/" + dt.Rows[i]["AnhDaiDien"] + @"'/>
            </td>
            <td class='cotThuTu'>" + dt.Rows[i]["ThuTu"] + @"</td>
            <td class='cotThuTu'>" + dt.Rows[i]["SoSPHienThi"] + @"</td>
             <td class='cotCongCu'>
                <a href='/Admin.aspx?module=SanPham&submodule=Nhom&action=ChinhSua&id=" + dt.Rows[i]["NhomID"] + @"' class='sua' title='Sửa'></a>
                <a href=javascript:XoaNhomSanPham('" + dt.Rows[i]["NhomID"] + @"') class='xoa' title='Xóa'></a>
            </td> 
        </tr>";
            }

            //GridView1.DataSource = dt;
            //GridView1.DataBind();
        }

    }
}