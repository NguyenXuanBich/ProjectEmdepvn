<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TinTucLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TinTuc.TinTucLoadControl" %>
<div class="containerr">
    <div style="clear: both; height: 20px"></div>

    <div class="cotTrai">
        <div class="head">
            Menu Tin Tức        
        </div>
        <ul>
            <li><a class="<%=Check("QLTinTuc","") %>" href="Admin.aspx?module=TinTuc&submodule=QLTinTuc">Quản lý danh sách tin tức</a></li>
            <li><a class="<%=Check("DanhMucTin","") %>" href="Admin.aspx?module=TinTuc&submodule=DanhMucTin">Quản lý danh mục tin tức</a></li>                    
        </ul>
        <div class="head">
            Thêm mới           
        </div>
        <ul>
            <li><a class="<%=Check("QLTinTuc","ThemMoi") %>" href="Admin.aspx?module=TinTuc&submodule=QLTinTuc&action=ThemMoi">Tin Tức</a></li>
            <li><a class="<%=Check("DanhMucTin","ThemMoi") %>" href="Admin.aspx?module=TinTuc&submodule=DanhMucTin&action=ThemMoi">Danh mục tin tức</a></li>                   
        </ul>
    </div>

    <div class="cotPhai">
        <asp:PlaceHolder ID="plTinTucLoadControl" runat="server"></asp:PlaceHolder>
    </div>
    <div style="clear: both"></div>
</div>
