<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BanHangLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.BanHang.BanHangLoadControl" %>
<div class="containerr">
    <div style="clear: both; height: 20px"></div>

    <div class="cotTrai">
        <div class="head">
            Menu quản lý      
        </div>
        <ul>
            <%--            <li><a class="<%=Check("QLChiTietDonDatHang","") %>" href="Admin.aspx?module=BanHang&submodule=QLChiTietDonDatHang">Quản lý chi tiết đơn đặt hàng</a></li>--%>
            <%--            <li><a class="<%=Check("QLChiTietDonHang","") %>" href="Admin.aspx?module=BanHang&submodule=QLChiTietDonHang">Quản lý chi tiết đơn hàng</a></li>--%>
            <li><a class="<%=Check("QLDonDatHang","") %>" href="Admin.aspx?module=BanHang&submodule=QLDonDatHang">Quản lý đơn đặt hàng</a></li>
            <li><a class="<%=Check("QLHoaDon","") %>" href="Admin.aspx?module=BanHang&submodule=QLHoaDon">Quản lý hóa đơn</a></li>
<%--            <li><a class="<%=Check("QLThongKe","") %>" href="Admin.aspx?module=BanHang&submodule=QLHoaDon&action=XemDoanhThu">Thống kê doanh thu</a></li>--%>


        </ul>
        <div class="head">
            Chi tiết          
        </div>
        <ul>
            <li><a class="<%=Check("QLDonDatHang","ChiTiet") %>" href="#">Chi tiết đơn đặt hàng</a></li>
            <li><a class="<%=Check("QLHoaDon","ChiTiet") %>" href="#">Chi tiết hóa đơn</a></li>
            <li><a class="<%=Check("QLDT","") %>" href="#">Doanh thu</a></li>

            <%--            <li><a class="<%=Check("QLChiTietDonHang","ThemMoi") %>" href="Admin.aspx?module=BanHang&submodule=QLChiTietDonHang&action=ThemMoi">Chi tiết hóa đơn</a></li>--%>
            <%--            <li><a class="<%=Check("QLDonDatHang","ThemMoi") %>" href="Admin.aspx?module=BanHang&submodule=QLDonDatHang&action=ThemMoi">Đơn đặt hàng</a></li>--%>
            <%--            <li><a class="<%=Check("QLHoaDon","ThemMoi") %>" href="Admin.aspx?module=BanHang&submodule=QLHoaDon&action=ThemMoi">Hóa đơn</a></li>--%>
        </ul>
    </div>

    <div class="cotPhai">
        <asp:PlaceHolder ID="plBanHangLoadControl" runat="server"></asp:PlaceHolder>
    </div>
    <div style="clear: both"></div>
</div>
