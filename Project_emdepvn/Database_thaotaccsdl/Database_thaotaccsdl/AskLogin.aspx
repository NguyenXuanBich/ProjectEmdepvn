<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AskLogin.aspx.cs" Inherits="Database_thaotaccsdl.AskLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yêu cầu chuyển hướng</title>
    <link href="cms/admin/css/Login.css" rel="stylesheet" />
    <link href="cms/admin/css/font-face/font-face.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="FormDangNhap">
            <div class="head">Danh sách đăng nhập</div>
            <div class="formcon" style="text-align:center">
             <span style="margin-left: 50px;"><a href="/Login.aspx" style="color: #ffffff;font:normal 20px HelveticaNeue ;border-radius:5px;background:#8974f5;line-height:30px;margin-bottom:20px; position:relative;text-align:center;display:block;border:1px solid#2618d9; text-decoration:none">Đăng nhập của quản trị viên</a>
                 <a href="/LoginUser.aspx" style="color: #ffffff ;font:normal 20px HelveticaNeue; line-height:30px;background:#8974f5;border-radius:5px;text-decoration:none;display:block; border:1px solid#2618d9">Đăng nhập khách hàng</a>
                 <%-- <a href="/GiaodienUser/UserPage.aspx?modul=TaiKhoan&submodule=DangNhap" style="color: #ffffff ;font:normal 20px HelveticaNeue; line-height:30px;background:#8974f5;border-radius:5px;text-decoration:none;display:block; border:3px solid#2618d9">Đăng nhập người dùng thông thường</a>--%></span>
            </div>
        </div>
    </form>
</body>
</html>