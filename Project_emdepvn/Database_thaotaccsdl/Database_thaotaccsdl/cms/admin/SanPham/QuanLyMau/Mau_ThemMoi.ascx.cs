using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyMau
{
    public partial class Mau_ThemMoi : System.Web.UI.UserControl
    {
        private string action = "";
        private string id = "";

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
            #region lấy query string
            if (Request.QueryString["action"] != null) action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];

            #endregion

            if (!IsPostBack)
            {
                HienThiThongTin(id);
                Response.Write(id);
            }
        }

        private void HienThiThongTin(string id)
        {
            if (Request.QueryString["action"] != null) action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];
            if (action.Equals("ChinhSua"))
            {
                cbTiepTuc.Visible = false;
                btThemMoi.Text = "Chỉnh Sửa";
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.Mau.Thongtin_Mau_By_Id(id);

                if (dt.Rows.Count > 0)
                {
                    tbTenMau.Text = dt.Rows[0]["TenMau"].ToString();
                }
            }



        }


        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            if (action.Equals("ThemMoi"))
            {
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.Mau.Thongtin_Mau_By_Ten(tbTenMau.Text);
                if (kiemtra.Rows.Count == 0)
                {
                    Database_thaotaccsdl.AppCode.Database.Mau.Mau_Inser(tbTenMau.Text, "");

                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo Màu mới: " + tbTenMau.Text + "</div>";
                    if (cbTiepTuc.Checked == true)
                    {

                        ResetControl();
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=DanhMuc&action=ThemMoi");

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm Màu mới thành công.');location.href='/Admin.aspx?module=SanPham&submodule=Mau';", true);
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=Mau");
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại màu : " + tbTenMau.Text + "</div>";
                }

            }
            else
            {

                id = Request.QueryString["id"];
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.Mau.Thongtin_Mau_By_Ten(tbTenMau.Text);
                if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["MauID"].ToString().Equals(id))
                {
                    Database_thaotaccsdl.AppCode.Database.Mau.Mau_Update(id, tbTenMau.Text);
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã sửa thành công: " + tbTenMau.Text + "</div>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa thành công.');location.href='/Admin.aspx?module=SanPham&submodule=Mau';", true);
                    //Response.Redirect("/Admin.aspx?module=SanPham&submodule=Mau");
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại màu : " + tbTenMau.Text + "</div>";
                }
 

            }
        }

        private void ResetControl()
        {
            tbTenMau.Text = "";
            cbTiepTuc.Checked = false;
        }

        private void DeleteFile(string fileName)
        {
            try
            {
                FileInfo fi;
                if (System.IO.File.Exists(fileName) == true)
                {
                    fi = new FileInfo(fileName);
                    fi.Delete();
                }
            }
            catch (Exception ex) { ex.Message.ToString(); }
        }
        protected void btHuyBo_Click(object sender, EventArgs e)
        {
            ResetControl();
            Response.Redirect("/Admin.aspx?module=SanPham&submodule=Mau");
        }
    }
}