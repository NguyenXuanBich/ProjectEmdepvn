using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Database_thaotaccsdl.cms.admin.TinTuc.QuanLyTinTuc.Ajax
{
    public partial class TinTuc : System.Web.UI.Page
    {
        private string action = "";
        private string maTin = "";
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
            if (Request.Params["MaTin"] != null)
                maTin = Request.Params["MaTin"];
            switch (action)
            {
                case "XoaTinTuc": XoaTinTuc(maTin); break;
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

        private void XoaTinTuc(string maTin)
        {
            DataTable dt = new DataTable();
            dt = Database_thaotaccsdl.AppCode.Database.TinTuc.Thongtin_TinTuc_By_Id(maTin);
            string fiName = dt.Rows[0]["AnhDaiDien"].ToString();
            Database_thaotaccsdl.AppCode.Database.TinTuc.TinTuc_Delete(maTin);
            DeleteFile(Server.MapPath("/pic/TinTuc/" + fiName));
            Response.Write(1);
        }
    }
}