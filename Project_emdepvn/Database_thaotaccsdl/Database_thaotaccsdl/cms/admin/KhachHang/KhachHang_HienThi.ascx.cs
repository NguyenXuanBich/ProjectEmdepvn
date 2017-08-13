using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Database_thaotaccsdl.cms.admin.KhachHang
{
    public partial class KhachHang_HienThi : System.Web.UI.UserControl
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
                LayKhachHang();
        }
        private void LayKhachHang()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dt2 = new DataTable();
                dt2 = Database_thaotaccsdl.AppCode.Database.DonDatHang.Thongtin_DonDatHang_By_maKhachHang(dt.Rows[i]["MaKH"].ToString());
                string count = dt2.Rows.Count.ToString();
                ltrKhachHang.Text += @"
        <tr id='maDong_"+ dt.Rows[i]["MaKH"] + @"'> 
            <td class='cottenDN'>" + dt.Rows[i]["MaKH"] + @"</td>
            <td class='cotdiachi'>" + dt.Rows[i]["TenKH"] + @"</td>
            <td class='cotMoTa'><p class='mota'>Xem địa chỉ</p><p class='motahover'>" + dt.Rows[i]["DiaChiKH"].ToString() + @"</p></td>
            <td class='cotdiachi'>" + dt.Rows[i]["sdtKH"] + @"</td>
            <td class='cothoten'>" + dt.Rows[i]["EmailKH"] + @"</td>
            <td class='cotngaysinh'>" + count + @"</td>

            <td class='cotCongCu'>
                <a href='/Admin.aspx?module=KhachHang&action=ChinhSua&id=" + dt.Rows[i]["EmailKH"] + @"' class='sua' title='Sửa'></a>
                <a href=javascript:XoaKhachHang('" + dt.Rows[i]["MaKH"] + @"') class='xoa' title='Xóa'></a>
            </td> 
        </tr>";
            }
        }
    }
}