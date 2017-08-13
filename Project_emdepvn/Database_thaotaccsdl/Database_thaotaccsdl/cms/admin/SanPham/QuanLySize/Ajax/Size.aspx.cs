using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLySize.Ajax
{
    public partial class Size : System.Web.UI.Page
    {
        private string action = "";
        private string ma = "";
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
            if (Request.Params["Ma"] != null)
                ma = Request.Params["Ma"];
            switch (action)
            {
                case "XoaSize": XoaSize(ma); break;
            }
            if (Request.Params["Action"] != null) action = Request.Params["Action"];
            if (Request.Params["Ma1"] != null)
                ma = Request.Params["Ma1"];
            switch (action)
            {
                //case "XoaDanhMuc": XoaDanhMuc(maDM); break;
                case "XoaSanPham": XoaSanPham(ma); break;
            }
        }

        private void XoaSanPham(string ma)
        {
            int kiemtra = 0;
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaSize_TatCa(ma);
            if (dt1.Rows.Count > 0)
            {
                DataTable dt2 = new DataTable();
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    dt2 = Database_thaotaccsdl.AppCode.Database.ChiTietDonDatHang.Thongtin_ChiTietDonDatHang_ByMSP(dt1.Rows[i]["MaSP"].ToString());
                    if (dt2.Rows.Count > 0) { kiemtra = kiemtra + 1; }
                }
                if (kiemtra == 0)
                {

                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        string fiName = dt1.Rows[i]["AnhSP"].ToString();
                        DeleteFile(Server.MapPath("/pic/SanPham/" + fiName));
                        Database_thaotaccsdl.AppCode.Database.SanPham.SanPham_Delete(dt1.Rows[i]["MaSP"].ToString());
                    }
                    Database_thaotaccsdl.AppCode.Database.Size.Size_Delete(ma);
                    Response.Write(1);

                }
                else
                    Response.Write(2);
            }

        }

        private void XoaSize(string ma)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaSize_TatCa(ma);
            if (dt1.Rows.Count == 0)
            {
                if (Request.Params["Ma"] != null)
                {
                    ma = Request.Params["Ma"];
                    DataTable dt = new DataTable();
                    Database_thaotaccsdl.AppCode.Database.Size.Size_Delete(ma);
                    Response.Write(1);
                }
                else
                    Response.Write(0);
            }
            else
                Response.Write(2);
        }
        private void XoaAnhTrongFolder(string ma)
        {
            DataTable laySP = new DataTable();
            laySP = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_MaSize_TatCa(ma);
            if (laySP.Rows.Count > 0)
            {
                for (int index = 0; index < laySP.Rows.Count; index++)
                {
                    string fiName = laySP.Rows[index]["AnhSP"].ToString();
                    DeleteFile(Server.MapPath("/pic/SanPham/" + fiName));
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

    }
}