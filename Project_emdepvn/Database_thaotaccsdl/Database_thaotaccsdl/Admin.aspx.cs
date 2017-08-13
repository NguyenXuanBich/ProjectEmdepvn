using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Kiểm tra nếu đã đăng nhập thì cho vào trang admin
            if (Session["DangNhap"] != null && Session["DangNhap"].ToString() == "1")
            {
                //đã đăng nhập
            }
            else
            {
                //Nếu chưa đăng nhập thì đẩy lại về trang login
                Response.Redirect("/Login.aspx");
            }
            if (!IsPostBack)
                ltrTenDangNhap.Text = Session["TenDangNhap"].ToString();
        }
        public string DanhDau(string TenModule)
        {
            string s = "";
            string module = "";
            if (Request.QueryString["module"] != null)
                module = Request.QueryString["module"];
            if (module == TenModule)
                s = "curent";
            return s;


        }
        protected void lbtDangXuat_Click(object sender, EventArgs e)
        {
            //Xóa hết các session đã lưu
            Session["DangNhap"] = null;
            Session["TenDangNhap"] = null;
            //Đưa về trang login
            Response.Redirect("/Login.aspx");
        }
    }
}