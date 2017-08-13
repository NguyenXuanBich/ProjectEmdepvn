<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuangCaoLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.QuangCao.QuangCaoLoadControl" %>
<div class="containerr">
    <div style="clear: both; height: 20px"></div>

    <div class="cotTrai">
        <div class="head">
            Menu quảng cáo       
        </div>
        <ul>
            <li><a class="<%=Check("QLQuangCao","") %>" href="Admin.aspx?module=QuangCao&submodule=QLQuangCao">Quản lý danh sách quảng cáo</a></li>
            <li><a class="<%=Check("QLNhomQuangCao","") %>" href="Admin.aspx?module=QuangCao&submodule=QLNhomQuangCao">Quản lý nhóm quảng cáo</a></li>                       
        </ul>
        <div class="head">
            Thêm mới           
        </div>
        <ul>
            <li><a class="<%=Check("QLQuangCao","ThemMoi") %>" href="Admin.aspx?module=QuangCao&submodule=QLQuangCao&action=ThemMoi">Quảng cáo</a></li>
            <li><a class="<%=Check("QLNhomQuangCao","ThemMoi") %>" href="Admin.aspx?module=QuangCao&submodule=QLNhomQuangCao&action=ThemMoi">Nhóm quảng cáo</a></li>            
        </ul>
    </div>

    <div class="cotPhai">
        <asp:PlaceHolder ID="plQuangCaoLoadControl" runat="server"></asp:PlaceHolder>
    </div>
    <div style="clear: both"></div>
</div>

