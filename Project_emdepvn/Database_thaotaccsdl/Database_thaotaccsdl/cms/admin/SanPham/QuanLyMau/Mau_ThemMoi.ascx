<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mau_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLyMau.Mau_ThemMoi" %>
<div class="head">
    Thêm mới, chỉnh sửa Màu
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    
    <div class="thongTin">
        <div class="tenTruong">Tên Màu</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenMau" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenMau" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo màu khác sau khi tạo màu này" />
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:Button ID="btThemMoi" runat="server" Text="Thêm mới" CssClass="btThemMoi" OnClick="btThemMoi_Click" />
            <asp:Button ID="btHuyBo" runat="server" Text="Hủy bỏ" CssClass="btHuyBo" OnClick="btHuyBo_Click" CausesValidation="false" />
        </div>
    </div>


</div>
