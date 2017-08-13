<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.Menu.MenuLoadControl" %>
<div class="containerr">
    <div style="clear:both;height:20px"></div>
    <div class="cotTrai">
        <div class="head">Quản lý</div>
        <ul>
            <li><a class="<%=Check("Menu","DanhSachMenu") %>" href="Admin.aspx?module=Menu&action=DanhSachMenu">Danh sách Menu</a></li>
        </ul>
        <div class="head">Thêm mới</div>
        <ul>
            <li><a class="<%=Check("Menu","ThemMenu") %>" href="Admin.aspx?module=Menu&action=ThemMenu">Thêm Menu</a></li>          
        </ul>
    </div>
    <div class="cotPhai">
        <asp:PlaceHolder ID="plMenuLoadControl" runat="server"></asp:PlaceHolder>
    </div>
</div>