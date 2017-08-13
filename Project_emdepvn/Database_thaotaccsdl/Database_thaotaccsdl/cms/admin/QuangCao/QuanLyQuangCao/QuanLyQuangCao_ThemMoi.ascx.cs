using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.QuangCao.QuanLyQuangCao
{
    public partial class QuanLyQuangCao_ThemMoi : System.Web.UI.UserControl
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
                LayNhomQC();
                HienThiThongTin(id);

            }
        }

        private void HienThiThongTin(string id)
        {
            if (action.Equals("ChinhSua"))
            {
                cbTiepTuc.Visible = false;
                btThemMoi.Text = "Chỉnh sửa";
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_By_Id(id);
                if (dt.Rows.Count > 0)
                {
                    dllNhomQuangCao.SelectedValue = dt.Rows[0]["NhomQuangCaoID"].ToString();
                    tbtenqc.Text = dt.Rows[0]["TenQC"].ToString();
                    tbloaiqc.Text = dt.Rows[0]["LoaiQC"].ToString();
                    ltrAnhQC.Text = "<img class='anhdaidien' src='/pic/QuangCao/" + dt.Rows[0]["AnhQC"] + @"'/>";
                    hdtenanhqccu.Value = dt.Rows[0]["AnhQC"].ToString();
                    tblienket.Text = dt.Rows[0]["LienKet"].ToString();
                    tbthutu.Text = dt.Rows[0]["ThuTuQC"].ToString();
                }
            }
            if (action.Equals("ThemMoi"))
            {
                cbTiepTuc.Visible = true;
            }
        }

        #region Lấy ra thông tin nhóm QC
        private void LayNhomQC()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.NhomQuangCao.Thongtin_NhomQuangCao();
            dllNhomQuangCao.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dllNhomQuangCao.Items.Add(new ListItem(dt.Rows[i]["TenNhomQuangCao"].ToString(), dt.Rows[i]["NhomQuangCaoID"].ToString()));
            }
        }
        #endregion

        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            string picname = "";
            DataTable dtten = new DataTable();
            dtten = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_By_Ten(tbtenqc.Text.ToString());
            if (action.Equals("ThemMoi"))
            {
                if (dtten.Rows.Count == 0)
                {


                    if (flAnhQC.FileContent.Length > 0)
                    {
                        string autoname = Database_thaotaccsdl.AppCode.Chucnang.SinhMa.SinhMaTuDong();
                        picname = autoname + flAnhQC.FileName;
                        if (picname.EndsWith(".jpeg") || picname.EndsWith(".jpg") || picname.EndsWith(".png") || picname.EndsWith(".gif") || picname.EndsWith(".JPG"))
                        {
                            flAnhQC.SaveAs(Server.MapPath("pic/QuangCao/") + picname);
                        }
                    }
                    Database_thaotaccsdl.AppCode.Database.QuangCao.QuangCao_Inser(tbtenqc.Text, tbloaiqc.Text, picname, tblienket.Text, tbthutu.Text, dllNhomQuangCao.SelectedValue, "");
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo mới quảng cáo " + tbtenqc.Text + "</div>";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm mới thành công')", true);
                    if (cbTiepTuc.Checked == true)
                    {
                        ResetControl(this);
                        LayNhomQC();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm mới thành công.');location.href='/Admin.aspx?module=QuangCao&submodule=QLQuangCao';", true);
                        //Response.Redirect("/Admin.aspx?module=QuangCao&submodule=QLQuangCao");
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Trùng tên với quảng cáo đã có trên hệ thống')", true);
                }

            }


            else
            {
                if (dtten.Rows.Count == 0 || dtten.Rows[0]["QuangCaoID"].ToString().Equals(id))
                {
                    string tenanhdaidien = "";
                    if (flAnhQC.FileContent.Length > 0)
                    {
                        string autoname = Database_thaotaccsdl.AppCode.Chucnang.SinhMa.SinhMaTuDong();
                        picname = autoname + flAnhQC.FileName;
                        if (picname.EndsWith(".jpeg") || picname.EndsWith(".jpg") || picname.EndsWith(".png") || picname.EndsWith(".gif ") || picname.EndsWith(".JPG "))
                        {
                            flAnhQC.SaveAs(Server.MapPath("pic/QuangCao/") + picname);
                            tenanhdaidien = picname;
                        }
                    }
                    if (tenanhdaidien == "")
                    {
                        tenanhdaidien = hdtenanhqccu.Value;
                    }
                    else { DeleteFile(Server.MapPath("/pic/QuangCao/" + hdtenanhqccu.Value)); }
                    Database_thaotaccsdl.AppCode.Database.QuangCao.QuangCao_Update(id, tbtenqc.Text, tbloaiqc.Text, tenanhdaidien, tblienket.Text, tbthutu.Text, dllNhomQuangCao.SelectedValue);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa thành công')", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa thành công.');location.href='/Admin.aspx?module=QuangCao&submodule=QLQuangCao';", true);

                    //Response.Redirect("/Admin.aspx?module=QuangCao&submodule=QLQuangCao");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Trùng tên với quảng cáo đã có trên hệ thống')", true);
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


        private void ResetControl(Control Parent)
        {
            foreach (Control mycontrols in Parent.Controls)
                if (mycontrols is TextBox)
                {

                    (mycontrols as TextBox).Text = string.Empty;

                }
            cbTiepTuc.Checked = false;

        }

        protected void btHuyBo_Click(object sender, EventArgs e)
        {
            ResetControl(this);
            Response.Redirect("/Admin.aspx?module=QuangCao&submodule=QLQuangCao");
        }
    }
}