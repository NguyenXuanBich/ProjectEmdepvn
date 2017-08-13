using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl.GiaodienUser
{
    public partial class GiaoDienUserLoadControl : System.Web.UI.UserControl
    {
        private string modul = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["modul"] != null)
                modul = Request.QueryString["modul"];
            switch (modul)
            {
                case "SanPham":
                    PlGiaodienLoadControl.Controls.Add(LoadControl("SanPham/SanPhamLoadControl.ascx"));                   
                    break;
                case "ThanhVien":
                    PlGiaodienLoadControl.Controls.Add(LoadControl("ThanhVien/ThanhVienLoadControl.ascx"));
                    break;
                case "TinTuc":
                    PlGiaodienLoadControl.Controls.Add(LoadControl("TinTuc/TinTucLoadControl.ascx"));
                    break;
                case "TaiKhoan":
                    PlGiaodienLoadControl.Controls.Add(LoadControl("TaiKhoan/TaiKhoanLoadControl.ascx"));
                    break;
                case "TimKiem":
                    PlGiaodienLoadControl.Controls.Add(LoadControl("TimKiem/TimKiemLoadControl.ascx"));
                    break;
                default:
                    PlGiaodienLoadControl.Controls.Add(LoadControl("TrangChuHienThi/TrangChuLoadControl.ascx"));
                    //PlGiaodienLoadControl.Controls.Add(LoadControl("SanPham/SanPhamLoadControl.ascx"));     
                    break;
            }
        }
    }
}