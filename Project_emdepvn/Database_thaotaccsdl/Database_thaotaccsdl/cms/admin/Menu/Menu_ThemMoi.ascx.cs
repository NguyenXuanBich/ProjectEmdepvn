using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.Menu
{
    public partial class Menu_ThemMoi : System.Web.UI.UserControl
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
                LayMenuCha();
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
                dt = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_Id(id);

                if (dt.Rows.Count > 0)
                {
                    dllmenucha.SelectedValue = dt.Rows[0]["MaMenuCha"].ToString();
                    tbtenmenu.Text = dt.Rows[0]["TenMenu"].ToString();
                    tblink.Text = dt.Rows[0]["LienKet"].ToString();
                    tbthutu.Text = dt.Rows[0]["ThuTuMenu"].ToString();
                }
            }



        }
        #region Lấy Menu Cha
        private void LayMenuCha()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCha("0");
            dllmenucha.Items.Clear();
            dllmenucha.Items.Add(new ListItem("MenuChinh", "0"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dllmenucha.Items.Add(new ListItem(dt.Rows[i]["TenMenu"].ToString(), dt.Rows[i]["MaMenu"].ToString()));
                LayDanhMucCon(dt.Rows[i]["MaMenu"].ToString(), "-----");
            }
        }

        private void LayDanhMucCon(string madmcha, string khoangcach)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCha(madmcha);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dllmenucha.Items.Add(new ListItem(khoangcach + dt.Rows[i]["TenMenu"].ToString(), dt.Rows[i]["MaMenu"].ToString()));
                LayDanhMucCon(dt.Rows[i]["MaMenu"].ToString(), khoangcach + "-----");
            }
        }
        #endregion

        protected void btThemMoi_Click(object sender, EventArgs e)
        {
            DataTable kiemtra = new DataTable();
            kiemtra = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_Ten(tbtenmenu.Text);
            if (action.Equals("ThemMenu"))
            {              
                if (kiemtra.Rows.Count == 0)
                {
                    Database_thaotaccsdl.AppCode.Database.Menu.Menu_Insert(tbtenmenu.Text, tblink.Text, dllmenucha.SelectedValue, tbthutu.Text, "");
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã tạo menu mới " + tbtenmenu.Text + "</div>";
                    if (cbTiepTuc.Checked == true)
                    {

                        ResetControl(this);
                        LayMenuCha();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Thêm Menu mới thành công.');location.href='/Admin.aspx?module=Menu&action=DanhSachMenu';", true);
                    }
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại menu: " + tbtenmenu.Text + "</div>";
                }

            }
            else
            {
                if (kiemtra.Rows.Count == 0 || kiemtra.Rows[0]["MaMenu"].ToString().Equals(id))
                {
                    Database_thaotaccsdl.AppCode.Database.Menu.Menu_update(id, tbtenmenu.Text, tblink.Text, dllmenucha.SelectedValue, tbthutu.Text);
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Đã sửa thành cái mới " + tbtenmenu.Text + "</div>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Sửa Menu thành công.');location.href='/Admin.aspx?module=Menu&action=DanhSachMenu';", true);
                }
                else
                {
                    ltrthongbao.Text = "<div class='thongbaotaothanhcong'>Lỗi: Đã tồn tại: " + tbtenmenu.Text + "</div>";
                }


            }
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
            ResetControl(this);
            Response.Redirect("/Admin.aspx?module=Menu&action=DanhSachMenu");
        }
    }
}