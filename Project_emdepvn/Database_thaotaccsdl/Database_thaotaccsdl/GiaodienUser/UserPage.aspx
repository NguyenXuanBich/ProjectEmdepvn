<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.UserPage" %>

<%@ Register Src="~/GiaodienUser/GiaoDienUserLoadControl.ascx" TagPrefix="uc1" TagName="GiaoDienUserLoadControl" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EMDEP.VN</title>
    <link href="../cms/admin/css/font-face/font-face.css" rel="stylesheet" />
    <%--<link href="../cms/admin/css/cssAdmin.css" rel="stylesheet" />--%>
    <link href="../cms/admin/css/Default.css" rel="stylesheet" />
    <script src="../cms/admin/js/jquery-1.11.3.min.js"></script>
    <link href="../cms/jCarousel/style.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">

        <!--HOTLINE ĐẦU TRANG-->
        <div id="hotlinetop">
            <div class="container980">
                <div class="hotlinetopleft">
                    <span class="time">
                        <script type="text/javascript">
                            dayName = new Array("Chủ nhật", "Thứ hai", "Thứ ba", "Thứ tư", "Thứ năm", "Thứ sáu", "Thứ bảy")
                            monName = new Array("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
                            now = new Date
                            document.write("<font id=timedate color=#808080></b>" + now.getHours() + ":" + now.getMinutes() + " phút -  " + dayName[now.getDay()] + ", " + now.getDate() + "-" + monName[now.getMonth()] + "-" + now.getFullYear() + "</b></font>")
                        </script>
                    </span>
                </div>
                <!--Tìm kiếm và login-->
                <span id="searchlogin" style="position: absolute; line-height: 40px; /*height: 120px; */ margin-left: 200px" runat="server">
                    <asp:TextBox ID="tbTimKiem" placeholder="Nhập tin tức hay sản phẩm cần tìm" runat="server" Height="20" Width="300" BackColor="#E0E0E0" border="solid 1px #78b43d !important"></asp:TextBox>
                    <%--                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTimKiem" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>

                    <asp:Button ID="btnLTK" runat="server" Text="Search" BorderStyle="None" Height="30" Width="80" BackColor="#E0E0E0" ForeColor="#909090 " OnClick="btnTK_Click" TabIndex="0" />
                    <span style="margin-left: 30px;">
                        <asp:Literal ID="ltrUsers" runat="server"></asp:Literal>
                        <asp:PlaceHolder ID="plAfter" runat="server" Visible="false">
                            <a href="#" style="color: #2618d9; font: normal 12px HelveticaNeue; text-decoration: none !important; text-decoration: none" title="Đăng xuất">
                                <asp:LinkButton ID="lbtDangXuat" runat="server" CausesValidation="false" OnClick="lbtDangXuat_Click">Đăng xuất</asp:LinkButton>
                            </a>
                            <a href="/DoiMK.aspx" style="color: #ff6a00; font: normal 13px HelveticaNeue; /*line-height: 30px; */ /*background: #8974f5; border-radius: 5px; */ text-decoration: none; display: inline-block; /*border: 3px solid#2618d9*/">/ Đổi mật khẩu</a>
                            <a href="/HistoryCustomer.aspx" style="color: #2618d9; font: normal 13px HelveticaNeue; /*line-height: 30px; */ /*background: #8974f5; border-radius: 5px; */ text-decoration: none; display: inline-block; /*border: 3px solid#2618d9*/">/ Lịch sử</a>

                        </asp:PlaceHolder>
                        <%--<a href="/AskLogin.aspx" style="color: #000;">Đăng nhập</a>/<a href="UserPage.aspx?modul=TaiKhoan&submodule=Dangkytaikhoan" style="color: #2618d9;">Đăng ký</a>--%></span>
                </span>
            </div>
        </div>
        <%-- <div class="clearboth" style="clear:both"></div>--%>
        <div id="hotline">
            <div class="container980">
                <div class="Logoimg">
                    <asp:Literal ID="LtLogo" runat="server"></asp:Literal>
                    <%--<img src="../pic/logo/logoemdep.png" />--%>
                </div>
                <div class="quangcaotop">
                    <div class="advertisementtop">
                        <div class="itemquangcaongangtop">
                            <div class="khungAnh" style="height: 108px">
                                <asp:Literal ID="ltrquangcaotop" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="clear" style="clear:both"></div>--%>
        <%--formđong--%>
        <!--MENU-->
        <div id="menu">
            <div class="container980">

                <!--Main menu-->
                <div class="mainmenu">
                    <ul>
                        <asp:Literal ID="LtMenu" runat="server"></asp:Literal>
                    </ul>
                </div>
                <!--end main menu-->
                <%--giỏ hàng--%>
                <a class="gioHang" href="/GiaodienUser/UserPage.aspx?modul=SanPham&modulcon=GioHang" title="Your Cart"></a>
            </div>
        </div>
        <!--end menu-->
        <%-- Nội dung--%>
        <div id="content">
            <div class="container980">
                <uc1:GiaoDienUserLoadControl runat="server" ID="GiaoDienUserLoadControl" />
            </div>

        </div>
        <%--  end nội dung--%>
        <a class="gotop" href="#" id="go_top" title="Quay lên trên">
            <img src="/pic/icon/up-top.png" />
        </a>
        <div id="CommunicationNetwork">
            <a href="https://www.facebook.com/emdep.vn/?fref=ts" title="Facebook Emdep.vn" id="facebook">
                <img src="/pic/icon/Facebook.png" />
            </a>
            <a href="#" id="googleplus">
                <img src="/pic/icon/googleplus.png" title="Google+" />
            </a>
            <a href="#" id="twiter">
                <img src="/pic/icon/twiter.png" title="Twitter" />
            </a>
            <a href="#" id="gmail">
                <img src="/pic/icon/Gmail.png" title="Gmail" />
            </a>
        </div>
        <div id="godown">
            <div class="danhMuc2">
                <div class="head">
                    <asp:Literal ID="ltrName2" runat="server"></asp:Literal>
                </div>
                <div class="content">
                    <ul>
                        <%--    <asp:PlaceHolder ID="ContentCottrai_top" runat="server"></asp:PlaceHolder>--%>
                        <asp:Literal ID="ltrDMSanPham2" runat="server"></asp:Literal>
                        <asp:Literal ID="ltrDMTinTuc2" runat="server"></asp:Literal>
                    </ul>
                </div>
            </div>
        </div>

        <%--      <div class="hoTro1 godown3">
        <div class="lifeAndmarketRight">
            <div class="titleitem" style="padding-left: 10px; color: white">
                Hot nhất trong ngày
                        <span></span>
            </div>
            <asp:Literal ID="lthotnhattrongngay" runat="server"></asp:Literal>
        </div>
    </div>--%>

        <div id="godown2"></div>
        <script>
            jQuery(document).ready(function () {
                var vitri = 920;
                var duration = 0;
                if (jQuery(this).scrollTop() < vitri) { jQuery('.hoTro1').fadeOut(duration); }

                jQuery(window).scroll(function () {
                    if (jQuery(this).scrollTop() > vitri && jQuery(this).scrollTop() < vitri - 370) {
                        jQuery('.hoTro1').fadeIn(duration);
                    } else {
                        jQuery('.hoTro1').fadeOut(duration);
                    }
                });

                //jQuery('.hoTro1').click(function (event) {
                //    event.preventDefault();
                //    jQuery('html, body').animate({ scrollTop: 0 }, duration);
                //    return false;
                //})
            });
        </script>
        <script>
            jQuery(document).ready(function () {
                var vitri = 220;
                var duration = 500;
                if (jQuery(this).scrollTop() < vitri) { jQuery('#go_top').fadeOut(duration); }

                jQuery(window).scroll(function () {
                    if (jQuery(this).scrollTop() > vitri) {
                        jQuery('#go_top').fadeIn(duration);
                    } else {
                        jQuery('#go_top').fadeOut(duration);
                    }
                });

                jQuery('#go_top').click(function (event) {
                    event.preventDefault();
                    jQuery('html, body').animate({ scrollTop: 0 }, duration);
                    return false;
                })
            });
        </script>
        <script>
            jQuery(document).ready(function () {
                var vitri = 10;
                var duration = 500;
                if (jQuery(this).scrollTop() < vitri) { jQuery('#CommunicationNetwork').fadeOut(duration); }

                jQuery(window).scroll(function () {
                    if (jQuery(this).scrollTop() > vitri) {
                        jQuery('#CommunicationNetwork').fadeIn(duration);
                    } else {
                        jQuery('#CommunicationNetwork').fadeOut(duration);
                    }
                });

                //jQuery('#CommunicationNetwork').click(function (event) {
                //    event.preventDefault();
                //    jQuery('html, body').animate({ scrollTop: 0 }, duration);
                //    return false;
                //})
            });
        </script>
        <script>
            jQuery(document).ready(function () {
                var vitri = 320;
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
        <div id="footer">
            <div class="container980">
                <div class="topfooter">
                    <div class="itemfooter">
                        <div class="titleitem">Vị trí<span></span></div>
                        <div class="diachi">
                            <div class="icondiachi">
                                <ul>
                                    <li><a href="#">
                                        <img src="/pic/icon/icon-truso.png" /></a></li>
                                    <li><a href="#">
                                        <img src="/pic/icon/icon-truso.png" /></a></li>
                                    <li><a href="#">
                                        <img src="/pic/icon/icon-factory.png" /></a></li>
                                </ul>
                            </div>
                            <div class="contentdiachi">
                                <ul>
                                    <li><a href="#">Trụ sở 1: 787 Đường Giải Phóng - Hoàng Mai - Hà Nội</a></li>
                                    <li><a href="#">Trụ sở 2: Số 568 Đường Láng - Đống Đa - Hà Nội</a></li>
                                    <li><a href="#">Trụ sở 3: Số 432 Đường Láng - Đống Đa - Hà Nội</a></li>
                                </ul>
                            </div>
                        </div>
                        <!--<div class="hinhanh">
                        <ul class="vitri">
                            <li>
                                <span>
                                    <img src="pic/AnhDoiTac/icon-truso.png" />
                                </span>
                            </li>
                            <li>
                                <span>
                                    <img src="pic/AnhDoiTac/icon-truso.png" />
                                </span>
                            </li>
                            <li>
                                <span>
                                    <img src="pic/AnhDoiTac/icon-factory.png" />
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="diachi">
                        <ul class="vitri">
                            <li>
                                <span>
                                    Trụ sở 1: 787 Đường Giải Phóng - Hoàng Mai - Hà Nội
                                </span>
                            </li>
                            <li>
                                <span>
                                    Trụ sở 2: Số 568 Đường Láng - Đống Đa - Hà Nội
                                </span>
                            </li>
                            <li>
                                <span>
                                    Nhà máy: Lô 1, Khu Công Nghiệp Tam Hiệp, Chu Lai, Quảng Nam
                                </span>
                            </li>
                        </ul>
                    </div>-->

                    </div>
                    <div class="itemfooter">
                        <div class="titleitem">Contact<span></span></div>
                        <ul class="lienlac">
                            <li>
                                <span>
                                    <img src="/pic/icon/icon-phone.png" />Tel: (04) 36649424 / 36649425
                                </span>
                            </li>
                            <li>
                                <span>
                                    <img src="/pic/icon/icon-email.png" />Email: contact@emdep.com.vn
                                </span>
                            </li>
                            <li>
                                <span>
                                    <img src="/pic/icon/icon-website.png" />Website: www.Emdep.vn
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="itemfooter">
                        <div class="titleitem">Danh mục sản phẩm<span></span></div>
                        <div class="danhmucsanpham">
                            <%--    <div class="sanpham">
                                <ul>
                                    <li><a href="#">Giày</a></li>
                                    <li><a href="#">Túi xách</a></li>
                                    <li><a href="#">Ghế ô tô</a></li>
                                    <li><a href="#">Sôfa</a></li>
                                </ul>
                            </div>
                            <div class="chatlieu1">
                                <ul>
                                    <li><a href="#">PVU</a></li>
                                    <li><a href="#">PVC</a></li>
                                    <li><a href="#">Microfiber</a></li>
                                </ul>
                            </div>--%>
                            <asp:Literal ID="ltrMenudanhmucfooter" runat="server"></asp:Literal>
                        </div>
                    </div>
                    <div class="itemfooter">
                        <div class="titleitem">
                            <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Femdep.vn%2F&tabs=timeline&width=270&height=213&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="270" height="213" style="border: none; overflow: hidden" scrolling="no" frameborder="0" allowtransparency="true"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footTer">
            <div class="bottomfooter">
                <div class="container980">
                    <ul class="fl">
                        <li>
                            <span>Bản quyền thuộc về Emdep.vn.
                            </span>
                        </li>
                        <li>
                            <img src="/pic/icon/b.png" /></li>
                        <li><span>Thiết kế website bởi Nguyễn Xuân Bích</span></li>
                    </ul>
                    <ul class="fr">
                        <li><span>Đang online: <b style="color: #efefef">--</b> - Tổng truy cập: <b style="color: #efefef">--</b></span></li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
