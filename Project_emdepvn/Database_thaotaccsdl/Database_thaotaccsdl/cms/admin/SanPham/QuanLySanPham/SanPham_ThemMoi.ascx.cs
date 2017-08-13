using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Threading;



namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLySanPham
{
    public partial class SanPham_ThemMoi : System.Web.UI.UserControl
    {
        private string action = "";
        private string id = "";//id sản phẩm caadn sửa

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
            #region Lấy request
            if (Request.QueryString["action"] != null) action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];

            #endregion

            if (!IsPostBack)
            {
                LayDanhMucCha();
                LayMau();
                LaySize();
                LayChatLieu();
                LayNhom();
                HienThiThongTin(id);
                Response.Write(id);

            }
        }

        #region Lấy mầu, size, chất liệu, nhóm
        private void LayNhom()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Nhom.Thongtin_NhomSanPham();
            ddlnhom.Items.Clear();
            ddlnhom.Items.Add(new ListItem(dt.Rows[0]["TenNhom"].ToString(), dt.Rows[0]["NhomID"].ToString()));//"Chọn nhóm,0"
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlnhom.Items.Add(new ListItem(dt.Rows[i]["TenNhom"].ToString(), dt.Rows[i]["NhomID"].ToString()));

            }
        }

        private void LayChatLieu()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.ChatLieu.Thongtin_ChatLieu();
            ddlchatlieu.Items.Clear();
            ddlchatlieu.Items.Add(new ListItem(dt.Rows[0]["TenChatLieu"].ToString(), dt.Rows[0]["ChatLieuID"].ToString()));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlchatlieu.Items.Add(new ListItem(dt.Rows[i]["TenChatLieu"].ToString(), dt.Rows[i]["ChatLieuID"].ToString()));

            }
        }

        private void LaySize()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Size.Thongtin_Size();
            ddlsize.Items.Clear();
            ddlsize.Items.Add(new ListItem(dt.Rows[0]["TenSize"].ToString(), dt.Rows[0]["SizeID"].ToString()));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlsize.Items.Add(new ListItem(dt.Rows[i]["TenSize"].ToString(), dt.Rows[i]["SizeID"].ToString()));

            }
        }

        private void LayMau()
        {

            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Mau.ThongTin_Mau();
            ddlmau.Items.Clear();
            ddlmau.Items.Add(new ListItem(dt.Rows[0]["TenMau"].ToString(), dt.Rows[0]["MauID"].ToString()));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlmau.Items.Add(new ListItem(dt.Rows[i]["TenMau"].ToString(), dt.Rows[i]["MauID"].ToString()));

            }
        }
        #endregion 

        private void HienThiThongTin(string id)
        {
            if (Request.QueryString["action"] != null) action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];
            if (action.Equals("ChinhSua"))
            {
                cbTiepTuc.Visible = false;
                btThemMoi.Text = "Chỉnh sửa";
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(id);

                if (dt.Rows.Count > 0)
                {
                    dllDanhMucCha.SelectedValue = dt.Rows[0]["MaDM"].ToString();
                    tbTenSanPham.Text = dt.Rows[0]["TenSP"].ToString();
                    ltrAnhDaiDien.Text = "<img class='anhdaidien' src='/pic/SanPham/" + dt.Rows[0]["AnhSP"] + @"'/>";
                    tbSoLuong.Text = dt.Rows[0]["SoLuongSP"].ToString();
                    hdtenanhdaidiencu.Value = dt.Rows[0]["AnhSP"].ToString();
                    tbGiaSanPham.Text = dt.Rows[0]["GiaSP"].ToString();
                    tbGiaNhap.Text = dt.Rows[0]["GiaNhapSP"].ToString();
                    tbNgayTao.Text = dt.Rows[0]["NgayTao"].ToString();
                    tbNgayHuy.Text = dt.Rows[0]["NgayHuy"].ToString();
                    ddlmau.SelectedValue = dt.Rows[0]["MauID"].ToString();
                    ddlsize.SelectedValue = dt.Rows[0]["SizeID"].ToString();
                    ddlchatlieu.SelectedValue = dt.Rows[0]["ChatLieuID"].ToString();
                    ddlnhom.SelectedValue = dt.Rows[0]["NhomID"].ToString();
                    tbMoTaSanPham.Text = dt.Rows[0]["MoTaSP"].ToString();
                }
            }
            if (action.Equals("ThemMoi"))
            {
                cbTiepTuc.Visible = true;
                tbNgayHuy.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
                tbNgayTao.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            }



        }

        #region Lấy ra thông tin danh mục
        private void LayDanhMucCha()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMuc.Thongtin_Danhmuc_By_MaDMCha("0");
            dllDanhMucCha.Items.Clear();
            //dllDanhMucCha.Items.Add(new ListItem("Danh Mục Gốc", "0"));
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
        #endregion

        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            string picname = "";
            if (action.Equals("ThemMoi"))
            {
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByTen(tbTenSanPham.Text);
                if (kiemtra.Rows.Count == 0)
                {
                    if (flAnhDaiDien.FileContent.Length > 0)
                    {
                        string autoname = Database_thaotaccsdl.AppCode.Chucnang.SinhMa.SinhMaTuDong();
                        picname = autoname + flAnhDaiDien.FileName;
                        if (picname.EndsWith(".jpeg") || picname.EndsWith(".jpg") || picname.EndsWith(".png") || picname.EndsWith(".gif") || picname.EndsWith(".JPG"))
                        {
                            flAnhDaiDien.SaveAs(Server.MapPath("pic/SanPham/") + picname);
                        }
                    }
                    Database_thaotaccsdl.AppCode.Database.SanPham.Sanpham_Inser(tbTenSanPham.Text, ddlmau.SelectedValue, ddlsize.SelectedValue, ddlchatlieu.SelectedValue, picname, tbSoLuong.Text, tbGiaSanPham.Text,tbGiaNhap.Text, tbMoTaSanPham.Text, tbNgayTao.Text, tbNgayHuy.Text, dllDanhMucCha.SelectedValue, ddlnhom.SelectedValue, "");
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo mới " + tbTenSanPham.Text + "</div>";
                    if (cbTiepTuc.Checked == true)
                    {

                        ResetControl();
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=SanPham&action=ThemMoi");
                        LayDanhMucCha();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm sản phẩm mới thành công.');location.href='/Admin.aspx?module=SanPham&submodule=QLSanPham';", true);
                        //Response.Redirect("/Admin.aspx?module=SanPham&submodule=QLSanPham");
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại " + tbTenSanPham.Text + "</div>";
                }

            }
            else
            {
                id = Request.QueryString["id"];
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByTen(tbTenSanPham.Text);
                if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["MaSP"].ToString().Equals(id))
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


                    Database_thaotaccsdl.AppCode.Database.SanPham.SanPham_Update(id, tbTenSanPham.Text, ddlmau.SelectedValue, ddlsize.SelectedValue, ddlchatlieu.SelectedValue, tenanhdaidien, tbSoLuong.Text, tbGiaSanPham.Text, tbGiaNhap.Text, tbMoTaSanPham.Text, tbNgayTao.Text, tbNgayHuy.Text, dllDanhMucCha.SelectedValue, ddlnhom.SelectedValue);


                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã sửa thành công " + tbTenSanPham.Text + "</div>";
                    //Thread.Sleep(3000);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa thành công.');location.href='/Admin.aspx?module=SanPham&submodule=QLSanPham';", true);
                    //Response.Redirect("/Admin.aspx?module=SanPham&submodule=QLSanPham");
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại " + tbTenSanPham.Text + "</div>";
                }


            }
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


        private void ResetControl()
        {
            tbTenSanPham.Text = "";
            tbSoLuong.Text = "";
            tbGiaSanPham.Text = "";
            tbGiaNhap.Text = "";
            tbNgayTao.Text = "";
            tbNgayHuy.Text = "";
            tbMoTaSanPham.Text = "";
            cbTiepTuc.Checked = false;
            tbNgayHuy.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            tbNgayTao.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");


        }

        protected void btHuyBo_Click(object sender, EventArgs e)
        {
            ResetControl();
            Response.Redirect("Admin.aspx?module=SanPham&submodule=QLSanPham");
        }
    }
}