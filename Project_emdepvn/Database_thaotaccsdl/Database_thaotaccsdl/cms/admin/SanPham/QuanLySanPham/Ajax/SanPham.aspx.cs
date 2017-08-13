using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLySanPham.Ajax
{
    public partial class SanPham : System.Web.UI.Page
    {

        private string action = "";
        private string maSP = "";
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

            if (Request.Params["ThaoTac"] != null) action = Request.Params["ThaoTac"];
            if (Request.Params["MaSP"] != null)
                maSP = Request.Params["MaSP"];
            switch (action)
            {
                case "XoaSanPham": XoaSanPham(maSP); break;
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

        private void XoaSanPham(string maSP)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.ChiTietDonDatHang.Thongtin_ChiTietDonDatHang_ByMSP(maSP);
            if (dt1.Rows.Count == 0)
            {
                if (Request.Params["MaSP"] != null)
                {
                    maSP = Request.Params["MaSP"];
                    DataTable dt = new DataTable();
                    dt = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_Sanpham_ByID(maSP);
                    string fiName = dt.Rows[0]["AnhSP"].ToString();                    
                    Database_thaotaccsdl.AppCode.Database.SanPham.SanPham_Delete(maSP);
                    DeleteFile(Server.MapPath("/pic/SanPham/" + fiName));
                    Response.Write(1);

                }
                else
                    Response.Write(0);
            }
            else
                Response.Write(2);
         

        }
    }
}