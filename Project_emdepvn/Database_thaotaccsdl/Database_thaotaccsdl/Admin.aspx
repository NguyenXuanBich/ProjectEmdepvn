<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Database_thaotaccsdl.Admin" %>

<%@ Register Src="~/cms/admin/AdminLoadControl.ascx" TagPrefix="uc1" TagName="AdminLoadControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang quản trị của website</title>
    <link href="cms/admin/css/cssAdmin.css" rel="stylesheet" />
    <script src="cms/admin/js/jquery-1.11.3.min.js"></script>
    <%-- dành cho paging--%>
    <script src="cms/admin/js/jsPaging/dataTables.material.min.js"></script>
    <script src="cms/admin/js/jsPaging/jquery-1.12.4.js"></script>
    <script src="cms/admin/js/jsPaging/jquery.dataTables.min.js"></script>
    <link href="cms/admin/css/cssPaging/dataTables.material.min.css" rel="stylesheet" />
    <link href="cms/admin/css/cssPaging/material.min.css" rel="stylesheet" />
    <link href="cms/admin/css/font-face/font-face.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- Phần Header--%>
            <div id="header">
                <div class="containerr">
                    <div class="logo">
                        <a href="Admin.aspx">
                            <img src="pic/logo/logoemdep.png" /></a>
                    </div>
                    <div class="hotlinetopleft">
                        <span class="time">
                            <script type="text/javascript">
                                dayName = new Array("Chủ nhật", "Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu", "Thứ bảy")
                                monName = new Array("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
                                now = new Date
                                document.write("<font id=timedate color=#808080></b>Chào mừng Admin, bây giờ là: " + now.getHours() + ":" + now.getMinutes() + " phút -  " + dayName[now.getDay()] + ", " + now.getDate() + "-" + monName[now.getMonth()] + "-" + now.getFullYear() + "</b></font>")
                            </script>
                        </span>
                    </div>
                    <div class="accountMenu">
                        Welcome:
                        <asp:Literal ID="ltrTenDangNhap" runat="server"></asp:Literal>
                        |
                    <asp:LinkButton Style="color: #ff0000; font: bold" ID="lbtDangXuat" runat="server" OnClick="lbtDangXuat_Click" CausesValidation="false" >Đăng xuất</asp:LinkButton>
                    </div>
                </div>

            </div>
            <%-- End phần header--%>

            <%-- Menu Chính--%>
            <div class="MenuChinh">
                <div class="containerr">
                    <ul>
                        <li><a class="<%=DanhDau("TrangChu") %>" href="Admin.aspx?module=TrangChu" title="Trang Chủ">Trang Chủ</a></li>
                        <li><a class="<%=DanhDau("SanPham") %>" href="Admin.aspx?module=SanPham&submodule=QLSanPham" title="Sản Phẩm">Sản Phẩm</a></li>
                        <li><a class="<%=DanhDau("TinTuc") %>" href="Admin.aspx?module=TinTuc&submodule=QLTinTuc" title="Tin Tức">Tin Tức</a></li>
                        <li><a class="<%=DanhDau("TaiKhoan") %>" href="Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan" title="Tài Khoản">Tài Khoản</a></li>
                        <li><a class="<%=DanhDau("Menu") %>" href="Admin.aspx?module=Menu&action=DanhSachMenu" title="Menu">Menu</a></li>
                        <li><a class="<%=DanhDau("KhachHang") %>" href="Admin.aspx?module=KhachHang&action=DanhSachKhachHang" title="Khách Hàng">Khách Hàng</a></li>
<%--                        <li><a class="<%=DanhDau("TrangNoiDung") %>" href="Admin.aspx?module=TrangNoiDung" title="Trang nội dung">Trang nội dung</a></li>--%>
                        <li><a class="<%=DanhDau("QuangCao") %>" href="Admin.aspx?module=QuangCao&submodule=QLQuangCao" title="Quảng cáo">Quảng cáo</a></li>
<%--                        <li><a class="<%=DanhDau("HoTroTrucTuyen") %>" href="Admin.aspx?module=HoTroTrucTuyen" title="Hỗ trợ trực tuyến">Hỗ trợ trực tuyến</a></li>--%>
<%--                        <li><a class="<%=DanhDau("LienHe") %>" href="Admin.aspx?module=LienHe" title="Liên hệ">Liên hệ</a></li>--%>
<%--                        <li><a class="<%=DanhDau("ThietLap") %>" href="Admin.aspx?module=ThietLap" title="Thiết lập">Thiết lập</a></li>--%>
                        <li><a class="<%=DanhDau("BanHang") %>" href="Admin.aspx?module=BanHang&submodule=QLDonDatHang" title="Bán hàng">Bán hàng</a></li>
                        <li><a class="<%=DanhDau("NguoiDung") %>" href="/GiaodienUser/UserPage.aspx" title="Người dùng">Trang người dùng</a></li>
                    </ul>
                </div>
            </div>
            <%--  end Menu Chính--%>
            <div id="godown">
                  <div class="logo">
                        <a href="Admin.aspx">
                            <img src="pic/logo/logoemdep.png" /></a>
                    </div>
            </div>
            <script>
                jQuery(document).ready(function () {
                    var vitri = 120;
                    var duration = 500;
                    if (jQuery(this).scrollTop() < vitri) { jQuery('#godown').fadeOut(duration); }

                    jQuery(window).scroll(function () {
                        if (jQuery(this).scrollTop() > vitri) {
                            jQuery('#godown').fadeIn(duration);
                        } else {
                            jQuery('#godown').fadeOut(duration);
                        }
                    });

                    //jQuery('#godown').click(function (event) {
                    //    event.preventDefault();
                    //    jQuery('html, body').animate({ scrollTop: 0 }, duration);
                    //    return false;
                    //})
                });
            </script>
            <%--   Phần nội dung trang quản trị--%>
            <uc1:AdminLoadControl runat="server" ID="AdminLoadControl" />
        </div>
    </form>
</body>
</html>
