using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyDanhMuc
{
    public partial class DanhMuc_ThemMoi : System.Web.UI.UserControl
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
            #region lấy dữ liệu
            if (Request.QueryString["action"] != null) action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];

            #endregion

            if (!IsPostBack)
            {
                LayDanhMucCha();
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
                dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_ByID(id);

                if (dt.Rows.Count > 0)
                {
                    dllDanhMucCha.SelectedValue = dt.Rows[0]["MaDMCha"].ToString();
                    tbTenDanhMuc.Text = dt.Rows[0]["TenDM"].ToString();
                    ltrAnhDaiDien.Text = "<img class='anhdaidien' src='/pic/SanPham/" + dt.Rows[0]["AnhDaiDien"] + @"'/>";
                    tbThuTu.Text = dt.Rows[0]["ThuTu"].ToString();
                    hdtenanhdaidiencu.Value = dt.Rows[0]["AnhDaiDien"].ToString();
                }
            }



        }
        private void LayDanhMucCha()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha("0");
            dllDanhMucCha.Items.Clear();
            dllDanhMucCha.Items.Add(new ListItem("Danh Mục Gốc", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dllDanhMucCha.Items.Add(new ListItem(dt.Rows[i]["TenDM"].ToString(), dt.Rows[i]["MaDM"].ToString()));
                LayDanhMucCon(dt.Rows[i]["MaDM"].ToString(), "-----");
            }
        }

        private void LayDanhMucCon(string madmcha, string khoangcach)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha(madmcha);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dllDanhMucCha.Items.Add(new ListItem(khoangcach + dt.Rows[i]["TenDM"].ToString(), dt.Rows[i]["MaDM"].ToString()));
                LayDanhMucCon(dt.Rows[i]["MaDM"].ToString(), khoangcach + "-----");
            }
        }

        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            string picname = "";
            if (action.Equals("ThemMoi"))
            {
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_ByTen(tbTenDanhMuc.Text);
                if (kiemtra.Rows.Count == 0)
                {
                    if (flAnhDaiDien.FileContent.Length > 0)
                    {
                        string autoname = Database_thaotaccsdl.AppCode.Chucnang.SinhMa.SinhMaTuDong();
                        picname = autoname + flAnhDaiDien.FileName;
                        if (picname.EndsWith(".jpeg") || picname.EndsWith(".jpg") || picname.EndsWith(".png") || picname.EndsWith(".gif ") || picname.EndsWith(".JPG "))
                        {
                            flAnhDaiDien.SaveAs(Server.MapPath("pic/SanPham/") + picname);
                        }
                    }
                    Database_thaotaccsdl.AppCode.Database.DanhMuc.Danhmuc_Inser(tbTenDanhMuc.Text, picname, tbThuTu.Text, dllDanhMucCha.SelectedValue, "");
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo danh mục mới " + tbTenDanhMuc.Text + "</div>";
                    if (cbTiepTuc.Checked == true)
                    {

                        ResetControl();
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=DanhMuc&action=ThemMoi");
                        LayDanhMucCha();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm danh mục mới thành công.');location.href='/Admin.aspx?module=SanPham&submodule=DanhMuc';", true);
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=DanhMuc");
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại danh mục: " + tbTenDanhMuc.Text + "</div>";
                }
               
            }
            else
            {

                id = Request.QueryString["id"];
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_ByTen(tbTenDanhMuc.Text);
                if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["MaDM"].ToString().Equals(id))
                {
                    string tenanhdaidien = "";
                    if (flAnhDaiDien.FileContent.Length > 0)
                    {
                        string autoname = Database_thaotaccsdl.AppCode.Chucnang.SinhMa.SinhMaTuDong();
                        picname = autoname + flAnhDaiDien.FileName;
                        if (picname.EndsWith(".jpeg") || picname.EndsWith(".jpg") || picname.EndsWith(".png") || picname.EndsWith(".gif ") || picname.EndsWith(".JPG "))
                        {
                            flAnhDaiDien.SaveAs(Server.MapPath("pic/SanPham/") + picname);
                            tenanhdaidien = picname;
                        }
                    }
                    if (tenanhdaidien == "")
                    {
                        tenanhdaidien = hdtenanhdaidiencu.Value;
                    }
                    else { DeleteFile(Server.MapPath("/pic/SanPham/" + hdtenanhdaidiencu.Value)); }
                    Database_thaotaccsdl.AppCode.Database.DanhMuc.DanhMuc_Update(id, tbTenDanhMuc.Text, tenanhdaidien, tbThuTu.Text, dllDanhMucCha.SelectedValue);
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã sửa thành cái mới " + tbTenDanhMuc.Text + "</div>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa thành công.');location.href='/Admin.aspx?module=SanPham&submodule=DanhMuc';", true);
                    //Response.Redirect("/Admin.aspx?module=SanPham&submodule=DanhMuc");
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại danh mục: " + tbTenDanhMuc.Text + "</div>";
                }
       

            }
        }

        private void ResetControl()
        {
            tbTenDanhMuc.Text = "";
            cbTiepTuc.Checked = false;
            tbThuTu.Text = "";
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
            Response.Redirect("/Admin.aspx?module=SanPham&submodule=DanhMuc");
        }
    }
}