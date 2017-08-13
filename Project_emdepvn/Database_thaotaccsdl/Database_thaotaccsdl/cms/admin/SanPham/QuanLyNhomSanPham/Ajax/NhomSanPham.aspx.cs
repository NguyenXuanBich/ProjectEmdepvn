using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.SanPham.QuanLyNhomSanPham.Ajax
{
    public partial class NhomSanPham : System.Web.UI.Page
    {
        private string action = "";
        private string maNhom = "";
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
            if (Request.Params["MaNhom"] != null)
                maNhom = Request.Params["MaNhom"];
            switch (action)
            {
                case "XoaNhomSanPham": XoaNhomSanPham(maNhom); break;
                //case "XoaSanPham": XoaSanPham(maNhom); break;
            }
            if (Request.Params["Action"] != null) action = Request.Params["Action"];
            if (Request.Params["Ma"] != null)
                maNhom = Request.Params["Ma"];
            switch (action)
            {
                //case "XoaNhomSanPham": XoaNhomSanPham(maNhom); break;
                case "XoaSanPham": XoaSanPham(maNhom); break;
            }
        }

        private void XoaSanPham(string maNhom)
        {
            int kiemtra = 0;
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_NhomId_Tatca(maNhom);
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
                        string fiNameSP = dt1.Rows[i]["AnhSP"].ToString();
                        DeleteFile(Server.MapPath("/pic/SanPham/" + fiNameSP));
                        Database_thaotaccsdl.AppCode.Database.SanPham.SanPham_Delete(dt1.Rows[i]["MaSP"].ToString());
                    }
                        DataTable dt = new DataTable();
                        dt = Database_thaotaccsdl.AppCode.Database.NhomSanPham.Thongtin_NhomSP_By_Id(maNhom);
                        string fiName = dt.Rows[0]["AnhDaiDien"].ToString();
                        Database_thaotaccsdl.AppCode.Database.NhomSanPham.NhomSanPham_Delete(maNhom);
                        DeleteFile(Server.MapPath("/pic/SanPham/" + fiName));
                        Response.Write(1);
                }
                else
                    Response.Write(2);
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

        private void XoaNhomSanPham(string maNhom)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.SanPham.Thongtin_SanPham_By_NhomId_Tatca(maNhom);
            if (dt1.Rows.Count == 0)
            {
                    DataTable dt = new DataTable();
                    dt = Database_thaotaccsdl.AppCode.Database.NhomSanPham.Thongtin_NhomSP_By_Id(maNhom);
                    string fiName = dt.Rows[0]["AnhDaiDien"].ToString();
                    Database_thaotaccsdl.AppCode.Database.NhomSanPham.NhomSanPham_Delete(maNhom);
                    DeleteFile(Server.MapPath("/pic/SanPham/" + fiName));
                    Response.Write(1);
            }
            else
                Response.Write(2);

        }
    }
}