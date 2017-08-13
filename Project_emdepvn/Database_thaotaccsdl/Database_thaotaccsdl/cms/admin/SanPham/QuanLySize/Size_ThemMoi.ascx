<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Size_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLySize.Size_ThemMoi" %>
<div class="head">
    Thêm mới, chỉnh sửa SIZE
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    
    <div class="thongTin">
        <div class="tenTruong">Tên Size</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenSize" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenSize" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo size khác sau khi đã thêm thành công" />
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