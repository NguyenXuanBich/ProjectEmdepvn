using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.TaiKhoan.QLTaiKhoan.Ajax
{
    public partial class QLTaiKhoan : System.Web.UI.Page
    {
        private string thaotac = "";
        private string tenDN = "";
        private string maQuyen = "";
        private string tentaikhoan = "";
        protected void Page_Load(object sender, EventArgs e)
        {
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
            if (Session["TenDangNhap"] != null) { tenDN = Session["TenDangNhap"].ToString(); }
            if (Session["MaQuyen"] != null) { maQuyen = Session["MaQuyen"].ToString(); }


            if (Request.Params["ThaoTac"] != null)
                thaotac = Request.Params["ThaoTac"];
            if (Request.Params["TenTaiKhoan"] != null) tentaikhoan = Request.Params["TenTaiKhoan"];
            switch (thaotac)
            {
                case "XoaTaiKhoan":
                    XoaTaiKhoan(tentaikhoan);
                    break;

            }
        }
        private void XoaTaiKhoan(string tentaikhoan)
        {
            if (tenDN == "admin")
            {
                if (maQuyen == "1")
                {
                    if (tentaikhoan.ToLower() != "admin")
                    {
                        if (tentaikhoan != tenDN)
                        {

                            Database_thaotaccsdl.AppCode.Database.TaiKhoan.TaiKhoan_Delete(tentaikhoan);
                            Response.Write("1");


                        }
                        else
                        {
                            Response.Write("Không được xóa tài khoản đang đăng nhập");
                        }
                    }
                    else
                    {
                        Response.Write("Không được xóa tài khoản admin.");
                    }
                }
                else
                {
                    Response.Write("Bạn chưa có đủ quyền để xóa!.");
                }
            }
            else
            {
                Response.Write("Chỉ tài khoản admin mới được quyền xóa");
            }


        }
    }
}