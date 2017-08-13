using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyChatLieu
{
    public partial class ChatLieu_ThemMoi : System.Web.UI.UserControl
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
                dt = Database_thaotaccsdl.AppCode.Database.ChatLieu.Thongtin_ChatLieu_By_Id(id);

                if (dt.Rows.Count > 0)
                {
                    tbTenChatLieu.Text = dt.Rows[0]["TenChatLieu"].ToString();
                }
            }



        }


        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            if (action.Equals("ThemMoi"))
            {
                id = Request.QueryString["id"];
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.ChatLieu.Thongtin_ChatLieu_By_Ten(tbTenChatLieu.Text);
                if (kiemtra.Rows.Count == 0)
                {
                    Database_thaotaccsdl.AppCode.Database.ChatLieu.ChatLieu_Inser(tbTenChatLieu.Text, "");

                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo chất liệu mới: " + tbTenChatLieu.Text + "</div>";                   
                    if (cbTiepTuc.Checked == true)
                    {

                        ResetControl();
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=DanhMuc&action=ThemMoi");

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm chất liệu mới thành công.');location.href='/Admin.aspx?module=SanPham&submodule=ChatLieu';", true);
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=ChatLieu");
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Không thành công -- Đã tồn tại chất liệu: " + tbTenChatLieu.Text + "</div>";
                }

            }
            else
            {
                id = Request.QueryString["id"];
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.ChatLieu.Thongtin_ChatLieu_By_Ten(tbTenChatLieu.Text);
                if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["ChatLieuID"].ToString().Equals(id))
                {
                    Database_thaotaccsdl.AppCode.Database.ChatLieu.ChatLieu_Update(id, tbTenChatLieu.Text);
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã sửa thành công: " + tbTenChatLieu.Text + "</div>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa thành công.');location.href='/Admin.aspx?module=SanPham&submodule=ChatLieu';", true);
                    //Response.Redirect("/Admin.aspx?module=SanPham&submodule=ChatLieu");
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Không thành công -- Đã tồn tại chất liệu: " + tbTenChatLieu.Text + "</div>";
                }


            }
        }

        private void ResetControl()
        {
            tbTenChatLieu.Text = "";
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
            Response.Redirect("/Admin.aspx?module=SanPham&submodule=ChatLieu");
        }
    }
}