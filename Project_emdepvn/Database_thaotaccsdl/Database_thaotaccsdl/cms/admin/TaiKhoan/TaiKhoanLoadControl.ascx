<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TaiKhoanLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TaiKhoan.TaiKhoanLoadControl" %>
<div class="containerr">
    <div style="clear:both;height:20px"></div>
    <div class="cotTrai">
        <div class="head">
            Menu Tài khoản        
        </div>
        <ul>
            <li><a class="<%=Check("QLTaiKhoan","") %>" href="Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan">Quản lý danh sách các TK</a></li>
            <li><a class="<%=Check("QuyenDangNhap","") %>" href="Admin.aspx?module=TaiKhoan&submodule=QuyenDangNhap">Quyền đăng nhập</a></li>            
        </ul>
        <div class="head">
            Thêm mới           
        </div>
        <ul>
            <li><a class="<%=Check("QuyenDangNhap","ThemMoi") %>" href="Admin.aspx?module=TaiKhoan&submodule=QuyenDangNhap&action=ThemMoi">Quyền đăng nhập</a></li>
            <li><a class="<%=Check("QLTaiKhoan","ThemMoi") %>" href="Admin.aspx?module=TaiKhoan&submodule=QLTaiKhoan&action=ThemMoi">Tài khoản</a></li>
            
        </ul>
    </div>
    <div class="cotPhai">
        <asp:PlaceHolder ID="plTaiKhoanLoadControl" runat="server"></asp:PlaceHolder>
    </div>
</div>