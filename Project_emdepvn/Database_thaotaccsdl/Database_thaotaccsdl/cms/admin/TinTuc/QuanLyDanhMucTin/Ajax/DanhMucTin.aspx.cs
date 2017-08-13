using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace Database_thaotaccsdl.cms.admin.TinTuc.QuanLyDanhMucTin.Ajax
{
    public partial class DanhMucTin : System.Web.UI.Page
    {
        private string action = "";
        private string maDM = "";
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
            if (Request.Params["MaDM"] != null)
                maDM = Request.Params["MaDM"];
            switch (action)
            {
                case "XoaDanhMuc": XoaDanhMuc(maDM); break;
                //case "XoaSanPham": XoaSanPham(maDM); break;
            }
            if (Request.Params["Action"] != null) action = Request.Params["Action"];
            if (Request.Params["Ma"] != null)
                maDM = Request.Params["Ma"];
            switch (action)
            {
                //case "XoaDanhMuc": XoaDanhMuc(maDM); break;
                case "XoaTinTuc": XoaTinTuc(maDM); break;
            }
        }

        private void XoaTinTuc(string maDM)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM_TatCa(maDM);
            if (dt1.Rows.Count > 0)
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    string fiNameSP = dt1.Rows[i]["AnhDaiDien"].ToString();                  
                    Database_thaotaccsdl.AppCode.Database.TinTuc.TinTuc_Delete(dt1.Rows[i]["TinTucID"].ToString());
                    DeleteFile(Server.MapPath("/pic/TinTuc/" + fiNameSP));
                }
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_Id(maDM);
                string fiName = dt.Rows[0]["AnhDaiDien"].ToString();
                Database_thaotaccsdl.AppCode.Database.DanhMucTin.DanhMucTin_Delete(maDM);
                DeleteFile(Server.MapPath("/pic/TinTuc/" + fiName));
                Response.Write(1);
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

        private void XoaDanhMuc(string maDM)
        {
            DataTable dtkiemtratinhtrangcon = new DataTable();
            dtkiemtratinhtrangcon = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_MaDMCha(maDM);
            if (dtkiemtratinhtrangcon.Rows.Count == 0)
            {
                DataTable dt1 = new DataTable();
                dt1 = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_MaDM_TatCa(maDM);
                if (dt1.Rows.Count == 0)
                {
                    if (Request.Params["MaDM"] != null)
                    {
                        maDM = Request.Params["MaDM"];
                        DataTable dt = new DataTable();
                        dt = Database_thaotaccsdl.AppCode.Database.DanhMucTin.Thongtin_DanhMucTin_By_Id(maDM);
                        string fiName = dt.Rows[0]["AnhDaiDien"].ToString();
                        Database_thaotaccsdl.AppCode.Database.DanhMucTin.DanhMucTin_Delete(maDM);
                        DeleteFile(Server.MapPath("/pic/TinTuc/" + fiName));
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

    }
}