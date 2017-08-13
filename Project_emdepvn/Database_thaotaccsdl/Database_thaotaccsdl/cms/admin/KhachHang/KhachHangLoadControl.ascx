<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KhachHangLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.KhachHang.KhachHangLoadControl" %>
<div class="containerr">
    <div style="clear:both;height:20px"></div>
    <div class="cotTrai">
        <div class="head">Quản lý</div>
        <ul>
            <li><a class="<%=Check("KhachHang","DanhSachKhachHang") %>" href="Admin.aspx?module=KhachHang&action=DanhSachKhachHang">Danh sách KH đăng ký trên hệ thống</a></li>
        </ul>
        <div class="head">Thêm mới</div>
        <ul>
            <li><a class="<%=Check("KhachHang","ThemKhachHang") %>" href="Admin.aspx?module=KhachHang&action=ThemKhachHang">Thêm mới khách hàng</a></li>          
        </ul>
    </div>
    <div class="cotPhai">
        <asp:PlaceHolder ID="plKhachHangLoadControl" runat="server"></asp:PlaceHolder>
    </div>
</div>