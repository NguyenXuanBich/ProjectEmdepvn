<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistoryCustomer.aspx.cs" Inherits="Database_thaotaccsdl.HistoryCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lịch sử giao dịch</title>
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
                                document.write("<font id=timedate color=#808080></b>Chào mừng Quý khách hàng, bây giờ là: " + now.getHours() + ":" + now.getMinutes() + " phút -  " + dayName[now.getDay()] + ", " + now.getDate() + "-" + monName[now.getMonth()] + "-" + now.getFullYear() + "</b></font>")
                            </script>
                        </span>
                    </div>
                    <div class="accountMenu">
                        Kính chào quý khách hàng:
                        <asp:Literal ID="ltrTenDangNhap" runat="server"></asp:Literal>
                        |
                    <asp:LinkButton Style="color: #ff0000; font: bold" ID="lbtDangXuat" runat="server" OnClick="lbtBack_Click" CausesValidation="false" >Quay về Home</asp:LinkButton>
                    </div>
                </div>

            </div>
            <%-- End phần header--%>

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
            <asp:PlaceHolder ID="plLichSuLoadControl" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>

