using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.Menu
{
    public partial class Menu_HienThi : System.Web.UI.UserControl
    {
        private string maMenuCha = "0";
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
            if (Request.QueryString["mamenucha"] != null)
                maMenuCha = Request.QueryString["mamenucha"];
            if (!IsPostBack)
                LayMenu();
        }
        private void LayMenu()
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCha(maMenuCha);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string ten = dt.Rows[i]["TenMenu"].ToString();
                if (ten.Length > 50) ten = ten.Substring(0, 50);
                ltrMenu.Text += @" <tr id='MaDong_" + dt.Rows[i]["MaMenu"] + @"'>
            <td class='cotMa'>" + dt.Rows[i]["MaMenu"] + @"</td>
            <td class='cotTen'>" + ten + @"</td>
            <td class='cotMoTa'><p class='mota'>Xem liên kết</p><p class='motahover'>" + dt.Rows[i]["LienKet"].ToString() + @"</p></td>
            <td class='cotMa'>" + dt.Rows[i]["MaMenuCha"] + @"</td>
            <td class='cotThuTu'>" + dt.Rows[i]["ThuTuMenu"] + @"</td>
            <td class='cotCongCu'>";
                if (CheckMenuCon(dt.Rows[i]["MaMenu"].ToString()))
                {
                    ltrMenu.Text += @"<a href='Admin.aspx?module=Menu&mamenucha=" + dt.Rows[i]["MaMenu"] + @"' class='dmcon' title='Menu con'>&nbsp</a>";
                    DataTable dt1 = new DataTable();
                    dt1 = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCon(dt.Rows[i]["MaMenu"].ToString());
                    if (dt1.Rows.Count > 0)
                    {
                        DataTable dt2 = new DataTable();
                        dt2 = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCon(dt1.Rows[0]["MaMenuCha"].ToString());
                        if (dt2.Rows.Count > 0) { ltrMenu.Text += @"<a href='Admin.aspx?module=Menu&mamenucha=" + dt2.Rows[0]["MaMenuCha"] + @"' class='dmcha' title='Menu cha'>&nbsp</a>"; }

                    }
                }
                else
                {
                    DataTable dt1 = new DataTable();
                    dt1 = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCon(dt.Rows[i]["MaMenu"].ToString());
                    if (dt1.Rows.Count > 0)
                    {
                        DataTable dt2 = new DataTable();
                        dt2 = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCon(dt1.Rows[0]["MaMenuCha"].ToString());
                        if (dt2.Rows.Count > 0) { ltrMenu.Text += @"<a href='Admin.aspx?module=Menu&mamenucha=" + dt2.Rows[0]["MaMenuCha"] + @"' class='dmcha' title='Menu cha'>&nbsp</a>"; }

                    }
                }


                ltrMenu.Text += @"<a href='Admin.aspx?module=Menu&action=ChinhSua&id=" + dt.Rows[i]["MaMenu"] + @"' class='sua' title='Sửa'>&nbsp</a>
                <a href='javascript:XoaMenu(" + dt.Rows[i]["MaMenu"] + @")' class='xoa' title='Xóa'>&nbsp</a>
            </td>
        </tr>";
            }

            //GridView1.DataSource = dt;
            //GridView1.DataBind();
        }
        bool CheckMenuCon(string maMenuCha)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.Menu.Thongtin_Menu_By_MaMenuCha(maMenuCha);
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else return false;

        }

    }
}