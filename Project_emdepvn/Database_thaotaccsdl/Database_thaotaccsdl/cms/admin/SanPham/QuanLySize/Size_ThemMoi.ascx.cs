using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLySize
{
    public partial class Size_ThemMoi : System.Web.UI.UserControl
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
            #region lấy data
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
                dt = Database_thaotaccsdl.AppCode.Database.Size.Thongtin_Size_By_Id(id);

                if (dt.Rows.Count > 0)
                {
                    tbTenSize.Text = dt.Rows[0]["TenSize"].ToString();
                }
            }



        }


        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            if (action.Equals("ThemMoi"))
            {
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.Size.Thongtin_Size_By_Ten(tbTenSize.Text);
                if (kiemtra.Rows.Count == 0)
                {
                    Database_thaotaccsdl.AppCode.Database.Size.Size_Inser(tbTenSize.Text, "");

                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo size mới: " + tbTenSize.Text + "</div>";
                    if (cbTiepTuc.Checked == true)
                    {

                        ResetControl();
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=DanhMuc&action=ThemMoi");

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm size thành công.');location.href='/Admin.aspx?module=SanPham&submodule=Size';", true);
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=Size");
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại: " + tbTenSize.Text + "</div>";
                }
               
            }
            else
            {

                id = Request.QueryString["id"];
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.Size.Thongtin_Size_By_Ten(tbTenSize.Text);
                if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["SizeID"].ToString().Equals(id))
                {
                    Database_thaotaccsdl.AppCode.Database.Size.Size_Update(id, tbTenSize.Text);
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã sửa thành công: " + tbTenSize.Text + "</div>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa size thành công.');location.href='/Admin.aspx?module=SanPham&submodule=Size';", true);
                    //Response.Redirect("/Admin.aspx?module=SanPham&submodule=Size");
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại: " + tbTenSize.Text + "</div>";
                }
               

            }
        }

        private void ResetControl()
        {
            tbTenSize.Text = "";
            cbTiepTuc.Checked = false;
        }

        protected void btHuyBo_Click(object sender, EventArgs e)
        {
            ResetControl();
            Response.Redirect("/Admin.aspx?module=SanPham&submodule=Size");
        }
    }
}