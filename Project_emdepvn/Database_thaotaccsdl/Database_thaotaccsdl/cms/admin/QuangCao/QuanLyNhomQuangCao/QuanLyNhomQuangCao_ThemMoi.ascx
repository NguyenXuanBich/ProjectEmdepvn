<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuanLyNhomQuangCao_ThemMoi.ascx.cs" Inherits="Database_thaotaccsdl.cms.admin.QuangCao.QuanLyNhomQuangCao.QuanLyNhomQuangCao_ThemMoi" %>
<div class="head">
    Thêm mới, chỉnh sửa Nhóm Quảng Cáo
</div>
<div class="formThemMoi">
    <asp:Literal ID="ltrthongbao" runat="server"></asp:Literal>

    <div class="thongTin">
        <div class="tenTruong">Tên nhóm quảng cáo</div>
        <div class="oNhap">
            <asp:TextBox ID="tbtennhomqc" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbtennhomqc" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Vị trí đặt quảng cáo</div>
        <div class="oNhap">
            <asp:TextBox ID="tbvitriqc" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="tbvitriqc" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>

        </div>
    </div>
    <div class="thongTin">
        <div class="tenTruong">Thứ tự Nhóm</div>
        <div class="oNhap">
            <asp:TextBox ID="btthutunhom" runat="server" MaxLength="4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="Không để trống" ControlToValidate="btthutunhom" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Thứ tự phải là số" ControlToValidate="btthutunhom" Display="Dynamic" SetFocusOnError="true" ForeColor="red" ValidationExpression="(\d)*"></asp:RegularExpressionValidator>

        </div>
    </div>

    <div class="thongTin">
        <div class="tenTruong">Ảnh Đại Diện</div>
        <div class="oNhap">
            <div>
                <asp:HiddenField ID="hdtenanhqccu" runat="server" />
                <asp:Literal ID="ltrAnhNhomQC" runat="server"></asp:Literal>
            </div>
            <div class="flAnhDaiDien">
                <asp:FileUpload ID="flAnhNhomQC" runat="server" />
            </div>
        </div>
    </div>


    <%-- tiếp tục tạo sau khi tạo thành công tin này--%>
    <div class="thongTin">
        <div class="tenTruong">&nbsp</div>
        <div class="oNhap">
            <asp:CheckBox ID="cbTiepTuc" runat="server" Text="Tiếp tục tạo thêm nhóm quảng cáo khác sau khi tạo thành công ?" />
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
