using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.TaiKhoan.QuyenDangNhap.Ajax
{
    public partial class QuyenDangNhap : System.Web.UI.Page
    {
        private string action = "";
        private string ma = "";
        private string tenDN = "";
        private string maQuyen = "";
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
            if (Request.Params["ThaoTac"] != null) action = Request.Params["ThaoTac"];
            if (Request.Params["Ma"] != null)
                ma = Request.Params["Ma"];
            switch (action)
            {
                case "XoaQuyen": XoaQuyen(ma); break;
            }
            if (Request.Params["Action"] != null) action = Request.Params["Action"];
            if (Request.Params["Ma1"] != null)
                ma = Request.Params["Ma1"];
            switch (action)
            {
                //case "XoaDanhMuc": XoaDanhMuc(maDM); break;
                case "XoaNhanVien": XoaAdmin(ma); break;
            }
        }

        private void XoaAdmin(string ma)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.TaiKhoan.Thongtin_TaiKhoan_By_MaQuyen(ma);
            if (dt1.Rows.Count > 0)
            {
                if (ma != "1")
                {
                    if (maQuyen == "1")
                    {
                        for (int tk = 0; tk < dt1.Rows.Count; tk++)
                        {
                            Database_thaotaccsdl.AppCode.Database.TaiKhoan.TaiKhoan_Delete(dt1.Rows[0]["TenDangNhap"].ToString());
                        }
                            Database_thaotaccsdl.AppCode.Database.QuyenDangNhap.QuyenDangNhap_Delete(ma);
                        Response.Write(1);
                    }
                    else
                        Response.Write(2);
                }
                else
                    Response.Write(3);

            }

        }

        private void XoaQuyen(string ma)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.TaiKhoan.Thongtin_TaiKhoan_By_MaQuyen(ma);
            if (dt1.Rows.Count == 0)
            {
                if (ma != "1")
                {
                    if (maQuyen == "1")
                    {
                        if (Request.Params["Ma"] != null)
                        {
                            ma = Request.Params["Ma"];
                            DataTable dt = new DataTable();
                            Database_thaotaccsdl.AppCode.Database.QuyenDangNhap.QuyenDangNhap_Delete(ma);
                            Response.Write(1);
                        }
                        else
                            Response.Write(0);

                    }
                    else
                        Response.Write(2);
                }
                else
                    Response.Write(3);
            }
            else
                Response.Write(4);
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
    }
}