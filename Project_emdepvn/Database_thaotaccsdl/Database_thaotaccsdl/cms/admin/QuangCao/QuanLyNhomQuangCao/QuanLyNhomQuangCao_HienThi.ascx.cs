using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.QuangCao.QuanLyNhomQuangCao
{
    public partial class QuanLyNhomQuangCao_HienThi : System.Web.UI.UserControl
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
                LayNhomQuangCao();
        }

        private void LayNhomQuangCao()
        {

            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.NhomQuangCao.Thongtin_NhomQuangCao();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dem = new DataTable();
                dem = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID(dt.Rows[i]["NhomQuangCaoID"].ToString());
                int demqc = dem.Rows.Count;

                ltrDanhSachNhomQuangCao.Text += @" <tr id='MaDong_" + dt.Rows[i]["NhomQuangCaoID"] + @"'>
            <td class='cotMa'>" + dt.Rows[i]["NhomQuangCaoID"] + @"</td>
            <td class='cotTen'>" + dt.Rows[i]["TenNhomQuangCao"] + @"</td>
            <td class='cotTen'>" + dt.Rows[i]["ViTriQC"] + @"</td>
            <td class='cotAnh'>
                <img class='anhdaidien' src='/pic/QuangCao/" + dt.Rows[i]["AnhDaiDienQC"] + @"'/>
                <img class='anhdaidienhover' src='/pic/QuangCao/" + dt.Rows[i]["AnhDaiDienQC"] + @"'/>
            </td>
            <td class='cotTen'>" + dt.Rows[i]["ThuTuNhomQC"] + @"</td>
            <td class='cotThuTu'>" + demqc + @"</td>
             <td class='cotCongCu'>
                <a href='/Admin.aspx?module=QuangCao&submodule=QLNhomQuangCao&action=ChinhSua&id=" + dt.Rows[i]["NhomQuangCaoID"] + @"' class='sua' title='Sửa'></a>
                <a href=javascript:XoaNhomQuangCao('" + dt.Rows[i]["NhomQuangCaoID"] + @"') class='xoa' title='Xóa'></a>
            </td> 
        </tr>";
            }

            //GridView1.DataSource = dt;
            //GridView1.DataBind();
        }

    }
}