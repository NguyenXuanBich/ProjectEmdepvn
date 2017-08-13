<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TinTucLoadControl.ascx.cs" Inherits="Database_thaotaccsdl.GiaodienUser.TinTuc.TinTucLoadControl" %>
<script src="../../cms/admin/js/jquery-1.11.3.min.js"></script>
<link href="../../cms/admin/css/Default.css" rel="stylesheet" />
<%--Cột Trái--%>
<div class="cotTrai">
    <div class="danhMuc">
        <div class="head">
            <asp:Literal ID="ltrName" runat="server"></asp:Literal>
        </div>
        <div class="content">
            <ul>
                <%--    <asp:PlaceHolder ID="ContentCottrai_top" runat="server"></asp:PlaceHolder>--%>
                <asp:Literal ID="ltrDMSanPham" runat="server"></asp:Literal>
                <asp:Literal ID="ltrDMTinTuc" runat="server"></asp:Literal>
            </ul>
        </div>
    </div>
    <div class="hoTro">
        <div class="lifeAndmarketRight">
            <div class="titleitem" style="padding-left: 10px; color: white">
                Hot nhất trong ngày
                        <span></span>
            </div>
            <asp:Literal ID="lthotnhattrongngay" runat="server"></asp:Literal>
        </div>
    </div>
</div>
<%--End cột trái--%>

<%--Cột phải--%>
<div class="cotPhai">
    <asp:PlaceHolder ID="TinTucLoadCT" runat="server"></asp:PlaceHolder>
</div>

<%--End cột phải--%>