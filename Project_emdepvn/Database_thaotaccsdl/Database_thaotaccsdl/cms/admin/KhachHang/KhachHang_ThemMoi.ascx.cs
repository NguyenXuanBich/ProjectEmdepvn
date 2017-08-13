using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.KhachHang
{
    public partial class KhachHang_ThemMoi : System.Web.UI.UserControl
    {
        private string action = "";
        private string id = "";//id cần sửa
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
            #region lấy request id để sửa
            if (Request.QueryString["action"] != null) action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];

            #endregion

            if (!IsPostBack)
            {
                HienThiThongTin(id);
            }

        }
        private void HienThiThongTin(string id)
        {
            if (Request.QueryString["action"] != null) action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];
            if (action.Equals("ChinhSua"))
            {
                cbTiepTuc.Visible = false;
                btThemMoi.Text = "Chỉnh sửa";
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang_By_Email(id);

                if (dt.Rows.Count > 0)
                {
                    tbHoTen.Text = dt.Rows[0]["Tenkh"].ToString();
                    tbDiaChi.Text = dt.Rows[0]["DiaChiKH"].ToString();
                    tbSDT.Text = dt.Rows[0]["sdtKH"].ToString();
                    tbEmail.Text = dt.Rows[0]["EmailKH"].ToString();
                    //lưu mật khẩu cũ vào trường ẩn để lấy lại khi không nhập mật khẩu
                    hdMatKhauCu.Value = dt.Rows[0]["MatKhau"].ToString();
                    //bỏ điều kiền bắt buộc phải nhập
                    RequiredFieldValidator2.Visible = false;
                    RequiredFieldValidator4.Visible = false;
                }
            }
            if (action.Equals("ThemMoi"))
            {
                cbTiepTuc.Visible = true;
            }
        }
        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            if (action == "ThemKhachHang")
            {
                #region Code thêm mới
                if (CheckEmail(tbEmail.Text) == false)
                {
                    if (tbMatKhau.Text == tbNhapLai.Text)
                    {
                        string matkhau = Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text);
                        Database_thaotaccsdl.AppCode.Database.KhachHang.KhachHang_Insert(tbHoTen.Text, tbDiaChi.Text, tbSDT.Text, tbEmail.Text, matkhau, "");
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm khách hàng mới thành công.');location.href='/Admin.aspx?module=KhachHang&action=ThemKhachHang';", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Mật khẩu chưa trùng khớp, vui lòng gõ lại')", true);
                        tbMatKhau.Focus();
                    }
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo khách hàng mới " + tbHoTen.Text + "</div>";
                    if (cbTiepTuc.Checked == true)
                    {
                        ResetControl();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm KH mới thành công.');location.href='/Admin.aspx?module=KhachHang&action=DanhSachKhachHang';", true);
                        //Response.Redirect("/Admin.aspx?module=KhachHang&action=DanhSachKhachHang");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Email này đã được dùng để đăng ký, vui lòng chọn cái khác')", true);
                    tbEmail.Focus();
                }

                #endregion
            }
            else
            {
                #region Code nút chỉnh sửa
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang_By_Email(id);
                if (CheckEmail(tbEmail.Text) == false || tbEmail.Text == id)
                {
                    string matkhau = "";
                    if (tbMatKhau.Text != null)
                    {
                        if (tbMatKhau.Text == tbNhapLai.Text)
                        {
                            matkhau = Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(tbMatKhau.Text);
                            Database_thaotaccsdl.AppCode.Database.KhachHang.KhachHang_Update(dt.Rows[0]["MaKH"].ToString(), tbHoTen.Text, tbDiaChi.Text, tbSDT.Text, tbEmail.Text, matkhau);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa khách hàng thành công.');location.href='/Admin.aspx?module=KhachHang&action=DanhSachKhachHang';", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Mật khẩu chưa trùng khớp, vui lòng gõ lại')", true);
                            tbMatKhau.Focus();
                        }
                    }
                    else
                    {
                        matkhau = Database_thaotaccsdl.AppCode.Chucnang.MaHoa.MaHoaMD5(hdMatKhauCu.Value);//nếu không nhập mật khẩu thì lấy lại mật khẩu cũ
                        Database_thaotaccsdl.AppCode.Database.KhachHang.KhachHang_Update(dt.Rows[0]["MaKH"].ToString(), tbHoTen.Text, tbDiaChi.Text, tbSDT.Text, tbEmail.Text, matkhau);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa khách hàng thành công.');location.href='/Admin.aspx?module=KhachHang&action=DanhSachKhachHang';", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Email này đã được dùng để đăng ký, vui lòng chọn cái khác')", true);
                    tbEmail.Focus();
                }

                #endregion
            }
        }
        protected void btHuyBo_Click(object sender, EventArgs e)
        {
            XoagiatriTextbox(this);
            Response.Redirect("/Admin.aspx?module=KhachHang&action=DanhSachKhachHang");
        }
        private bool CheckEmail(string email)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.KhachHang.ThongTin_KhachHang_By_Email(email);
            if (dt.Rows.Count > 0)
                return true;
            else
                return false;
        }
        public static void XoagiatriTextbox(Control Parent)
        {

            foreach (Control mycontrols in Parent.Controls)
                if (mycontrols is TextBox)
                {

                    (mycontrols as TextBox).Text = string.Empty;

                }
        }
        private void ResetControl()
        {
            XoagiatriTextbox(this);
            cbTiepTuc.Checked = false;
        }
    }
}