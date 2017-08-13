<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.Menu.Menu_ThemMoi" %>
<div class="head">
    Thêm mới, chỉnh sửa Menu trang người dùng
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    <div class="thongTin">
        <div class="tenTruong">Menu Cha</div>
        <div class="oNhap">
            <asp:DropDownList ID="dllmenucha" runat="server"></asp:DropDownList>
            <%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red"  ErrorMessage="*" ControlToValidate="dllDanhMucCha" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Tên Menu</div>
        <div class="oNhap">
            <asp:TextBox ID="tbtenmenu" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbtenmenu" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Link</div>
        <div class="oNhap">
            <asp:TextBox ID="tblink" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tblink" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Thứ tự</div>
        <div class="oNhap">
            <asp:TextBox ID="tbthutu" runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbthutu" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Thứ tự phải nhập kiểu số" ControlToValidate="tbthutu" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo danh mục khác sau khi tạo danh mục này" />
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
