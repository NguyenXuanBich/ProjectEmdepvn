using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using CKEditor;

namespace Database_thaotaccsdl.cms.admin.TinTuc.QuanLyTinTuc
{
    public partial class QuanLyTinTuc_ThemMoi : System.Web.UI.UserControl
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
            #region lấy request
            if (Request.QueryString["action"] != null) action = Request.QueryString["action"];
            if (Request.QueryString["id"] != null) id = Request.QueryString["id"];

            #endregion

            if (!IsPostBack)
            {
                LayDanhMucCha();
                HienThiThongTin(id);
                //Response.Write(id);
                tbNoidungchitiet.Language = "vi";

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
                dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_Id(id);

                if (dt.Rows.Count > 0)
                {
                    dllDanhMucCha.SelectedValue = dt.Rows[0]["MaDM"].ToString();
                    tbTieudetin.Text = dt.Rows[0]["TieuDe"].ToString();
                    ltrAnhDaiDien.Text = "<img class='anhdaidien' src='/pic/TinTuc/" + dt.Rows[0]["AnhDaiDien"] + @"'/>";
                    tbMota.Text = dt.Rows[0]["MoTa"].ToString();
                    hdtenanhdaidiencu.Value = dt.Rows[0]["AnhDaiDien"].ToString();
                    tbNgaydang.Text = dt.Rows[0]["NgayDang"].ToString();
                    tbSoluotxem.Text = dt.Rows[0]["LuotXem"].ToString();
                    tbThutu.Text = dt.Rows[0]["ThuTu"].ToString();
                    tbNoidungchitiet.Text = dt.Rows[0]["ChiTiet"].ToString();
                }
            }
            if (action.Equals("ThemMoi"))
            {
                cbTiepTuc.Visible = true;
                tbNgaydang.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
                tbSoluotxem.Text = "0";
            }



        }

        #region Lấy ra thông tin danh mục
        private void LayDanhMucCha()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_MaDMCha("0");
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
            dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_MaDMCha(madmcha);
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
                kiemtra = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_Ten(tbTieudetin.Text);
                if (kiemtra.Rows.Count == 0)
                {
                    if (flAnhDaiDien.FileContent.Length > 0)
                    {
                        string autoname = Database_thaotaccsdl.AppCode.Chucnang.SinhMa.SinhMaTuDong();
                        picname = autoname + flAnhDaiDien.FileName;
                        if (picname.EndsWith(".jpeg") || picname.EndsWith(".jpg") || picname.EndsWith(".png") || picname.EndsWith(".gif") || picname.EndsWith(".JPG"))
                        {
                            flAnhDaiDien.SaveAs(Server.MapPath("pic/TinTuc/") + picname);
                        }
                    }
                    Database_thaotaccsdl.AppCode.Database.TinTuc.TinTuc_Insert(tbTieudetin.Text, picname, tbMota.Text, tbNgaydang.Text, tbSoluotxem.Text, tbNoidungchitiet.Text, tbThutu.Text, dllDanhMucCha.SelectedValue);
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo mới bản tin " + tbTieudetin.Text + "</div>";
                    if (cbTiepTuc.Checked == true)
                    {

                        ResetControl();           
                        LayDanhMucCha();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm Tin mới thành công.');location.href='/Admin.aspx?module=TinTuc&submodule=QLTinTuc';", true);
                        //Response.Redirect("/Admin.aspx?module=TinTuc&submodule=QLTinTuc");
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại bản tin mang tiêu đề " + tbTieudetin.Text + " hãy nhập một tiêu đề khác</div>";
                }

            }
            else
            {
                id = Request.QueryString["id"];
                DataTable kiemtra = new DataTable();
                kiemtra = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_Ten(tbTieudetin.Text);
                if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["TinTucID"].ToString().Equals(id))
                {
                    string tenanhdaidien = "";
                    if (flAnhDaiDien.FileContent.Length > 0)
                    {
                        string autoname = Database_thaotaccsdl.AppCode.Chucnang.SinhMa.SinhMaTuDong();
                        picname = autoname + flAnhDaiDien.FileName;
                        if (picname.EndsWith(".jpeg") || picname.EndsWith(".jpg") || picname.EndsWith(".png") || picname.EndsWith(".gif ") || picname.EndsWith(".JPG "))
                        {
                            flAnhDaiDien.SaveAs(Server.MapPath("pic/TinTuc/") + picname);
                            tenanhdaidien = picname;
                        }
                    }
                    if (tenanhdaidien == "")
                    {
                        tenanhdaidien = hdtenanhdaidiencu.Value;
                    }
                    else { DeleteFile(Server.MapPath("/pic/TinTuc/" + hdtenanhdaidiencu.Value)); }


                    Database_thaotaccsdl.AppCode.Database.TinTuc.TinTuc_Update(id, tbTieudetin.Text, tenanhdaidien, tbMota.Text, tbNgaydang.Text, tbSoluotxem.Text, tbNoidungchitiet.Text, tbThutu.Text, dllDanhMucCha.SelectedValue);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa Tin thành công.');location.href='/Admin.aspx?module=TinTuc&submodule=QLTinTuc';", true);

                    //ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã sửa thành công bản tin  " + tbTieudetin.Text + "</div>";
                    //Thread.Sleep(3000);

                    //Response.Redirect("/Admin.aspx?module=TinTuc&submodule=QLTinTuc");
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại bản tin với tiêu đề là " + tbTieudetin.Text + " hãy sửa lại để không bị trùng</div>";
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
            //foreach (Control mycontrols in Parent.Controls)
            //    if (mycontrols is TextBox)
            //    {

            //        (mycontrols as TextBox).Text = string.Empty;

            //    }
            tbTieudetin.Text ="";
            ltrAnhDaiDien.Text ="";
            tbMota.Text = "";
            hdtenanhdaidiencu.Value = "";
            tbThutu.Text = "";
            tbNoidungchitiet.Text = "";
            cbTiepTuc.Checked = false;
            tbNgaydang.Text = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt");
            tbSoluotxem.Text = "0";


        }

        protected void btHuyBo_Click(object sender, EventArgs e)
        {
            ResetControl();
            Response.Redirect("Admin.aspx?module=TinTuc&submodule=QLTinTuc");
        }
    }
}