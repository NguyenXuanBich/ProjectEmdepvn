<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChatLieu_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLyChatLieu.ChatLieu_ThemMoi" %>
<div class="head">
    Thêm mới, chỉnh sửa chất liệu
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    
    <div class="thongTin">
        <div class="tenTruong">Tên Chất Liệu</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenChatLieu" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenChatLieu" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo chất liệu khác sau khi tạo chất liệu này" />
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
