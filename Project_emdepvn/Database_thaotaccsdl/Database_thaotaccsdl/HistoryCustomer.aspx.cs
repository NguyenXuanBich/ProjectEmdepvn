using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Database_thaotaccsdl
{
    public partial class HistoryCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Kiểm tra nếu đã đăng nhập thì cho tiếp tục
            if (Session["DNKhachHang"] != null && Session["DNKhachHang"].ToString() == "1")
            {
                string ten = Session["TenKh"].ToString();
                ltrTenDangNhap.Text = ten;
                plLichSuLoadControl.Controls.Add(LoadControl("GiaodienUser/LichSuGiaoDich/LichSuLoadControl.ascx"));
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Bạn chưa đăng nhập, hãy đăng nhập trước đã');location.href='/LoginUser.aspx';", true);

            }


        }

        protected void lbtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/GiaodienUser/UserPage.aspx");
        }
    }
}