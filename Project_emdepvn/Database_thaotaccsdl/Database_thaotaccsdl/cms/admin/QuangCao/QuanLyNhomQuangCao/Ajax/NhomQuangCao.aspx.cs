using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.QuangCao.QuanLyNhomQuangCao.Ajax
{
    public partial class NhomQuangCao : System.Web.UI.Page
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
                case "XoaNhomQuangCao": XoaNhomQuangCao(maNhom); break;
                //case "XoaSanPham": XoaSanPham(maNhom); break;
            }
            if (Request.Params["Action"] != null) action = Request.Params["Action"];
            if (Request.Params["Ma"] != null)
                maNhom = Request.Params["Ma"];
            switch (action)
            {
                //case "XoaNhomSanPham": XoaNhomSanPham(maNhom); break;
                case "XoaQC": XoaQC(maNhom); break;
            }
        }

        private void XoaQC(string maNhom)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID(maNhom);
            if (dt1.Rows.Count > 0)
            {
                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        string fiNameSP = dt1.Rows[i]["AnhQC"].ToString();
                        DeleteFile(Server.MapPath("/pic/QuangCao/" + fiNameSP));
                        Database_thaotaccsdl.AppCode.Database.QuangCao.QuangCao_Delete(dt1.Rows[i]["QuangCaoID"].ToString());
                    }
                    DataTable dt = new DataTable();
                    dt = Database_thaotaccsdl.AppCode.Database.NhomQuangCao.Thongtin_NhomQuangCao_By_Id(maNhom);
                    string fiName = dt.Rows[0]["AnhDaiDienQC"].ToString();
                    Database_thaotaccsdl.AppCode.Database.NhomQuangCao.NhomQuangCao_Delete(maNhom);
                    DeleteFile(Server.MapPath("/pic/QuangCao/" + fiName));
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

        private void XoaNhomQuangCao(string maNhom)
        {
            DataTable dt1 = new DataTable();
            dt1 = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_ByNhomQuangCaoID(maNhom);
            if (dt1.Rows.Count == 0)
            {
                DataTable dt = new DataTable();
                dt = Database_thaotaccsdl.AppCode.Database.NhomQuangCao.Thongtin_NhomQuangCao_By_Id(maNhom);
                string fiName = dt.Rows[0]["AnhDaiDienQC"].ToString();
                Database_thaotaccsdl.AppCode.Database.NhomQuangCao.NhomQuangCao_Delete(maNhom);
                DeleteFile(Server.MapPath("/pic/QuangCao/" + fiName));
                Response.Write(1);
            }
            else
                Response.Write(2);

        }
    }
}