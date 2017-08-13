using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.QuangCao.QuanLyQuangCao.Ajax
{
    public partial class QuangCao : System.Web.UI.Page
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
            if (Request.Params["MaQuangCao"] != null)
                ma = Request.Params["MaQuangCao"];
            switch (action)
            {
                case "XoaQuangCao": XoaQuangCao(ma); break;
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

        private void XoaQuangCao(string ma)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.QuangCao.Thongtin_QuangCao_By_Id(ma);
            string fiName = dt.Rows[0]["AnhQC"].ToString();
            Database_thaotaccsdl.AppCode.Database.QuangCao.QuangCao_Delete(ma);
            DeleteFile(Server.MapPath("/pic/QuangCao/" + fiName));
            Response.Write(1);
        }
    }
}