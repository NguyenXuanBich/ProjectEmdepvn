<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SanPhamLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.SanPhamLoadControl" %>
<div class="containerr">
    <div style="clear: both; height: 20px"></div>

    <div class="cotTrai">
        <div class="head">
            Menu sản phẩm         
        </div>
        <ul>
            <li><a class="<%=Check("QLSanPham","") %>" href="Admin.aspx?module=SanPham&submodule=QLSanPham">Quản lý danh sách sản phẩm</a></li>
            <li><a class="<%=Check("DanhMuc","") %>" href="Admin.aspx?module=SanPham&submodule=DanhMuc">Quản lý danh mục sản phẩm</a></li>
            <li><a class="<%=Check("ChatLieu","") %>" href="Admin.aspx?module=SanPham&submodule=ChatLieu">Quản lý chất liệu</a></li>
            <li><a class="<%=Check("Mau","") %>" href="Admin.aspx?module=SanPham&submodule=Mau">Quản lý màu sắc sản phẩm</a></li>
            <li><a class="<%=Check("Size","") %>" href="Admin.aspx?module=SanPham&submodule=Size">Quản lý kích cỡ sản phẩm</a></li>
            <li><a class="<%=Check("Nhom","") %>" href="Admin.aspx?module=SanPham&submodule=Nhom">Quản lý nhóm sản phẩm</a></li>
            
        </ul>
        <div class="head">
            Thêm mới           
        </div>
        <ul>
            <li><a class="<%=Check("DanhMuc","ThemMoi") %>" href="Admin.aspx?module=SanPham&submodule=DanhMuc&action=ThemMoi">Danh Mục Sản Phẩm</a></li>
            <li><a class="<%=Check("QLSanPham","ThemMoi") %>" href="Admin.aspx?module=SanPham&submodule=QLSanPham&action=ThemMoi">Sản Phẩm</a></li>
            <li><a class="<%=Check("ChatLieu","ThemMoi") %>" href="Admin.aspx?module=SanPham&submodule=ChatLieu&action=ThemMoi">Chất Liệu</a></li>
            <li><a class="<%=Check("Mau","ThemMoi") %>" href="Admin.aspx?module=SanPham&submodule=Mau&action=ThemMoi">Màu Sản Phẩm</a></li>
            <li><a class="<%=Check("Size","ThemMoi") %>" href="Admin.aspx?module=SanPham&submodule=Size&action=ThemMoi">Kích cỡ Sản Phẩm</a></li>
            <li><a class="<%=Check("Nhom","ThemMoi") %>" href="Admin.aspx?module=SanPham&submodule=Nhom&action=ThemMoi">Nhóm Sản Phẩm</a></li>
            
        </ul>
    </div>

    <div class="cotPhai">
        <asp:PlaceHolder ID="plSanPhamLoadControl" runat="server"></asp:PlaceHolder>
    </div>
    <div style="clear: both"></div>
</div>



