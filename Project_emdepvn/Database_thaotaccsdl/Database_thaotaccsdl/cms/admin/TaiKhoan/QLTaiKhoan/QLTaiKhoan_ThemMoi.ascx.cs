using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.TaiKhoan.QLTaiKhoan
{
    public partial class QLTaiKhoan_ThemMoi : System.Web.UI.UserControl
    {
        private string action = "";
        private string id = "";
        private string maQuyen = "";
        private string tenDN = "";
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
            if (Request.QueryString["action"] != null)
                action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null)
                id = Request.QueryString["id"];
            if (Session["MaQuyen"] != null) { maQuyen = Session["MaQuyen"].ToString(); }
            if (Session["TenDangNhap"] != null) { tenDN = Session["TenDangNhap"].ToString(); }
            if (!IsPostBack)
            {
                cdNgaySinh.SelectedDate = DateTime.Today;
                LayquyenDangNhap();
                HienThiThongTin(id);
            }
        }
        private void HienThiThongTin(string id)
        {
            if (action == "ChinhSua")
            {
                btThemMoi.Text = "Chỉnh sửa";
                cbThemNhieuTK.Visible = false;
                tbTenDangNhap.Enabled = false;
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.TaiKhoan.Thongtin_TaiKhoan_By_TenDangNhap(id);
                if (dt.Rows.Count > 0)
                {
                    if (tenDN == dt.Rows[0]["TenDangNhap"].ToString() && maQuyen == "1")
                    {
                        tbTenDangNhap.Text = dt.Rows[0]["TenDangNhap"].ToString();
                        tbEmail.Text = dt.Rows[0]["EmailDK"].ToString();
                        tbDiaChi.Text = dt.Rows[0]["DiaChiDK"].ToString();
                        tbTenDayDu.Text = dt.Rows[0]["TenDayDu"].ToString();
                        cdNgaySinh.VisibleDate = Convert.ToDateTime(dt.Rows[0]["NgaySinh"].ToString());
                        cdNgaySinh.SelectedDate = Convert.ToDateTime(dt.Rows[0]["NgaySinh"].ToString());
                        ddlGioiTinh.SelectedValue = dt.Rows[0]["GioiTinhDK"].ToString();
                        //lưu mật khẩu cũ vào trường ẩn để lấy lại khi không nhập mật khẩu
                        hdMatKhauCu.Value = dt.Rows[0]["MatKhau"].ToString();
                        //bỏ điều kiền bắt buộc phải nhập
                        RequiredFieldValidator2.Visible = false;
                        tbNgay.Text = "1";
                        ddlQuyenDN.SelectedValue = dt.Rows[0]["MaQuyen"].ToString();
                    }

                    if (tenDN == "admin")
                    {
                        tbTenDangNhap.Text = dt.Rows[0]["TenDangNhap"].ToString();
                        tbEmail.Text = dt.Rows[0]["EmailDK"].ToString();
                        tbDiaChi.Text = dt.Rows[0]["DiaChiDK"].ToString();
                        tbTenDayDu.Text = dt.Rows[0]["TenDayDu"].ToString();
                        cdNgaySinh.VisibleDate = Convert.ToDateTime(dt.Rows[0]["NgaySinh"].ToString());
                        cdNgaySinh.SelectedDate = Convert.ToDateTime(dt.Rows[0]["NgaySinh"].ToString());
                        ddlGioiTinh.SelectedValue = dt.Rows[0]["GioiTinhDK"].ToString();
                        //lưu mật khẩu cũ vào trường ẩn để lấy lại khi không nhập mật khẩu
                        hdMatKhauCu.Value = dt.Rows[0]["MatKhau"].ToString();
                        //bỏ điều kiền bắt buộc phải nhập
                        RequiredFieldValidator2.Visible = false;
                        tbNgay.Text = "1";
                        ddlQuyenDN.SelectedValue = dt.Rows[0]["MaQuyen"].ToString();
                    }

                    if (tenDN != dt.Rows[0]["TenDangNhap"].ToString() && maQuyen == "1")
                    {
                        if (dt.Rows[0]["MaQuyen"].ToString() == "1")
                        {
                            btThemMoi.Visible = false;
                        }
                        if (dt.Rows[0]["MaQuyen"].ToString() != "1")
                        {
                            tbTenDangNhap.Text = dt.Rows[0]["TenDangNhap"].ToString();
                            tbEmail.Text = dt.Rows[0]["EmailDK"].ToString();
                            tbDiaChi.Text = dt.Rows[0]["DiaChiDK"].ToString();
                            tbTenDayDu.Text = dt.Rows[0]["TenDayDu"].ToString();
                            cdNgaySinh.VisibleDate = Convert.ToDateTime(dt.Rows[0]["NgaySinh"].ToString());
                            cdNgaySinh.SelectedDate = Convert.ToDateTime(dt.Rows[0]["NgaySinh"].ToString());
                            ddlGioiTinh.SelectedValue = dt.Rows[0]["GioiTinhDK"].ToString();
                            //lưu mật khẩu cũ vào trường ẩn để lấy lại khi không nhập mật khẩu
                            hdMatKhauCu.Value = dt.Rows[0]["MatKhau"].ToString();
                            //bỏ điều kiền bắt buộc phải nhập
                            RequiredFieldValidator2.Visible = false;
                            tbNgay.Text = "1";
                            ddlQuyenDN.SelectedValue = dt.Rows[0]["MaQuyen"].ToString();
                        }

                    }
                    if ( maQuyen != "1")
                    {
                        if (tenDN != dt.Rows[0]["TenDangNhap"].ToString())
                        {
                            btThemMoi.Visible = false;
                        }
                        if (tenDN == dt.Rows[0]["TenDangNhap"].ToString())
                        {
                            tbTenDangNhap.Text = dt.Rows[0]["TenDangNhap"].ToString();
                            tbEmail.Text = dt.Rows[0]["EmailDK"].ToString();
                            tbDiaChi.Text = dt.Rows[0]["DiaChiDK"].ToString();
                            tbTenDayDu.Text = dt.Rows[0]["TenDayDu"].ToString();
                            cdNgaySinh.VisibleDate = Convert.ToDateTime(dt.Rows[0]["NgaySinh"].ToString());
                            cdNgaySinh.SelectedDate = Convert.ToDateTime(dt.Rows[0]["NgaySinh"].ToString());
                            ddlGioiTinh.SelectedValue = dt.Rows[0]["GioiTinhDK"].ToString();
                            //lưu mật khẩu cũ vào trường ẩn để lấy lại khi không nhập mật khẩu
                            hdMatKhauCu.Value = dt.Rows[0]["MatKhau"].ToString();
                            //bỏ điều kiền bắt buộc phải nhập
                            RequiredFieldValidator2.Visible = false;
                            tbNgay.Text = "1";
                            ddlQuyenDN.Visible = false;
                        }
                    }                 
                }
            }
            else
            {
                btThemMoi.Text = "Thêm mới";
                cbThemNhieuTK.Visible = true;
                tbNgay.Text = "1";
            }
        }
        private void LayquyenDangNhap()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuyenDangNhap.Thongtin_QuyenDangNhap();
            ddlQuyenDN.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlQuyenDN.Items.Add(new ListItem(dt.Rows[i]["TenQuyen"].ToString(), dt.Rows[i]["MaQuyen"].ToString()));
            }
        }
        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            if (action == "ThemMoi")
            {
                if (maQuyen == "1")
                {
                    id = Request.QueryString["id"];
                    DataTable kiemtra = new DataTable();
                    kiemtra = Database_thaotaccsdl.AppCode.Database.TaiKhoan.Thongtin_TaiKhoan_By_TenDangNhap(tbTenDangNhap.Text);
                    if (kiemtra.Rows.Count == 0)
                    {
                        #region Code nút thêm mới
                        string matkhau = Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text);
                        Database_thaotaccsdl.AppCode.Database.TaiKhoan.TaiKhoan_Inser(tbTenDangNhap.Text, matkhau, tbEmail.Text, tbDiaChi.Text, tbTenDayDu.Text, "", cdNgaySinh.SelectedDate.ToString(), ddlGioiTinh.SelectedValue, ddlQuyenDN.SelectedValue, "");
                        ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo boss mới " + tbTenDangNhap.Text + "</div>";

                        if (cbThemNhieuTK.Checked == true)
                        {
                            ResetControl();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm tài khoản mới thành công.');location.href='/Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan';", true);
                            //Response.Redirect("/Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan");
                        }
                        #endregion
                    }
                    else
                    {
                        ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã có Boss mang tên " + tbTenDangNhap.Text + "</div>";
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Tài khoản của bạn không có quyền thêm mới mục này</div>";
                }
            }
            else
            {
                if (maQuyen == "1" || tenDN == id)
                {
                    id = Request.QueryString["id"];
                    DataTable kiemtra = new DataTable();
                    kiemtra = Database_thaotaccsdl.AppCode.Database.TaiKhoan.Thongtin_TaiKhoan_By_TenDangNhap(tbTenDangNhap.Text);
                    if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["TenDangNhap"].ToString().Equals(id))
                    {
                        #region Code nút chỉnh sửa
                        BatloiDateTime2.Visible = false;
                        string matkhau = "";
                        if (tbMatKhau.Text != "" || tbMatKhau != null)
                            matkhau = Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text);
                        else
                            matkhau = Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(hdMatKhauCu.Value);//nếu không nhập mật khẩu thì lấy lại mật khẩu cũ
                        Database_thaotaccsdl.AppCode.Database.TaiKhoan.TaiKhoan_Update(id, matkhau, tbEmail.Text, tbDiaChi.Text, tbTenDayDu.Text, "", cdNgaySinh.SelectedDate.ToString(), ddlGioiTinh.SelectedValue, ddlQuyenDN.SelectedValue);
                        //Response.Redirect("/Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa tài khoản mới thành công.');location.href='/Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan';", true);

                        #endregion
                    }
                    else
                    {
                        ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã có Boss mang tên " + tbTenDangNhap.Text + "</div>";
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Tài khoản của bạn không có quyền sửa mục này</div>";
                }
            }
        }
        protected void btHuy_Click(object sender, EventArgs e)
        {
            ResetControl();
            Response.Redirect("Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan");
        }
        protected void btNgay_Click(object sender, EventArgs e)
        {

            if (tbNgay.Text != null && Convert.ToInt32(tbNgay.Text) < 10000)
            {
                string nam = tbNgay.Text;
                cdNgaySinh.VisibleDate = Convert.ToDateTime("01/01/" + nam + "");
            }
            else
            {
                tbNgay.Text = "Năm nhỏ hơn 10000";
                cdNgaySinh.VisibleDate = Convert.ToDateTime("01/01/9999");
            }


        }
        private void ResetControl()
        {
            tbTenDangNhap.Text = "";
            tbMatKhau.Text = "";
            tbEmail.Text = "";
            tbDiaChi.Text = "";
            tbTenDayDu.Text = "";
            cdNgaySinh.SelectedDate = DateTime.Today;

            cbThemNhieuTK.Checked = false;
        }
    }
}