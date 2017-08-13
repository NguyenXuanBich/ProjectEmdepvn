using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyNhomSanPham
{
    public partial class NhomSanPham_ThemMoi : System.Web.UI.UserControl
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
                dt = Database_thaotaccsdl.AppCode.Database.NhomSanPham.Thongtin_NhomSP_By_Id(id);

                if (dt.Rows.Count > 0)
                {
                    tbTenNhom.Text = dt.Rows[0]["TenNhom"].ToString();
                    ltrAnhDaiDien.Text = "<img class='anhdaidien' src='/pic/SanPham/" + dt.Rows[0]["AnhDaiDien"] + @"'/>";
                    tbThuTu.Text = dt.Rows[0]["ThuTu"].ToString();
                    tbSoSP.Text = dt.Rows[0]["SoSPHienThi"].ToString();
                    hdtenanhdaidiencu.Value = dt.Rows[0]["AnhDaiDien"].ToString();
                }
            }
        }

        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            string picname = "";
            if (action.Equals("ThemMoi"))
            {
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.NhomSanPham.Thongtin_NhomSP_By_Ten(tbTenNhom.Text);
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
                    Database_thaotaccsdl.AppCode.Database.NhomSanPham.NhomSanPham_Insert(tbTenNhom.Text, picname, tbThuTu.Text, tbSoSP.Text, "");
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo nhóm mới" + tbTenNhom.Text + "</div>";
                    if (cbTiepTuc.Checked == true)
                    {

                        ResetControl();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm Nhóm thành công.');location.href='/Admin.aspx?module=SanPham&submodule=Nhom';", true);
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=Nhom");
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại Nhóm: " + tbTenNhom.Text + "</div>";
                }

            }
            else
            {

                id = Request.QueryString["id"];
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.NhomSanPham.Thongtin_NhomSP_By_Ten(tbTenNhom.Text);
                if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["NhomID"].ToString().Equals(id))
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
                    Database_thaotaccsdl.AppCode.Database.NhomSanPham.NhomSanPham_update(id, tbTenNhom.Text, tenanhdaidien, tbThuTu.Text, tbSoSP.Text);
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã sửa nhóm: " + tbTenNhom.Text + "</div>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa Nhóm thành công.');location.href='/Admin.aspx?module=SanPham&submodule=Nhom';", true);

                    //Response.Redirect("/Admin.aspx?module=SanPham&submodule=Nhom");
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại Nhóm: " + tbTenNhom.Text + "</div>";
                }


            }
        }

        private void ResetControl()
        {
            tbTenNhom.Text = "";
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
            Response.Redirect("/Admin.aspx?module=SanPham&submodule=Nhom");
        }
    }
}