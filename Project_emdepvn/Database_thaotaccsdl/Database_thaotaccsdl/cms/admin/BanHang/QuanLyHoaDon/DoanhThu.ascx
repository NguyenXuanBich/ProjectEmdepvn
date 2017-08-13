<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DoanhThu.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.BanHang.QuanLyHoaDon.DoanhThu" %>
<div class="head" style="color: red !important; text-align: center !important; text-transform: uppercase">Tổng hợp doanh thu chung của sản phẩm<a class="themmoi" href="/Admin.aspx?module=BanHang&submodule=QLHoaDon">Quay về</a></div>

<div class="khungChuaBang" style="font: normal 15px HelveticaNeue">

        <div class="thongTin" style="text-align: center;">
        <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
      Tổng lượng SP:
        </div>
        <div class="oNhap"style="float: right;">
            <asp:Label ID="lbtongsp" runat="server"></asp:Label>
        </div>
    </div>
    <div class="thongTin" style="text-align: center;">
        <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
            Số sản phẩm đã bán:
        </div>
        <div class="oNhap"style="float: right;">
            <asp:Label ID="lssospdatmua" runat="server"></asp:Label>
        </div>
    </div>
    <div class="thongTin" style="text-align: center;">
        <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
            Tổng giá nhập(tất cả):
        </div>
        <div class="oNhap"style="float: right;">
            <asp:Label ID="lbtonggianhap" runat="server"></asp:Label>
        </div>
    </div>
    <div class="thongTin" style="text-align: center;">
        <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
           Tổng thu nhập:
        </div>
        <div class="oNhap"style="float: right;">
            <asp:Label ID="tbtongthunhap" runat="server"></asp:Label>
        </div>
    </div>
    <div class="thongTin" style="text-align: center;">
        <div class="tenTruong" style="left: 300px; position: relative; text-align: right; color: blue">
            Lãi sau khi trừ chi phí:
        </div>
        <div class="oNhap"style="float: right;">
            <asp:Label ID="lblai" runat="server"></asp:Label>
        </div>
    </div>
</div>
