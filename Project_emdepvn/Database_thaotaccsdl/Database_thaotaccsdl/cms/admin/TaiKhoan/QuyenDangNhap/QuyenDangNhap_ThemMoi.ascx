<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuyenDangNhap_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.TaiKhoan.QuyenDangNhap.QuyenDangNhap_ThemMoi" %>
<div class="head">
    Thêm mới, chỉnh sửa quyền
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    
    <div class="thongTin">
        <div class="tenTruong">Tên Quyền</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenQuyen" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenQuyen" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo quyền khác sau khi tạo quyền này" />
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
