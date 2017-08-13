<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NhomSanPham_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.SanPham.QuanLyNhomSanPham.NhomSanPham_ThemMoi" %>
<div class="head">
    Thêm mới, chỉnh sửa Nhóm sản phẩm 
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>
    <div class="thongTin">
        <div class="tenTruong">Tên Nhóm</div>
        <div class="oNhap">
            <asp:TextBox ID="tbTenNhom" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbTenNhom" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Ảnh Đại Diện</div>
        <div class="oNhap">
            <div>
                <asp:HiddenField ID="hdtenanhdaidiencu" runat="server" />
                <asp:Literal ID="ltrAnhDaiDien" runat="server"></asp:Literal>
            </div>
            <div class="flAnhDaiDien">
                <asp:FileUpload ID="flAnhDaiDien" runat="server" />
            </div>
            <%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="flAnhDaiDien" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Thứ Tự</div>
        <div class="oNhap">
            <asp:TextBox ID="tbThuTu" runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbThuTu" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Thứ tự phải nhập kiểu số" ControlToValidate="tbThuTu" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Số SP Hiển Thị</div>
        <div class="oNhap">
            <asp:TextBox ID="tbSoSP" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbSoSP" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Số SP phải nhập kiểu số" ControlToValidate="tbSoSP" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo Nhóm khác sau khi tạo Nhóm này" />
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
